require 'rails_helper'

describe Teachers::UnitsController, type: :controller do
  it { should use_before_filter :teacher! }
  it { should use_before_filter :authorize! }

  let!(:student) {create(:student)}
  let!(:classroom) { create(:classroom_with_students_and_activities, students: [student]) }
  let!(:teacher) { classroom.owner }
  let!(:unit) {create(:unit, user: teacher)}
  let!(:unit2) {create(:unit, user: teacher)}
  let!(:classroom_unit) { create(:classroom_unit,
    unit: unit,
    classroom: classroom,
    assigned_student_ids: [student.id]
  )}
  let!(:unit_activity) { create(:unit_activity, unit: unit)}

  before do
    session[:user_id] = teacher.id
  end

  describe '#create' do
    it 'kicks off a background job' 

  end

  describe '#prohibited_unit_names' do
    let(:unit_names) { teacher.units.pluck(:name).map(&:downcase) }
    let(:unit_template_names) { UnitTemplate.pluck(:name).map(&:downcase) }

    it 'should render the correct json' 

  end

  describe '#last_assigned_unit_id' do
    it 'should render the current json' 

  end

  describe '#lesson_info_for_activity' do
    context 'when activities present' do
      let(:activities) { classroom.activities }

      before do
        allow(controller).to receive(:get_classroom_units_for_activity) { activities }
      end

      it 'should render the correct json' 

    end

    context 'when activities not present' do
      before do
        allow(controller).to receive(:get_classroom_units_for_activity) { [] }
      end

      it 'should render the correct json' 

    end

  end

  describe '#diagnostic_units' do
    before do
      # return unit on the first call and unit2 on the second call
      allow(ActiveRecord::Base.connection).to receive(:execute).and_return([unit.attributes.merge({"activity_classification_id" => "4"})], [unit2.attributes.merge({"activity_classification_id" => '2'})])
    end

    it 'should render the correct json' 

  end

  # the find line is commented out
  # describe '#destroy' do
  #   it 'should make the unit invisible' do
  #     expect(unit.visible).to eq true
  #     delete :destroy, id: unit.id
  #     expect(unit.reload.visible).to eq false
  #   end
  # end

  describe '#index' do
    let!(:activity) {create(:activity)}
    let!(:classroom_unit) {create(:classroom_unit, unit: unit, classroom: classroom, assigned_student_ids: [student.id])}
    let!(:unit_activity) {create(:unit_activity, due_date: Time.now, unit: unit, activity: activity)}
    let!(:activity_session) {create(:activity_session,
      activity: activity,
      user: student,
      state: 'finished',
      classroom_unit: classroom_unit
    )}

    it 'should return json in the appropriate format' 


    # TODO write a VCR-like test to check when this request returns something other than what we expect.
  end

  describe '#update' do

    it 'sends a 200 status code when a unique name is sent over' 


    it 'sends a 422 error code when a non-unique name is sent over' 

  end

  describe '#classrooms_with_students_and_classroom_units' do

    it "returns #get_classrooms_with_students_and_classroom_units when it is passed a valid unit id" 



    it "sends a 422 error code when it is not passed a valid unit id" 


  end

  describe '#update_classroom_unit_assigned_students' do

    it "sends a 200 status code when it is passed valid data" 


    it "sends a 422 status code when it is passed invalid data" 


  end

  describe '#update_activities' do

    it "sends a 200 status code when it is passed valid data" 


    it "sends a 422 status code when it is passed invalid data" 

  end

  describe '#select_lesson_with_activity_id' do
    let!(:activity) { create(:lesson_activity) }

    before(:each) do
      ClassroomUnit.destroy_all
      UnitActivity.destroy_all
      session['user_id'] = classroom_unit.classroom.owner.id
    end

    it 'should redirect to a lessons index if there are no lessons' 


    it 'should redirect to the lesson if there is only one lesson' 


    it 'should redirect to a lessons index if there are multiple lessons' 

  end

end

