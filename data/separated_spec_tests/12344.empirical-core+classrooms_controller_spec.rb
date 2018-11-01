require 'rails_helper'

describe Teachers::ClassroomsController, type: :controller do
  it { should use_before_filter :teacher! }
  it { should use_before_filter :authorize_owner! }
  it { should use_before_filter :authorize_teacher! }

  describe 'creating a classroom' do
    let(:teacher) { create(:teacher) }
    let(:classroom_attributes) {attributes_for(:classroom)}

    before do
      session[:user_id] = teacher.id # sign in, is there a better way to do this in test?
    end

    it 'kicks off a background job' 


    it 'responds with a json object representing the classroom' 


    it 'should render toInviteStudents true when there are no students but the teacher has units' 


    it 'should render toInviteStudents false when there are students in the classroom' 


    it 'should render toInviteStudents false when the teacher has no units' 


    it 'displays the form' 

  end

  describe 'creating a login pdf' do

    let(:teacher) { create(:teacher) }
    let(:different_classroom) { create(:classroom) }
    let(:different_teacher) { different_classroom.owner }

    before do
      session[:user_id] = teacher.id
    end

    it 'does not allow teacher unauthorized access to other PDFs' 

  end

  describe '#transfer_ownership' do
    let!(:classroom)         { create(:classroom) }
    let!(:owner)             { classroom.owner }
    let!(:valid_coteacher)   { create(:coteacher_classrooms_teacher, classroom: classroom).user }
    let!(:unaffiliated_user) { create(:teacher) }

    it 'does not allow transferring a classroom not owned by current user' 


    it 'does not allow transferring a classroom to a teacher who is not already a coteacher' 


    it 'transfers ownership to a coteacher' 


    context 'segment IO tracking' do
      let(:analyzer) { double(:analyzer, track_with_attributes: true) }

      before do
        allow(Analyzer).to receive(:new) { analyzer }
      end

      it 'should track the ownership transfer' 

    end
  end

  describe '#index' do
    let(:teacher) { create(:teacher) }

    before do
      allow(controller).to receive(:current_user) { teacher }
    end

    context 'when current user has no classrooms i teach, archived classrooms and outstanding teacher invitation' do
      before do
        allow(teacher).to receive(:classrooms_i_teach) { [] }
        allow(teacher).to receive(:has_outstanding_coteacher_invitation?) { false }
        allow(teacher).to receive(:archived_classrooms) { [] }
      end

      it 'should redirect to new classroom path' 

    end

    context 'when current user has classrooms i teach' do
      let(:classroom) { create(:classroom) }

      before do
        allow(teacher).to receive(:classrooms_i_teach) { [classroom] }
      end

      it 'should assign the classrooms and classroom' 

    end
  end

  describe '#classroom_i_teach' do
    let(:teacher) { create(:teacher) }
    let(:classroom) { create(:classroom) }

    before do
      allow(teacher).to receive(:classrooms_i_teach) { [classroom] }
      allow(controller).to receive(:current_user) { teacher }
    end

    it 'should give the classroom i teach for the current user' 

  end

  describe '#regenerate_code' do
    let(:teacher) { create(:teacher) }

    before do
      allow(controller).to receive(:current_user) { teacher }
      allow(Classroom).to receive(:generate_unique_code) { "unique code" }
    end

    it 'should give the new code' 

  end

  describe '#update' do
    let!(:classroom) { create(:classroom) }
    let(:teacher) { classroom.owner }

    before do
      allow(controller).to receive(:current_user) { teacher }
    end

    it 'should update the given classroom' 

  end

  describe '#destroy' do
    let!(:classroom) { create(:classroom) }
    let(:teacher) { classroom.owner }

    before do
      allow(controller).to receive(:current_user) { teacher }
    end

    it 'should destroy the given classroom' 

  end

  describe '#hide' do
    let!(:classroom) { create(:classroom) }
    let(:teacher) { classroom.owner }

    before do
      allow(controller).to receive(:current_user) { teacher }
    end

    it 'should hide the classroom' 

  end

  describe '#unhide' do
    let!(:classroom) { create(:classroom) }
    let(:teacher) { classroom.owner }

    before do
      allow(controller).to receive(:current_user) { teacher }
    end

    it 'should unhide the classroom' 

  end

  describe '#units' do
    let!(:classroom) { create(:classroom) }
    let(:teacher) { classroom.owner }

    before do
      allow(controller).to receive(:current_user) { teacher }
      allow_any_instance_of(Classroom).to receive(:units_json) { "units" }
    end

    it 'should give the correct json' 

  end
end

