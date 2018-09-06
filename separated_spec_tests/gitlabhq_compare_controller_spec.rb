require 'spec_helper'

describe Projects::CompareController do
  let(:project) { create(:project, :repository) }
  let(:user) { create(:user) }

  before do
    sign_in(user)
    project.add_master(user)
  end

  describe 'GET index' do
    render_views

    before do
      get :index, namespace_id: project.namespace, project_id: project
    end

    it 'returns successfully' 

  end

  describe 'GET show' do
    render_views

    subject(:show_request) { get :show, request_params }

    let(:request_params) do
      {
        namespace_id: project.namespace,
        project_id: project,
        from: source_ref,
        to: target_ref,
        w: whitespace
      }
    end

    let(:whitespace) { nil }

    context 'when the refs exist' do
      context 'when we set the white space param' do
        let(:source_ref) { "08f22f25" }
        let(:target_ref) { "66eceea0" }
        let(:whitespace) { 1 }

        it 'shows some diffs with ignore whitespace change option' 

      end

      context 'when we do not set the white space param' do
        let(:source_ref) { "improve%2Fawesome" }
        let(:target_ref) { "feature" }
        let(:whitespace) { nil }

        it 'sets the diffs and commits ivars' 

      end
    end

    context 'when the source ref does not exist' do
      let(:source_ref) { 'non-existent-source-ref' }
      let(:target_ref) { "feature" }

      it 'sets empty diff and commit ivars' 

    end

    context 'when the target ref does not exist' do
      let(:target_ref) { 'non-existent-target-ref' }
      let(:source_ref) { "improve%2Fawesome" }

      it 'sets empty diff and commit ivars' 

    end
  end

  describe 'GET diff_for_path' do
    def diff_for_path(extra_params = {})
      params = {
        namespace_id: project.namespace,
        project_id: project
      }

      get :diff_for_path, params.merge(extra_params)
    end

    let(:existing_path) { 'files/ruby/feature.rb' }
    let(:source_ref) { "improve%2Fawesome" }
    let(:target_ref) { "feature" }

    context 'when the source and target refs exist' do
      context 'when the user has access target the project' do
        context 'when the path exists in the diff' do
          it 'disables diff notes' 


          it 'only renders the diffs for the path given' 

        end

        context 'when the path does not exist in the diff' do
          before do
            diff_for_path(from: source_ref, to: target_ref, old_path: existing_path.succ, new_path: existing_path.succ)
          end

          it 'returns a 404' 

        end
      end

      context 'when the user does not have access target the project' do
        before do
          project.team.truncate
          diff_for_path(from: source_ref, to: target_ref, old_path: existing_path, new_path: existing_path)
        end

        it 'returns a 404' 

      end
    end

    context 'when the source ref does not exist' do
      before do
        diff_for_path(from: source_ref.succ, to: target_ref, old_path: existing_path, new_path: existing_path)
      end

      it 'returns a 404' 

    end

    context 'when the target ref does not exist' do
      before do
        diff_for_path(from: source_ref, to: target_ref.succ, old_path: existing_path, new_path: existing_path)
      end

      it 'returns a 404' 

    end
  end

  describe 'POST create' do
    subject(:create_request) { post :create, request_params }

    let(:request_params) do
      {
        namespace_id: project.namespace,
        project_id: project,
        from: source_ref,
        to: target_ref
      }
    end

    context 'when sending valid params' do
      let(:source_ref) { "improve%2Fawesome" }
      let(:target_ref) { "feature" }

      it 'redirects back to show' 

    end

    context 'when sending invalid params' do
      context 'when the source ref is empty and target ref is set' do
        let(:source_ref) { '' }
        let(:target_ref) { 'master' }

        it 'redirects back to index and preserves the target ref' 

      end

      context 'when the target ref is empty and source ref is set' do
        let(:source_ref) { 'master' }
        let(:target_ref) { '' }

        it 'redirects back to index and preserves source ref' 

      end

      context 'when the target and source ref are empty' do
        let(:source_ref) { '' }
        let(:target_ref) { '' }

        it 'redirects back to index' 

      end
    end
  end

  describe 'GET signatures' do
    subject(:signatures_request) { get :signatures, request_params }

    let(:request_params) do
      {
        namespace_id: project.namespace,
        project_id: project,
        from: source_ref,
        to: target_ref,
        format: :json
      }
    end

    context 'when the source and target refs exist' do
      let(:source_ref) { "improve%2Fawesome" }
      let(:target_ref) { "feature" }

      context 'when the user has access to the project' do
        render_views

        let(:signature_commit) { build(:commit, project: project, safe_message: "message", sha: 'signature_commit') }
        let(:non_signature_commit) { build(:commit, project: project, safe_message: "message", sha: 'non_signature_commit') }

        before do
          escaped_source_ref = Addressable::URI.unescape(source_ref)
          escaped_target_ref = Addressable::URI.unescape(target_ref)

          compare_service = CompareService.new(project, escaped_target_ref)
          compare = compare_service.execute(project, escaped_source_ref)

          expect(CompareService).to receive(:new).with(project, escaped_target_ref).and_return(compare_service)
          expect(compare_service).to receive(:execute).with(project, escaped_source_ref).and_return(compare)

          expect(compare).to receive(:commits).and_return([signature_commit, non_signature_commit])
          expect(non_signature_commit).to receive(:has_signature?).and_return(false)
        end

        it 'returns only the commit with a signature' 

      end

      context 'when the user does not have access to the project' do
        before do
          project.team.truncate
        end

        it 'returns a 404' 

      end
    end

    context 'when the source ref does not exist' do
      let(:source_ref) { 'non-existent-ref-source' }
      let(:target_ref) { "feature" }

      it 'returns no signatures' 

    end

    context 'when the target ref does not exist' do
      let(:target_ref) { 'non-existent-ref-target' }
      let(:source_ref) { "improve%2Fawesome" }

      it 'returns no signatures' 

    end
  end
end

