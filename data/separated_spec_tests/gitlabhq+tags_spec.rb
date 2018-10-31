require 'spec_helper'

describe API::Tags do
  let(:user) { create(:user) }
  let(:guest) { create(:user).tap { |u| project.add_guest(u) } }
  let(:project) { create(:project, :repository, creator: user, path: 'my.project') }
  let(:tag_name) { project.repository.find_tag('v1.1.0').name }

  let(:project_id) { project.id }
  let(:current_user) { nil }

  before do
    project.add_maintainer(user)
  end

  describe 'GET /projects/:id/repository/tags' do
    let(:route) { "/projects/#{project_id}/repository/tags" }

    context 'sorting' do
      let(:current_user) { user }

      it 'sorts by descending order by default' 


      it 'sorts by ascending order if specified' 


      it 'sorts by name in descending order when requested' 


      it 'sorts by name in ascending order when requested' 

    end

    shared_examples_for 'repository tags' do
      it 'returns the repository tags' 


      context 'when repository is disabled' do
        include_context 'disabled repository'

        it_behaves_like '403 response' do
          let(:request) { get api(route, current_user) }
        end
      end
    end

    context 'when unauthenticated', 'and project is public' do
      let(:project) { create(:project, :public, :repository) }

      it_behaves_like 'repository tags'
    end

    context 'when unauthenticated', 'and project is private' do
      it_behaves_like '404 response' do
        let(:request) { get api(route) }
        let(:message) { '404 Project Not Found' }
      end
    end

    context 'when authenticated', 'as a maintainer' do
      let(:current_user) { user }

      it_behaves_like 'repository tags'

      context 'requesting with the escaped project full path' do
        let(:project_id) { CGI.escape(project.full_path) }

        it_behaves_like 'repository tags'
      end
    end

    context 'when authenticated', 'as a guest' do
      it_behaves_like '403 response' do
        let(:request) { get api(route, guest) }
      end
    end

    context 'with releases' do
      let(:description) { 'Awesome release!' }

      before do
        release = project.releases.find_or_initialize_by(tag: tag_name)
        release.update(description: description)
      end

      it 'returns an array of project tags with release info' 

    end
  end

  describe 'GET /projects/:id/repository/tags/:tag_name' do
    let(:route) { "/projects/#{project_id}/repository/tags/#{tag_name}" }

    shared_examples_for 'repository tag' do
      it 'returns the repository branch' 


      context 'when tag does not exist' do
        let(:tag_name) { 'unknown' }

        it_behaves_like '404 response' do
          let(:request) { get api(route, current_user) }
          let(:message) { '404 Tag Not Found' }
        end
      end

      context 'when repository is disabled' do
        include_context 'disabled repository'

        it_behaves_like '403 response' do
          let(:request) { get api(route, current_user) }
        end
      end
    end

    context 'when unauthenticated', 'and project is public' do
      let(:project) { create(:project, :public, :repository) }

      it_behaves_like 'repository tag'
    end

    context 'when unauthenticated', 'and project is private' do
      it_behaves_like '404 response' do
        let(:request) { get api(route) }
        let(:message) { '404 Project Not Found' }
      end
    end

    context 'when authenticated', 'as a maintainer' do
      let(:current_user) { user }

      it_behaves_like 'repository tag'

      context 'requesting with the escaped project full path' do
        let(:project_id) { CGI.escape(project.full_path) }

        it_behaves_like 'repository tag'
      end
    end

    context 'when authenticated', 'as a guest' do
      it_behaves_like '403 response' do
        let(:request) { get api(route, guest) }
      end
    end
  end

  describe 'POST /projects/:id/repository/tags' do
    let(:tag_name) { 'new_tag' }
    let(:route) { "/projects/#{project_id}/repository/tags" }

    shared_examples_for 'repository new tag' do
      it 'creates a new tag' 


      context 'when repository is disabled' do
        include_context 'disabled repository'

        it_behaves_like '403 response' do
          let(:request) { post api(route, current_user) }
        end
      end
    end

    context 'when unauthenticated', 'and project is private' do
      it_behaves_like '404 response' do
        let(:request) { post api(route) }
        let(:message) { '404 Project Not Found' }
      end
    end

    context 'when authenticated', 'as a guest' do
      it_behaves_like '403 response' do
        let(:request) { post api(route, guest) }
      end
    end

    context 'when authenticated', 'as a maintainer' do
      let(:current_user) { user }

      context "when a protected branch doesn't already exist" do
        it_behaves_like 'repository new tag'

        context 'when tag contains a dot' do
          let(:tag_name) { 'v7.0.1' }

          it_behaves_like 'repository new tag'
        end

        context 'requesting with the escaped project full path' do
          let(:project_id) { CGI.escape(project.full_path) }

          it_behaves_like 'repository new tag'

          context 'when tag contains a dot' do
            let(:tag_name) { 'v7.0.1' }

            it_behaves_like 'repository new tag'
          end
        end
      end

      it 'returns 400 if tag name is invalid' 


      it 'returns 400 if tag already exists' 


      it 'returns 400 if ref name is invalid' 


      context 'lightweight tags with release notes' do
        it 'creates a new tag' 

      end

      context 'annotated tag' do
        it 'creates a new annotated tag' 

      end
    end
  end

  describe 'DELETE /projects/:id/repository/tags/:tag_name' do
    let(:route) { "/projects/#{project_id}/repository/tags/#{tag_name}" }

    before do
      allow_any_instance_of(Repository).to receive(:rm_tag).and_return(true)
    end

    shared_examples_for 'repository delete tag' do
      it 'deletes a tag' 


      it_behaves_like '412 response' do
        let(:request) { api(route, current_user) }
      end

      context 'when tag does not exist' do
        let(:tag_name) { 'unknown' }

        it_behaves_like '404 response' do
          let(:request) { delete api(route, current_user) }
          let(:message) { '404 Tag Not Found' }
        end
      end

      context 'when repository is disabled' do
        include_context 'disabled repository'

        it_behaves_like '403 response' do
          let(:request) { delete api(route, current_user) }
        end
      end
    end

    context 'when authenticated', 'as a maintainer' do
      let(:current_user) { user }

      it_behaves_like 'repository delete tag'

      context 'requesting with the escaped project full path' do
        let(:project_id) { CGI.escape(project.full_path) }

        it_behaves_like 'repository delete tag'
      end
    end
  end

  describe 'POST /projects/:id/repository/tags/:tag_name/release' do
    let(:route) { "/projects/#{project_id}/repository/tags/#{tag_name}/release" }
    let(:description) { 'Awesome release!' }

    shared_examples_for 'repository new release' do
      it 'creates description for existing git tag' 


      context 'when tag does not exist' do
        let(:tag_name) { 'unknown' }

        it_behaves_like '404 response' do
          let(:request) { post api(route, current_user), description: description }
          let(:message) { 'Tag does not exist' }
        end
      end

      context 'when repository is disabled' do
        include_context 'disabled repository'

        it_behaves_like '403 response' do
          let(:request) { post api(route, current_user), description: description }
        end
      end
    end

    context 'when authenticated', 'as a maintainer' do
      let(:current_user) { user }

      it_behaves_like 'repository new release'

      context 'requesting with the escaped project full path' do
        let(:project_id) { CGI.escape(project.full_path) }

        it_behaves_like 'repository new release'
      end

      context 'on tag with existing release' do
        before do
          release = project.releases.find_or_initialize_by(tag: tag_name)
          release.update(description: description)
        end

        it 'returns 409 if there is already a release' 

      end
    end
  end

  describe 'PUT id/repository/tags/:tag_name/release' do
    let(:route) { "/projects/#{project_id}/repository/tags/#{tag_name}/release" }
    let(:description) { 'Awesome release!' }
    let(:new_description) { 'The best release!' }

    shared_examples_for 'repository update release' do
      context 'on tag with existing release' do
        before do
          release = project.releases.find_or_initialize_by(tag: tag_name)
          release.update(description: description)
        end

        it 'updates the release description' 

      end

      context 'when tag does not exist' do
        let(:tag_name) { 'unknown' }

        it_behaves_like '404 response' do
          let(:request) { put api(route, current_user), description: new_description }
          let(:message) { 'Tag does not exist' }
        end
      end

      context 'when repository is disabled' do
        include_context 'disabled repository'

        it_behaves_like '403 response' do
          let(:request) { put api(route, current_user), description: new_description }
        end
      end
    end

    context 'when authenticated', 'as a maintainer' do
      let(:current_user) { user }

      it_behaves_like 'repository update release'

      context 'requesting with the escaped project full path' do
        let(:project_id) { CGI.escape(project.full_path) }

        it_behaves_like 'repository update release'
      end

      context 'when release does not exist' do
        it_behaves_like '404 response' do
          let(:request) { put api(route, current_user), description: new_description }
          let(:message) { 'Release does not exist' }
        end
      end
    end
  end
end

