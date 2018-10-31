require('spec_helper')

describe Projects::ProjectMembersController do
  let(:user) { create(:user) }
  let(:project) { create(:project, :public, :access_requestable) }

  describe 'GET index' do
    it 'should have the project_members address with a 200 status code' 

  end

  describe 'POST create' do
    let(:project_user) { create(:user) }

    before do
      sign_in(user)
    end

    context 'when user does not have enough rights' do
      before do
        project.add_developer(user)
      end

      it 'returns 404' 

    end

    context 'when user has enough rights' do
      before do
        project.add_master(user)
      end

      it 'adds user to members' 


      it 'adds no user to members' 

    end
  end

  describe 'PUT update' do
    let(:requester) { create(:project_member, :access_request, project: project) }

    before do
      project.add_master(user)
      sign_in(user)
    end

    Gitlab::Access.options.each do |label, value|
      it "can change the access level to #{label}" 

    end
  end

  describe 'DELETE destroy' do
    let(:member) { create(:project_member, :developer, project: project) }

    before do
      sign_in(user)
    end

    context 'when member is not found' do
      it 'returns 404' 

    end

    context 'when member is found' do
      context 'when user does not have enough rights' do
        before do
          project.add_developer(user)
        end

        it 'returns 404' 

      end

      context 'when user has enough rights' do
        before do
          project.add_master(user)
        end

        it '[HTML] removes user from members' 


        it '[JS] removes user from members' 

      end
    end
  end

  describe 'DELETE leave' do
    before do
      sign_in(user)
    end

    context 'when member is not found' do
      it 'returns 404' 

    end

    context 'when member is found' do
      context 'and is not an owner' do
        before do
          project.add_developer(user)
        end

        it 'removes user from members' 

      end

      context 'and is an owner' do
        let(:project) { create(:project, namespace: user.namespace) }

        before do
          project.add_master(user)
        end

        it 'cannot remove himself from the project' 

      end

      context 'and is a requester' do
        before do
          project.request_access(user)
        end

        it 'removes user from members' 

      end
    end
  end

  describe 'POST request_access' do
    before do
      sign_in(user)
    end

    it 'creates a new ProjectMember that is not a team member' 

  end

  describe 'POST approve' do
    let(:member) { create(:project_member, :access_request, project: project) }

    before do
      sign_in(user)
    end

    context 'when member is not found' do
      it 'returns 404' 

    end

    context 'when member is found' do
      context 'when user does not have enough rights' do
        before do
          project.add_developer(user)
        end

        it 'returns 404' 

      end

      context 'when user has enough rights' do
        before do
          project.add_master(user)
        end

        it 'adds user to members' 

      end
    end
  end

  describe 'POST apply_import' do
    let(:another_project) { create(:project, :private) }
    let(:member) { create(:user) }

    before do
      project.add_master(user)
      another_project.add_guest(member)
      sign_in(user)
    end

    shared_context 'import applied' do
      before do
        post(:apply_import, namespace_id: project.namespace,
                            project_id: project,
                            source_project_id: another_project.id)
      end
    end

    context 'when user can access source project members' do
      before do
        another_project.add_guest(user)
      end

      include_context 'import applied'

      it 'imports source project members' 

    end

    context 'when user is not member of a source project' do
      include_context 'import applied'

      it 'does not import team members' 


      it 'responds with not found' 

    end
  end

  describe 'POST create' do
    let(:stranger) { create(:user) }

    context 'when creating owner' do
      before do
        project.add_master(user)
        sign_in(user)
      end

      it 'does not create a member' 

    end

    context 'when create master' do
      before do
        project.add_master(user)
        sign_in(user)
      end

      it 'creates a member' 

    end
  end
end

