require 'rails_helper'

describe Units::Updater do
  include_context 'Unit Assignments Variables'

  let!(:unit) { create(:unit, user_id: teacher.id)}
  # let activities_data = [{id: activity.id, due_date: nil}]
  # classroom_activity.update(unit_id: unit.id)

  def activities_data
      [{id: activity.id, due_date: nil}]
  end

  def ca_with_unit
    classroom_activity.update(unit_id: unit.id)
    classroom_activity
  end


  # in this file, 'unit' refers to a unit object, 'activities_data' to an array of objects
  # with activity ids and due_dates, and 'classrooms_data' to an array of objects with an id
  # and array of student ids.
  # self.run(unit.id, activities_data, classrooms_data)


  describe "the updated classroom_activity's" do

    context 'assigned_student_ids array overwrites when the old array was' do

        describe 'assigned to all students' do
          def update_ca_to_all_assigned
            ca_with_unit.update(assigned_student_ids: [], assign_on_join: true)
            classroom_activity
          end

          before(:each) do
            update_ca_to_all_assigned
          end

          it "is still assigned to all students if an empty array is passed" 


          it "replaces the old array if some students are passed" 


          it "archives the classroom activity if passed false" 


        end

        describe 'assigned to some students' do
          def update_ca_to_some_assigned
            ca_with_unit.update(assigned_student_ids: [student2.id])
            classroom_activity
          end

          before(:each) do
            update_ca_to_some_assigned
          end

          it "is assigned to all students if an empty array is passed" 


          it "replaces the old array if different students are passed" 


          it "archives the classroom activity if passed false" 


        end

      end

    end

    describe 'when an old classroom activity does not exist a new one is initialized' do
      def hide_ca
        classroom_activity.update(visible: false)
        classroom_activity
      end

      before(:each) do
        hide_ca
      end

      it 'unless it does not have assigned students' 


      it 'with an entire class of assigned students' 


      it 'with some assigned students' 


      it 'with a new activity if it does not already exist' 


    end


    describe 'new or updated activity sessions' do

      before(:each) do
        ca_with_unit
        classroom.students.push(student1, student2, student)
      end

      context 'when assigned students are changed' do

        it 'does not give newly assigned students an activity session' 


        it 'hides the activity session of unassigned students' 


        it 'can add all students in a classroom' 


        it 'can unnassign some students and assign new students' 


        it "hides all activity sessions when assigned to no students" 


        it "hides the unit when assigned to no students" 


      end

      context 'when a new activity is added' do

        it "it does not create new activity sessions" 


      end
    end
  end

