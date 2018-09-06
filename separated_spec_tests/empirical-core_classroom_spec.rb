require 'rails_helper'

describe ProgressReports::Standards::Classroom do
  describe "getting classrooms for the progress report" do
    let(:section_ids) { [sections[0].id, sections[1].id] }
    let(:filters) { {} }
    include_context 'Section Progress Report'
    let(:teacher) {classrooms.first.owner}

    before do
      ClassroomsTeacher.all.each{|ct| ct.update(user: teacher)}
    end

    subject { ProgressReports::Standards::Classroom.new(teacher).results(filters).to_a }

    it "retrieves aggregated classroom data" 


    it "retrieves classrooms with no filters" 


    it "ignores classrooms associated belonging to a different teacher (even if they share students with this teacher's classrooms" 


    context 'sections' do
      let(:filters) { {section_id: section_ids} }

      it 'can retrieve sections based on sections' 

    end

    context 'classrooms' do
      let(:filters) { {classroom_id: classrooms.first.id} }

      it 'can retrieve sections based on classroom_id' 

    end

    context 'empty classroom' do
      let(:filters) { {classroom_id: ""} }

      it 'does not filter by classroom' 

    end

    context 'units' do
      let(:filters) { {unit_id: units.first.id} }

      it 'can retrieve sections based on unit_id' 

    end

    context 'empty units' do
      let(:filters) { {unit_id: ""} }

      it 'does not filter by units' 

    end

    context 'a set of topics' do
      let(:filters) { {section_id: section_ids, topic_id: topics.map {|t| t.id} } }

      it 'can retrieve sections based on a set of topics' 

    end

    context 'a single topic' do
      let(:filters) { {section_id: section_ids, topic_id: topics.first.id } }

      it 'can retrieve sections based on a single topic' 

    end

    context 'students' do
      let(:filters) { {student_id: students.first.id} }

      it 'can retrieve sections based on a student' 

    end

    context 'empty students' do
      let(:filters) { {student_id: ""} }

      it 'does not filter by students' 

    end
  end
end

