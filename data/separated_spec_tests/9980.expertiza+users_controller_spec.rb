describe UsersController do
  let(:admin) { build(:admin, id: 3) }
  let(:super_admin) {build (:superadmin)}
  let(:instructor) { build(:instructor, id: 2) }
  let(:student1) { build(:student, id: 1, name: :lily) }
  let(:student2) { build(:student) }
  let(:student3) { build(:student, id: 10, role_id: 1, parent_id: nil) }
  let(:student4) { build(:student, id: 20, role_id: 4) }
  let(:student5) { build(:student, role_id: 4, parent_id: 3) }
  let(:student6) { build(:student, role_id: nil, name: :lilith)}

  let(:institution1) {build(:institution, id: 1)}
  let(:requested_user1) {RequestedUser.new id: 4, name: 'requester1', role_id: 2, fullname: 're, requester1', 
    institution_id: 1, email: 'requester1@test.com', status: nil, self_introduction: 'no one'}
  let(:superadmin) {build(:superadmin)}
  let(:assignment) {build(:assignment, id: 1, name: "test_assignment", instructor_id: 2, 
    participants: [build(:participant, id: 1, user_id: 1, assignment: assignment)], course_id: 1)}
  before(:each) do
    stub_current_user(instructor, instructor.role.name, instructor.role)
  end

  context '#index' do
    it 'redirects if user is student' 


    it 'renders list if user is instructor' 

  end

  context '#set_anonymized_view' do
    it 'redirects to back' 

  end

  context "#list_pending_requested" do
    it 'test list_pednign_requested view' 

  end

  context "#show_selection" do
    before(:each) do
      allow(User).to receive(:find).with(2).and_return(instructor)
    end
    it 'user is nil' 


    it 'user is not nil and user is available for editing' 


    it 'user is not nil but is not available for editing' 

  end

  context '#show' do
    it 'when params[:id] is not nil' 


    it 'when params[:id] is not nil but role_id is nil' 


    it 'when params[:id] is nil' 

  end

  context "#new" do
    it '1' 

  end

  context "#request new" do
    it '1' 

  end

  context "#create" do
    before(:each) do
      allow(User).to receive(:find).with(3).and_return(admin)
    end
    it 'save successfully with email as name' 


    it 'save successfully without the same name' 


    it 'save unsuccessfully' 

  end

  context "#create_requested_user_record" do
    it 'if user not exists and requested user is saved' 


    it 'if user exists' 


    it 'if requested user is not saved' 


    it 'if user not exists, requested user is saved and params[:user][:institution_id] is empty' 

  end

  context "#create_approved_user" do
    before(:each) do
      allow(RequestedUser).to receive(:find_by).with(id: "4").and_return(requested_user1)
      allow(User).to receive(:find_by).with(id: 3).and_return(admin)
    end

    it 'the input status is nil and original status is nil' 


    it 'the input status is Approved' 


    it 'the input status is Approved but save fails' 


    it 'the input status is Rejected' 


    it 'the input status is Rejected but update_colums fails' 

  end

  context '#edit' do
    it 'renders users#edit page' 

  end

  context '#update' do
    it 'when user is updated successfully' 

    it 'when user is not updated successfully' 

  end

  context '#destroy' do
    it 'when user is not deleted successfully' 

  end

  context '#keys' do
    before(:each) do
      stub_current_user(student1, student1.role.name, student1.role)
    end
    it 'when params[:id] is not nil' 

    it 'when params[:id] is nil' 

  end
end

