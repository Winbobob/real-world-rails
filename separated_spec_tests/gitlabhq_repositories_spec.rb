require 'spec_helper'
require 'mime/types'

describe API::V3::Repositories do
  include RepoHelpers
  include WorkhorseHelpers

  let(:user) { create(:user) }
  let(:guest) { create(:user).tap { |u| create(:project_member, :guest, user: u, project: project) } }
  let!(:project) { create(:project, :repository, creator: user) }
  let!(:master) { create(:project_member, :master, user: user, project: project) }

  describe "GET /projects/:id/repository/tree" do
    let(:route) { "/projects/#{project.id}/repository/tree" }

    shared_examples_for 'repository tree' do
      it 'returns the repository tree' 


      context 'when ref does not exist' do
        it_behaves_like '404 response' do
          let(:request) { get v3_api("#{route}?ref_name=foo", current_user) }
          let(:message) { '404 Tree Not Found' }
        end
      end

      context 'when repository is disabled' do
        include_context 'disabled repository'

        it_behaves_like '403 response' do
          let(:request) { get v3_api(route, current_user) }
        end
      end

      context 'with recursive=1' do
        it 'returns recursive project paths tree' 


        context 'when repository is disabled' do
          include_context 'disabled repository'

          it_behaves_like '403 response' do
            let(:request) { get v3_api(route, current_user) }
          end
        end

        context 'when ref does not exist' do
          it_behaves_like '404 response' do
            let(:request) { get v3_api("#{route}?recursive=1&ref_name=foo", current_user) }
            let(:message) { '404 Tree Not Found' }
          end
        end
      end
    end

    context 'when unauthenticated', 'and project is public' do
      it_behaves_like 'repository tree' do
        let(:project) { create(:project, :public, :repository) }
        let(:current_user) { nil }
      end
    end

    context 'when unauthenticated', 'and project is private' do
      it_behaves_like '404 response' do
        let(:request) { get v3_api(route) }
        let(:message) { '404 Project Not Found' }
      end
    end

    context 'when authenticated', 'as a developer' do
      it_behaves_like 'repository tree' do
        let(:current_user) { user }
      end
    end

    context 'when authenticated', 'as a guest' do
      it_behaves_like '403 response' do
        let(:request) { get v3_api(route, guest) }
      end
    end
  end

  [
    ['blobs/:sha', 'blobs/master'],
    ['blobs/:sha', 'blobs/v1.1.0'],
    ['commits/:sha/blob', 'commits/master/blob']
  ].each do |desc_path, example_path|
    describe "GET /projects/:id/repository/#{desc_path}" do
      let(:route) { "/projects/#{project.id}/repository/#{example_path}?filepath=README.md" }
      shared_examples_for 'repository blob' do
        it 'returns the repository blob' 

        context 'when sha does not exist' do
          it_behaves_like '404 response' do
            let(:request) { get v3_api("/projects/#{project.id}/repository/#{desc_path.sub(':sha', 'invalid_branch_name')}?filepath=README.md", current_user) }
            let(:message) { '404 Commit Not Found' }
          end
        end
        context 'when filepath does not exist' do
          it_behaves_like '404 response' do
            let(:request) { get v3_api(route.sub('README.md', 'README.invalid'), current_user) }
            let(:message) { '404 File Not Found' }
          end
        end
        context 'when no filepath is given' do
          it_behaves_like '400 response' do
            let(:request) { get v3_api(route.sub('?filepath=README.md', ''), current_user) }
          end
        end
        context 'when repository is disabled' do
          include_context 'disabled repository'
          it_behaves_like '403 response' do
            let(:request) { get v3_api(route, current_user) }
          end
        end
      end
      context 'when unauthenticated', 'and project is public' do
        it_behaves_like 'repository blob' do
          let(:project) { create(:project, :public, :repository) }
          let(:current_user) { nil }
        end
      end
      context 'when unauthenticated', 'and project is private' do
        it_behaves_like '404 response' do
          let(:request) { get v3_api(route) }
          let(:message) { '404 Project Not Found' }
        end
      end
      context 'when authenticated', 'as a developer' do
        it_behaves_like 'repository blob' do
          let(:current_user) { user }
        end
      end
      context 'when authenticated', 'as a guest' do
        it_behaves_like '403 response' do
          let(:request) { get v3_api(route, guest) }
        end
      end
    end
  end
  describe "GET /projects/:id/repository/raw_blobs/:sha" do
    let(:route) { "/projects/#{project.id}/repository/raw_blobs/#{sample_blob.oid}" }
    shared_examples_for 'repository raw blob' do
      it 'returns the repository raw blob' 

      context 'when sha does not exist' do
        it_behaves_like '404 response' do
          let(:request) { get v3_api(route.sub(sample_blob.oid, '123456'), current_user) }
          let(:message) { '404 Blob Not Found' }
        end
      end
      context 'when repository is disabled' do
        include_context 'disabled repository'
        it_behaves_like '403 response' do
          let(:request) { get v3_api(route, current_user) }
        end
      end
    end
    context 'when unauthenticated', 'and project is public' do
      it_behaves_like 'repository raw blob' do
        let(:project) { create(:project, :public, :repository) }
        let(:current_user) { nil }
      end
    end
    context 'when unauthenticated', 'and project is private' do
      it_behaves_like '404 response' do
        let(:request) { get v3_api(route) }
        let(:message) { '404 Project Not Found' }
      end
    end
    context 'when authenticated', 'as a developer' do
      it_behaves_like 'repository raw blob' do
        let(:current_user) { user }
      end
    end
    context 'when authenticated', 'as a guest' do
      it_behaves_like '403 response' do
        let(:request) { get v3_api(route, guest) }
      end
    end
  end
  describe "GET /projects/:id/repository/archive(.:format)?:sha" do
    let(:route) { "/projects/#{project.id}/repository/archive" }
    shared_examples_for 'repository archive' do
      it 'returns the repository archive' 

      it 'returns the repository archive archive.zip' 

      it 'returns the repository archive archive.tar.bz2' 

      context 'when sha does not exist' do
        it_behaves_like '404 response' do
          let(:request) { get v3_api("#{route}?sha=xxx", current_user) }
          let(:message) { '404 File Not Found' }
        end
      end
    end
    context 'when unauthenticated', 'and project is public' do
      it_behaves_like 'repository archive' do
        let(:project) { create(:project, :public, :repository) }
        let(:current_user) { nil }
      end
    end
    context 'when unauthenticated', 'and project is private' do
      it_behaves_like '404 response' do
        let(:request) { get v3_api(route) }
        let(:message) { '404 Project Not Found' }
      end
    end
    context 'when authenticated', 'as a developer' do
      it_behaves_like 'repository archive' do
        let(:current_user) { user }
      end
    end
    context 'when authenticated', 'as a guest' do
      it_behaves_like '403 response' do
        let(:request) { get v3_api(route, guest) }
      end
    end
  end

  describe 'GET /projects/:id/repository/compare' do
    let(:route) { "/projects/#{project.id}/repository/compare" }
    shared_examples_for 'repository compare' do
      it "compares branches" 

      it "compares tags" 

      it "compares commits" 

      it "compares commits in reverse order" 

      it "compares same refs" 

    end
    context 'when unauthenticated', 'and project is public' do
      it_behaves_like 'repository compare' do
        let(:project) { create(:project, :public, :repository) }
        let(:current_user) { nil }
      end
    end
    context 'when unauthenticated', 'and project is private' do
      it_behaves_like '404 response' do
        let(:request) { get v3_api(route) }
        let(:message) { '404 Project Not Found' }
      end
    end
    context 'when authenticated', 'as a developer' do
      it_behaves_like 'repository compare' do
        let(:current_user) { user }
      end
    end
    context 'when authenticated', 'as a guest' do
      it_behaves_like '403 response' do
        let(:request) { get v3_api(route, guest) }
      end
    end
  end

  describe 'GET /projects/:id/repository/contributors' do
    let(:route) { "/projects/#{project.id}/repository/contributors" }

    shared_examples_for 'repository contributors' do
      it 'returns valid data' 

    end

    context 'when unauthenticated', 'and project is public' do
      it_behaves_like 'repository contributors' do
        let(:project) { create(:project, :public, :repository) }
        let(:current_user) { nil }
      end
    end

    context 'when unauthenticated', 'and project is private' do
      it_behaves_like '404 response' do
        let(:request) { get v3_api(route) }
        let(:message) { '404 Project Not Found' }
      end
    end

    context 'when authenticated', 'as a developer' do
      it_behaves_like 'repository contributors' do
        let(:current_user) { user }
      end
    end

    context 'when authenticated', 'as a guest' do
      it_behaves_like '403 response' do
        let(:request) { get v3_api(route, guest) }
      end
    end
  end
end

