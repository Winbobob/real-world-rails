require 'rails_helper'

describe ProgressReports::DistrictConceptReports do
  describe '#results' do
    let!(:school) { create(:school) }
    let!(:teacher) { create(:teacher) }
    let!(:admin) { create(:admin) }
    let!(:classroom) { create(:classroom) }
    let!(:student) { create(:student) }
    let!(:schools_admins) { create(:schools_admins, school: school, user: admin) }
    let!(:schools_users) { create(:schools_users, school: school, user: teacher) }
    let!(:classrooms_teacher) { create(:classrooms_teacher, user: teacher, role: "owner", classroom: classroom) }
    let!(:classroom_unit) { create(:classroom_unit, classroom: classroom, assigned_student_ids: [student.id]) }
    let!(:activity_session) { create(:activity_session_without_concept_results, classroom_unit: classroom_unit, user_id: student.id) }
    let!(:concept_result) { create(:concept_result, activity_session: activity_session) }
    let(:subject) { described_class.new(admin.id) }

    it 'should return the correct results' 


  end
end

