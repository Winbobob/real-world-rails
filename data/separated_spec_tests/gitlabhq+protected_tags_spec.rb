require 'spec_helper'

describe API::ProtectedTags do
  let(:user) { create(:user) }
  let!(:project) { create(:project, :repository) }
  let(:project2) { create(:project, path: 'project2', namespace: user.namespace) }
  let(:protected_name) { 'feature' }
  let(:tag_name) { protected_name }
  let!(:protected_tag) do
    create(:protected_tag, project: project, name: protected_name)
  end

  describe 'GET /projects/:id/protected_tags' do
    let(:route) { "/projects/#{project.id}/protected_tags" }

    shared_examples_for 'protected tags' do
      it 'returns the protected tags' 

    end

    context 'when authenticated as a maintainer' do
      before do
        project.add_maintainer(user)
      end

      it_behaves_like 'protected tags'
    end

    context 'when authenticated as a guest' do
      before do
        project.add_guest(user)
      end

      it_behaves_like '403 response' do
        let(:request) { get api(route, user) }
      end
    end
  end

  describe 'GET /projects/:id/protected_tags/:tag' do
    let(:route) { "/projects/#{project.id}/protected_tags/#{tag_name}" }

    shared_examples_for 'protected tag' do
      it 'returns the protected tag' 


      context 'when protected tag does not exist' do
        let(:tag_name) { 'unknown' }

        it_behaves_like '404 response' do
          let(:request) { get api(route, user) }
          let(:message) { '404 Not found' }
        end
      end
    end

    context 'when authenticated as a maintainer' do
      before do
        project.add_maintainer(user)
      end

      it_behaves_like 'protected tag'

      context 'when protected tag contains a wildcard' do
        let(:protected_name) { 'feature*' }

        it_behaves_like 'protected tag'
      end
    end

    context 'when authenticated as a guest' do
      before do
        project.add_guest(user)
      end

      it_behaves_like '403 response' do
        let(:request) { get api(route, user) }
      end
    end
  end

  describe 'POST /projects/:id/protected_tags' do
    let(:tag_name) { 'new_tag' }

    context 'when authenticated as a maintainer' do
      before do
        project.add_maintainer(user)
      end

      it 'protects a single tag with maintainers can create tags' 


      it 'protects a single tag with developers can create tags' 


      it 'protects a single tag with no one can create tags' 


      it 'returns a 422 error if the same tag is protected twice' 


      it 'returns 201 if the same tag is proteted on different projects' 


      context 'when tag has a wildcard in its name' do
        let(:tag_name) { 'feature/*' }

        it 'protects multiple tags with a wildcard in the name' 

      end
    end

    context 'when authenticated as a guest' do
      before do
        project.add_guest(user)
      end

      it 'returns a 403 error if guest' 

    end
  end

  describe 'DELETE /projects/:id/protected_tags/unprotect/:tag' do
    before do
      project.add_maintainer(user)
    end

    it 'unprotects a single tag' 


    it_behaves_like '412 response' do
      let(:request) { api("/projects/#{project.id}/protected_tags/#{tag_name}", user) }
    end

    it "returns 404 if tag does not exist" 


    context 'when tag has a wildcard in its name' do
      let(:protected_name) { 'feature*' }

      it 'unprotects a wildcard tag' 

    end
  end
end

