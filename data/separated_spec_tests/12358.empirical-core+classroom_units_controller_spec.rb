require 'rails_helper'

describe Teachers::ClassroomUnitsController, type: :controller do
  it { should use_before_filter :authorize! }
  it { should use_before_filter :teacher! }

  let(:classroom) { create(:classroom)}
  let(:teacher) { classroom.owner }
  let(:classroom_unit) { create(:classroom_unit, classroom_id: classroom.id)}
  let(:classroom_unit2) { create(:classroom_unit, classroom_id: classroom.id, unit_id: classroom_unit.unit.id)}
  let(:classroom_unit3) { create(:classroom_unit, classroom_id: classroom.id, unit_id: classroom_unit.unit.id)}
  let!(:activity_classification) { create(:lesson) }
  let!(:activity) { create(:activity, activity_classification_id: activity_classification.id ) }

  before do
    allow(controller).to receive(:current_user) { teacher }
  end
#
  describe '#launch_lesson' do
    let!(:milestone) { create(:milestone, name: "View Lessons Tutorial") }

    before do
      # stubbing custom validation on creation of activity session
      allow_any_instance_of(ClassroomUnit).to receive(:validate_assigned_student) { true }
      allow(PusherLessonLaunched).to receive(:run) { true }
      classroom_unit.update(assigned_student_ids: [create(:student).id, create(:student).id])
    end

    context 'when milestone exists and activity got updated' do
      let!(:user_milestone) { create(:user_milestone, milestone: milestone, user: teacher) }
      let!(:unit_activity) { create(:unit_activity, activity: activity, unit: classroom_unit.unit)}
      let!(:cuas) { create(:classroom_unit_activity_state, unit_activity: unit_activity, classroom_unit: classroom_unit)}

      let(:customize_lesson_url) { "#{activity.classification_form_url}customize/#{activity.uid}?&classroom_unit_id=#{classroom_unit.id}"}

      context 'when activity session exists' do
        let!(:activity_session) { create(:activity_session, classroom_unit_id: classroom_unit.id, state: "started") }
        let(:teach_class_url) { "#{activity.classification_form_url}teach/class-lessons/#{activity.uid}?&classroom_unit_id=#{classroom_unit.id}" }

        it 'should redirect to teach class lessons url' 

      end

      it 'should redirect_to customize lesson url' 


      it 'should kick of the pusher lesson worker and update the classroom unit activity state' 

    end

    context 'when milestone exists and activity could not get updated' do
      let!(:user_milestone) { create(:user_milestone, milestone: milestone, user: teacher) }

      before do
        allow_any_instance_of(ClassroomUnit).to receive(:update) { false }
      end

      it 'should redirect back to the referrer' 

    end

    # setting flash value without redirecting is throwing a missing partial error
    # context 'when milestone does not exist' do
      # it 'should set flash error' do
      #   get :launch_lesson, id: classroom_unit.id, lesson_uid: activity.uid, format: :json
      #   expect(flash[:error]).to eq "We cannot launch this lesson. If the problem persists, please contact support."
      # end
    # end
  end
  describe '#lessons_activities_cache' do
    before do
      allow(teacher).to receive(:set_and_return_lessons_cache_data) { {id: "not 10"} }
    end

    context 'when value is present in the cache' do
      before do
        $redis.set("user_id:#{teacher.id}_lessons_array", {id: 10}.to_json)
      end

      it 'should render the redis cache' 

    end

    it 'should render the current users lesson cache data' 

  end

  describe '#lessons_units_and_activities' do
    before do
      $redis.set("user_id:#{teacher.id}_lessons_array", [{ activity_id: 10, activity_name: "some name", completed: false }].to_json)
    end

    it 'should return the activity id in the cache' 

  end

end

