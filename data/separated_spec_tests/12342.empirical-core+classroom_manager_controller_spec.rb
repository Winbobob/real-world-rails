require 'rails_helper'

describe Teachers::ClassroomManagerController, type: :controller do

  it { should use_before_filter :teacher_or_public_activity_packs }
  it { should use_before_filter :authorize_owner! }
  it { should use_before_filter :authorize_teacher! }

  describe '#archived_classroom_manager_data' do
    it 'returns all invited, archived, and nonarchived classrooms' 

  end

  describe '#lesson_planner' do
    let!(:teacher) { create(:classrooms_teacher, user: user) }
    let(:user) { create(:teacher, first_name: "test") }

    before do
      allow(controller).to receive(:current_user) { user }
    end

    context 'when classrooms i teach are empty' do
      before do
        allow(user).to receive(:classrooms_i_teach) { [] }
      end

      it 'should redirect to new teachers classroom path' 

    end

    context 'when classrooms i teach are not empty' do
      it 'should assign the tab, grade, students, last_classroom_name and last_lassroom_id' 

    end
  end

  describe '#assign_activities' do
    let!(:teacher) { create(:classrooms_teacher, user: user, role: "owner") }
    let(:user) { create(:teacher, first_name: "test") }

    before do
      allow(controller).to receive(:current_user) { user }
    end

    context 'when current user is not staff and has no classrooms i teach' do
      before do
        allow(user).to receive(:classrooms_i_teach) { [] }
      end

      it 'should redirect to new teachers classroom path' 

    end

    context 'when current user is staff or has classrooms i teach' do
      context 'when user is staff' do
        before do
          user.role = "staff"
        end

        it 'should assign the tab, grade, students, last_classroom_name and last_classroom_id' 

      end

      context 'when user has classrooms i teach' do
        it 'should assign the tab, grade, students, last_classroom_name and last_classroom_id' 

      end
    end
  end

  describe '#generic_add_students' do
    let(:student) { create(:student) }
    let(:teacher) { create(:teacher) }

    # the before filter authorize_teacher! redirects the user so this branch is never traversed
    # context 'when current is not a teacher' do
    #   before do
    #     allow(controller).to receive(:current_user) { student }
    #   end
    #
    #   it 'should redirect to profile path' do
    #     get :generic_add_students
    #     expect(response).to redirect_to profile_path
    #   end
    # end

    context 'when current user is a teacher' do
      before do
        allow(controller).to receive(:current_user) { teacher }
      end

      it 'should assign the classroom and redirect to profile path' 

    end
  end

  describe '#retrieve_classrooms_for_assigning_activities' do
    let(:teacher) { create(:teacher) }
    let(:classroom) { create(:classroom) }

    before do
      allow(teacher).to receive(:classrooms_i_own) { [classroom] }
      allow(controller).to receive(:current_user) { teacher }
    end

    it 'should return the correct json' 

  end

  describe '#retreive_classrooms_i_teach_for_custom_assigning_activities' do
    let(:teacher) { create(:teacher) }
    let(:classroom) { create(:classroom) }

    before do
      allow(teacher).to receive(:classrooms_i_teach) { [classroom] }
      allow(controller).to receive(:current_user) { teacher }
    end

    it 'should return the correct json' 

  end

  describe '#invite_students' do
    let(:teacher) { create(:teacher) }
    let(:classroom) { create(:classroom) }

    before do
      allow(teacher).to receive(:classrooms_i_teach) { [classroom] }
      allow(controller).to receive(:current_user) { teacher }
    end

    it 'should assign the classrooms and user' 

  end

  describe '#manage_archived_classrooms' do
    let(:teacher) { create(:teacher) }
    let(:classroom) { create(:classroom) }

    before do
      allow(teacher).to receive(:classrooms_i_teach) { [classroom] }
      allow(controller).to receive(:current_user) { teacher }
    end

    it 'should render the archived classroom manager template' 

  end

  describe '#archived_classroom_manager_data' do
    let(:teacher) { create(:teacher) }
    let(:classroom) { create(:classroom) }

    before do
      allow(teacher).to receive(:classrooms_i_teach) { [classroom] }
      allow(controller).to receive(:current_user) { teacher }
      allow(ActiveRecord::Base.connection).to receive(:execute).and_return([classroom])
    end

    it 'should render the correct json' 

  end

  describe '#scorebook' do
    let(:teacher) { create(:teacher) }
    let(:classroom) { create(:classroom) }
    let(:classroom1) { create(:classroom) }

    before do
      allow(controller).to receive(:current_user) { teacher }
      allow(ActiveRecord::Base.connection).to receive(:execute).and_return([classroom, classroom1])
      allow(controller).to receive(:classroom_teacher!) { true }
    end

    context 'when classroom id is passed' do
      it 'should assign the classrooms and classroom' 

    end

    context 'when classroom id is not passed' do
      it 'should assign the classrooms and classroom' 

    end
  end

  describe '#dashboard' do
    let(:teacher) { create(:teacher) }

    before do
      allow(controller).to receive(:current_user) { teacher }
    end

    context 'when current user has no classrooms i teach and no archived classrooms and no outstanding coteacher invitation' do
      before do
        allow(teacher).to receive(:classrooms_i_teach) { [] }
        allow(teacher).to receive(:archived_classrooms) { [] }
        allow(teacher).to receive(:has_outstanding_coteacher_invitation?) { false }
      end

      it 'should redirect to new teachers classroom path' 

    end

    context 'when current user has classrooms i teach/archived classrooms/has outstanding coteacher invitation' do
      before do
        allow(teacher).to receive(:classrooms_i_teach) { [] }
        allow(teacher).to receive(:archived_classrooms) { [] }
        allow(teacher).to receive(:has_outstanding_coteacher_invitation?) { true }
      end

      it 'should set the firewall test to true' 

    end
  end

  describe '#students_list' do
    let(:teacher) { create(:teacher_with_a_couple_classrooms_with_a_couple_students_each) }
    let(:classroom) { teacher.classrooms_i_teach.first }

    before do
      allow(controller).to receive(:current_user) { teacher }
    end

    it 'should assign the classroom and render the correct json' 

  end

  describe '#premium' do
    let(:teacher) { create(:teacher) }

    before do
      allow(controller).to receive(:current_user) { teacher }
      allow(teacher).to receive(:trial_days_remaining) { 10 }
      allow(teacher).to receive(:premium_updated_or_created_today?) { true }
      allow(teacher).to receive(:premium_state) { "some subscription" }
    end

    it 'should set the subscription type and return the correct json' 

  end

  describe '#classroom_mini' do
    let(:teacher) { create(:teacher) }

    before do
      allow(controller).to receive(:current_user) { teacher }
      allow(teacher).to receive(:get_classroom_minis_info) { "some class info" }
    end

    it 'should render the correct json' 

  end

  describe '#teacher_guide' do
    let(:teacher) { create(:teacher) }

    before do
      allow(controller).to receive(:current_user) { teacher }
    end

    it 'should assing the checkbox data' 

  end

  describe '#getting_started' do
    let(:teacher) { create(:teacher) }

    before do
      allow(controller).to receive(:current_user) { teacher }
    end

    it 'should render the correct json' 

  end

  describe '#scores' do
    let(:teacher) { create(:teacher) }

    before do
      allow(controller).to receive(:current_user) { teacher }
      allow(Scorebook::Query).to receive(:run) { [1, 2, 3] }
    end

    it 'should render the correct json' 

  end

  describe '#my_account_data' do
    let(:teacher) { create(:teacher) }

    before do
      allow(controller).to receive(:current_user) { teacher }
    end

    it 'should render the correct json' 

  end

  describe '#retreive_google_clasrooms' do
    let(:teacher) { create(:teacher) }

    before do
      allow(controller).to receive(:current_user) { teacher }
      allow(GoogleIntegration::Classroom::Main).to receive(:pull_data) { "google response" }
    end

    it 'should render the correct json' 

  end

  describe '#import_google_students' do
    let(:teacher) { create(:teacher) }

    before do
      allow(controller).to receive(:current_user) { teacher }
      allow(GoogleIntegration::Classroom::Main).to receive(:pull_data) { "google response" }
    end

    it 'should kick off the importer' 

  end

  describe '#dashboard_query' do
    let(:teacher) { create(:teacher) }
    
    before do
      allow(Dashboard).to receive(:queries) { "queries" }
      allow(controller).to receive(:current_user) { teacher }
    end

    it 'should render the dashboard query' 

  end

  describe '#update_my_account' do
    let(:teacher) { create(:teacher) }

    before do
      allow(controller).to receive(:current_user) { teacher }
    end

    it 'should give the updated teacher' 

  end
end

