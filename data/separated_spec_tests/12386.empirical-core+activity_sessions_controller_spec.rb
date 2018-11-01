require 'rails_helper'

describe ActivitySessionsController, type: :controller do
  it { should use_before_action :activity_session_from_id }
  it { should use_before_action :activity_session_from_uid }
  it { should use_before_action :activity_session_for_update }
  it { should use_before_action :activity }
  it { should use_before_action :activity_session_authorize! }
  it { should use_before_action :activity_session_authorize_teacher! }
  it { should use_after_action :update_student_last_active }

  let!(:activity) { create(:activity) }
  let!(:classroom) { create(:classroom)}
  let!(:user1) { create(:user, classcode: classroom.code) }
  let!(:cu) { create(:classroom_unit, classroom: classroom, assigned_student_ids: [user1.id])}
  let!(:ua) { create(:unit_activity, unit: cu.unit, activity: activity)}
  let!(:activity_session) { create(:activity_session, user: user1, activity: activity, classroom_unit: cu, state: 'unstarted') }
  let(:user) { create(:staff) }

  before do
    allow(controller).to receive(:current_user) { user }
  end


  describe '#play' do
    context 'when the activity classification id is 6' do
      let(:url) { "#{ENV['FIREBASE_DATABASE_URL']}/v2/classroom_lesson_sessions/#{cu.id}/students.json" }
      let(:body) { {"#{activity_session.uid}": user.name}.to_json }

      before do
        allow(HTTParty).to receive(:patch) { true }
        allow_any_instance_of(Activity).to receive(:activity_classification_id) { 6 }
      end

      it 'should set the module url' 


      it 'should call the http patch method' 

    end

    context 'when the activity classification id is not 6' do
      before do
        allow_any_instance_of(Activity).to receive(:activity_classification_id) { 3 }
      end
      it 'should redirect to module url' 

    end
  end

  describe '#result' do
    it 'should set the activity results classroom_id' 

  end

  describe '#anonymous' do
    context 'activity with classification key lessons' do
      before do
        allow_any_instance_of(ActivityClassification).to receive(:key) { "lessons" }
      end

      it 'should assign the activity' 


      it 'should redirect to preview lesson url' 

    end

    context 'activity without classification key lessons' do
      before do
        allow_any_instance_of(ActivityClassification).to receive(:key) { "not lessons" }
      end

      it 'should redirect to anonymous module url' 

    end
  end

  describe '#activity_session_from_classroom_unit_and_activity' do
    let(:student) { create(:student) }
    let(:activity_session_url) { "/activity_sessions/#{ActivitySession.find_or_create_started_activity_session(student.id, cu.id, activity.id).id}/play" }

    before do
      allow(controller).to receive(:current_user) { student }
      student.classrooms << classroom
    end

    it 'should redirect to the correct activity session url' 

  end

end

