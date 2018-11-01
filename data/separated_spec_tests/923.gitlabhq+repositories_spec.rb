require 'spec_helper'
require 'mime/types'

describe API::Repositories do
  include RepoHelpers
  include WorkhorseHelpers

  let(:user) { create(:user) }
  let(:guest) { create(:user).tap { |u| create(:project_member, :guest, user: u, project: project) } }
  let!(:project) { create(:project, :repository, creator: user) }
  let!(:maintainer) { create(:project_member, :maintainer, user: user, project: project) }

  describe "GET /projects/:id/repository/tree" do
    let(:route) { "/projects/#{project.id}/repository/tree" }

    shared_examples_for 'repository tree' do
      it 'returns the repository tree' 


      context 'when ref does not exist' do
        it_behaves_like '404 response' do
          let(:request) { get api("#{route}?ref=foo", current_user) }
          let(:message) { '404 Tree Not Found' }
        end
      end

      context 'when repository is disabled' do
        include_context 'disabled repository'

        it_behaves_like '403 response' do
          let(:request) { get api(route, current_user) }
        end
      end

      context 'with recursive=1' do
        it 'returns recursive project paths tree' 


        context 'when repository is disabled' do
          include_context 'disabled repository'

          it_behaves_like '403 response' do
            let(:request) { get api(route, current_user) }
          end
        end

        context 'when ref does not exist' do
          it_behaves_like '404 response' do
            let(:request) { get api("#{route}?recursive=1&ref=foo", current_user) }
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
        let(:request) { get api(route) }
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
        let(:request) { get api(route, guest) }
      end
    end
  end

  describe "GET /projects/:id/repository/blobs/:sha" do
    let(:route) { "/projects/#{project.id}/repository/blobs/#{sample_blob.oid}" }

    shared_examples_for 'repository blob' do
      it 'returns blob attributes as json' 


      context 'when sha does not exist' do
        it_behaves_like '404 response' do
          let(:request) { get api(route.sub(sample_blob.oid, '123456'), current_user) }
          let(:message) { '404 Blob Not Found' }
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
      it_behaves_like 'repository blob' do
        let(:project) { create(:project, :public, :repository) }
        let(:current_user) { nil }
      end
    end

    context 'when unauthenticated', 'and project is private' do
      it_behaves_like '404 response' do
        let(:request) { get api(route) }
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
        let(:request) { get api(route, guest) }
      end
    end
  end

  describe "GET /projects/:id/repository/blobs/:sha/raw" do
    let(:route) { "/projects/#{project.id}/repository/blobs/#{sample_blob.oid}/raw" }

    shared_examples_for 'repository raw blob' do
      it 'returns the repository raw blob' 


      context 'when sha does not exist' do
        it_behaves_like '404 response' do
          let(:request) { get api(route.sub(sample_blob.oid, '123456'), current_user) }
          let(:message) { '404 Blob Not Found' }
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
      it_behaves_like 'repository raw blob' do
        let(:project) { create(:project, :public, :repository) }
        let(:current_user) { nil }
      end
    end

    context 'when unauthenticated', 'and project is private' do
      it_behaves_like '404 response' do
        let(:request) { get api(route) }
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
        let(:request) { get api(route, guest) }
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
          let(:request) { get api("#{route}?sha=xxx", current_user) }
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
        let(:request) { get api(route) }
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
        let(:request) { get api(route, guest) }
      end
    end
  end

  describe 'GET /projects/:id/repository/compare' do
    let(:route) { "/projects/#{project.id}/repository/compare" }

    shared_examples_for 'repository compare' do
      it "compares branches" 


      it "compares branches with explicit merge-base mode" 


      it "compares branches with explicit straight mode" 


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
        let(:request) { get api(route) }
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
        let(:request) { get api(route, guest) }
      end
    end
  end

  describe 'GET /projects/:id/repository/contributors' do
    let(:route) { "/projects/#{project.id}/repository/contributors" }

    shared_examples_for 'repository contributors' do
      it 'returns valid data' 


      context 'using sorting' do
        context 'by commits desc' do
          it 'returns the repository contribuors sorted by commits desc' 

        end

        context 'by name desc' do
          it 'returns the repository contribuors sorted by name asc case insensitive' 

        end
      end
    end

    context 'when unauthenticated', 'and project is public' do
      it_behaves_like 'repository contributors' do
        let(:project) { create(:project, :public, :repository) }
        let(:current_user) { nil }
      end
    end

    context 'when unauthenticated', 'and project is private' do
      it_behaves_like '404 response' do
        let(:request) { get api(route) }
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
        let(:request) { get api(route, guest) }
      end
    end

    # Regression: https://gitlab.com/gitlab-org/gitlab-ce/issues/45363
    describe 'Links header contains working URLs when no `order_by` nor `sort` is given' do
      let(:project) { create(:project, :public, :repository) }
      let(:current_user) { nil }

      it 'returns `Link` header that includes URLs with default value for `order_by` & `sort`' 

    end
  end

  describe 'GET :id/repository/merge_base' do
    let(:refs) do
      %w(304d257dcb821665ab5110318fc58a007bd104ed 0031876facac3f2b2702a0e53a26e89939a42209 570e7b2abdd848b95f2f578043fc23bd6f6fd24d)
    end

    subject(:request) do
      get(api("/projects/#{project.id}/repository/merge_base", current_user), refs: refs)
    end

    shared_examples 'merge base' do
      it 'returns the common ancestor' 

    end

    context 'when unauthenticated', 'and project is public' do
      it_behaves_like 'merge base' do
        let(:project) { create(:project, :public, :repository) }
        let(:current_user) { nil }
      end
    end

    context 'when unauthenticated', 'and project is private' do
      it_behaves_like '404 response' do
        let(:current_user) { nil }
        let(:message) { '404 Project Not Found' }
      end
    end

    context 'when authenticated', 'as a developer' do
      it_behaves_like 'merge base' do
        let(:current_user) { user }
      end
    end

    context 'when authenticated', 'as a guest' do
      it_behaves_like '403 response' do
        let(:current_user) { guest }
      end
    end

    context 'when passing refs that do not exist' do
      it_behaves_like '400 response' do
        let(:refs) { %w(304d257dcb821665ab5110318fc58a007bd104ed missing) }
        let(:current_user) { user }
        let(:message) { 'Could not find ref: missing' }
      end
    end

    context 'when passing refs that do not have a merge base' do
      it_behaves_like '404 response' do
        let(:refs) { ['304d257dcb821665ab5110318fc58a007bd104ed', TestEnv::BRANCH_SHA['orphaned-branch']] }
        let(:current_user) { user }
        let(:message) { '404 Merge Base Not Found' }
      end
    end

    context 'when not enough refs are passed' do
      let(:refs) { %w(only-one) }
      let(:current_user) { user }

      it 'renders a bad request error' 

    end
  end
end

