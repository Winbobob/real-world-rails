#
# Copyright (C) 2018 - present Instructure, Inc.
#
# This file is part of Canvas.
#
# Canvas is free software: you can redistribute it and/or modify it under
# the terms of the GNU Affero General Public License as published by the Free
# Software Foundation, version 3 of the License.
#
# Canvas is distributed in the hope that it will be useful, but WITHOUT ANY
# WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
# A PARTICULAR PURPOSE. See the GNU Affero General Public License for more
# details.
#
# You should have received a copy of the GNU Affero General Public License along
# with this program. If not, see <http://www.gnu.org/licenses/>.
#

require_relative '../spec_helper'

describe Canvadocs do
  describe '.user_session_params' do
    let(:course) { Course.create! }
    let(:student) { User.create!(name: 'Severus Student', short_name: 'Sev, the Student') }
    let(:teacher) { User.create!(name: 'Giselle Grader', short_name: 'Gise, the Grader') }
    let(:assignment) { course.assignments.create!(title: 'an assignment') }
    let(:submission) { assignment.submission_for_student(student) }
    let(:attachment) do
      Attachment.create!(
        content_type: 'application/pdf',
        context: course,
        user: student,
        uploaded_data: stub_png_data,
        filename: 'file.png'
      )
    end

    let(:user_filter) { session_params[:user_filter] }

    before(:each) do
      course.enroll_student(student).accept(true)
      course.enroll_teacher(teacher).accept(true)
      attachment.associate_with(submission)
      @current_user = student
    end

    context 'when passed an attachment' do
      let(:session_params) { Canvadocs.user_session_params(@current_user, attachment: attachment) }

      # We don't really want this behaviour long term, but that's the
      # difference between sending an attachment and sending in the
      # submission
      it "returns empty hash if it can't find the submission starting with the attachment" 


      # We don't really want this behaviour long term, but that's the
      # difference between sending an attachment and sending in the
      # submission
      it "returns empty if not passed an attachment or a submission" 


      describe 'parameters describing the current user' do
        it 'includes the short name of the current user with commas removed' 


        it 'includes the real global ID of the current user' 


        context 'when a student is viewing' do
          it 'includes a user_role of "student"' 


          it 'includes the anonymous ID of the student' 

        end

        context 'when a grader is viewing' do
          before(:each) do
            @current_user = teacher
          end

          it 'includes a user_role that is based on the user enrollment type' 


          it 'does not include an anonymous ID if the assignment is not moderated' 


          context 'when the assignment is moderated' do
            before(:each) do
              assignment.update!(moderated_grading: true, final_grader: teacher, grader_count: 1)
            end

            it 'includes the anonymous ID of the grader when the grader has taken a slot' 


            it 'includes the anonymous ID of the grader when the grader has not taken a slot' 


            it 'does not include the anonymous ID if the grader does not have a moderation_grader record' 

          end
        end
      end

      describe 'user filter' do
        let(:student_real_data) { {type: 'real', role: 'student', id: student.global_id.to_s, name: 'Sev the Student'} }
        let(:student_anonymous_data) { hash_including(type: 'anonymous', role: 'student', id: submission.anonymous_id) }
        let(:teacher_real_data) { {type: 'real', role: 'teacher', id: teacher.global_id.to_s, name: 'Gise the Grader'} }

        context 'for an unmoderated anonymized assignment' do
          before(:each) do
            assignment.update!(anonymous_grading: true, muted: true)
          end

          context 'when a student is viewing' do
            before(:each) do
              @current_user = student
            end

            it 'includes only the current user' 


            it 'requests that all returned annotations belong to users in the user_filter' 

          end

          context 'when a teacher is viewing' do
            before(:each) do
              @current_user = teacher
            end

            it 'includes anonymous information for the student' 


            it 'does not request that all returned annotations belong to users in the user_filter' 

          end
        end

        context 'for an unmoderated non-anonymized assignment' do
          before(:each) do
            assignment.update!(anonymous_grading: false, muted: false)
          end

          context 'when a student is viewing' do
            before(:each) do
              @current_user = student
            end

            it 'omits the user filter entirely when a student is viewing' 


            it 'omits the restrict_annotations_to_user_filter entirely' 

          end

          context 'when a teacher is viewing' do
            before(:each) do
              @current_user = teacher
            end

            it 'omits the user filter entirely' 


            it 'omits the restrict_annotations_to_user_filter entirely' 

          end
        end

        context 'for a moderated assignment' do
          let(:final_grader) { teacher }
          let(:final_grader_real_data) do
            { type: 'real', role: 'teacher', id: teacher.global_id.to_s, name: 'Gise the Grader' }
          end

          let(:final_grader_anonymous_data) { hash_including(type: 'anonymous', role: 'teacher', id: 'qqqqq') }
          let(:provisional_grader_anonymous_data) { hash_including(type: 'anonymous', role: 'ta', id: 'wwwww') }
          let(:provisional_grader) { User.create!(name: 'Publius Provisional', short_name: 'Pub, the Prov') }
          let(:provisional_grader_real_data) do
            { type: 'real', role: 'ta', id: provisional_grader.global_id.to_s, name: 'Pub the Prov' }
          end

          before(:each) do
            assignment.update!(moderated_grading: true, final_grader: final_grader, grader_count: 1)
            assignment.moderation_graders.create!(user: final_grader, anonymous_id: 'qqqqq')
            course.enroll_ta(provisional_grader).accept(true)
            assignment.moderation_graders.create!(user: provisional_grader, anonymous_id: 'wwwww')
          end

          context 'when a student is viewing' do
            before(:each) do
              @current_user = student
            end

            it 'includes the student' 


            it 'excludes graders if grades are not published' 


            it 'includes the selected grader if grades are published' 


            it 'excludes graders that were not selected if grades are published' 


            it 'requests that all returned annotations belong to users in the user_filter' 

          end

          context 'when a provisional grader is viewing' do
            before(:each) do
              @current_user = provisional_grader
            end

            it 'includes real data for the current grader' 


            it 'includes anonymous student data when anonymizing students' 


            it 'returns an anonymous name for the student when anonymizing students' 


            it 'includes real student data when not anonymizing students' 


            it 'includes real grader data when showing identities of other graders' 


            it 'includes anonymous grader data when hiding identities of other graders' 


            it 'returns names in the format "Grader #" for graders whose identities are hidden' 


            it 'omits other graders when comments from other graders are hidden' 


            it 'requests that all returned annotations belong to users in the user_filter' 

          end

          context 'when the final grader is viewing' do
            before(:each) do
              @current_user = final_grader
            end

            it 'includes real grader data when grader names are visible to the final grader' 


            it 'includes anonymous grader data when grader names are not visible to the final grader' 


            it 'returns names in the format "Grader #" for graders not visible to the final grader' 


            it 'always includes other graders when the final grader is viewing' 


            it 'requests that all returned annotations belong to users in the user_filter' 

          end
        end
      end
    end

    context 'when passed a submission' do
      let(:session_params) { Canvadocs.user_session_params(@current_user, submission: submission) }

      describe 'parameters describing the current user' do
        it 'includes the short name of the current user with commas removed' 


        it 'includes the real global ID of the current user' 


        context 'when a student is viewing' do
          it 'includes a user_role of "student"' 


          it 'includes the anonymous ID of the student' 

        end

        context 'when a grader is viewing' do
          before(:each) do
            @current_user = teacher
          end

          it 'includes a user_role that is based on the user enrollment type' 


          it 'does not include an anonymous ID if the assignment is not moderated' 


          context 'when the assignment is moderated' do
            before(:each) do
              assignment.update!(moderated_grading: true, final_grader: teacher, grader_count: 1)
            end

            it 'includes the anonymous ID of the grader when the grader has taken a slot' 


            it 'includes the anonymous ID of the grader when the grader has not taken a slot' 


            it 'does not include the anonymous ID if the grader does not have a moderation_grader record' 

          end
        end
      end

      describe 'user filter' do
        let(:student_real_data) { {type: 'real', role: 'student', id: student.global_id.to_s, name: 'Sev the Student'} }
        let(:student_anonymous_data) { hash_including(type: 'anonymous', role: 'student', id: submission.anonymous_id) }
        let(:teacher_real_data) { {type: 'real', role: 'teacher', id: teacher.global_id.to_s, name: 'Gise the Grader'} }

        context 'for an unmoderated anonymized assignment' do
          before(:each) do
            assignment.update!(anonymous_grading: true, muted: true)
          end

          context 'when a student is viewing' do
            before(:each) do
              @current_user = student
            end

            it 'includes only the current user' 


            it 'requests that all returned annotations belong to users in the user_filter' 

          end

          context 'when a teacher is viewing' do
            before(:each) do
              @current_user = teacher
            end

            it 'includes anonymous information for the student' 


            it 'does not request that all returned annotations belong to users in the user_filter' 

          end
        end

        context 'for an unmoderated non-anonymized assignment' do
          before(:each) do
            assignment.update!(anonymous_grading: false, muted: false)
          end

          context 'when a student is viewing' do
            before(:each) do
              @current_user = student
            end

            it 'omits the user filter entirely when a student is viewing' 


            it 'omits the restrict_annotations_to_user_filter entirely' 

          end

          context 'when a teacher is viewing' do
            before(:each) do
              @current_user = teacher
            end

            it 'omits the user filter entirely' 


            it 'omits the restrict_annotations_to_user_filter entirely' 

          end
        end

        context 'for a moderated assignment' do
          let(:final_grader) { teacher }
          let(:final_grader_real_data) do
            { type: 'real', role: 'teacher', id: teacher.global_id.to_s, name: 'Gise the Grader' }
          end

          let(:final_grader_anonymous_data) { hash_including(type: 'anonymous', role: 'teacher', id: 'qqqqq') }
          let(:provisional_grader_anonymous_data) { hash_including(type: 'anonymous', role: 'ta', id: 'wwwww') }
          let(:provisional_grader) { User.create!(name: 'Publius Provisional', short_name: 'Pub, the Prov') }
          let(:provisional_grader_real_data) do
            { type: 'real', role: 'ta', id: provisional_grader.global_id.to_s, name: 'Pub the Prov' }
          end

          before(:each) do
            assignment.update!(moderated_grading: true, final_grader: final_grader, grader_count: 1)
            assignment.moderation_graders.create!(user: final_grader, anonymous_id: 'qqqqq')
            course.enroll_ta(provisional_grader).accept(true)
            assignment.moderation_graders.create!(user: provisional_grader, anonymous_id: 'wwwww')
          end

          context 'when a student is viewing' do
            before(:each) do
              @current_user = student
            end

            it 'includes the student' 


            it 'excludes graders if grades are not published' 


            it 'includes the selected grader if grades are published' 


            it 'excludes graders that were not selected if grades are published' 


            it 'requests that all returned annotations belong to users in the user_filter' 

          end

          context 'when a provisional grader is viewing' do
            before(:each) do
              @current_user = provisional_grader
            end

            it 'includes real data for the current grader' 


            it 'includes anonymous student data when anonymizing students' 


            it 'returns an anonymous name for the student when anonymizing students' 


            it 'includes real student data when not anonymizing students' 


            it 'includes real grader data when showing identities of other graders' 


            it 'includes anonymous grader data when hiding identities of other graders' 


            it 'returns names in the format "Grader #" for graders whose identities are hidden' 


            it 'omits other graders when comments from other graders are hidden' 


            it 'requests that all returned annotations belong to users in the user_filter' 

          end

          context 'when the final grader is viewing' do
            before(:each) do
              @current_user = final_grader
            end

            it 'includes real grader data when grader names are visible to the final grader' 


            it 'includes anonymous grader data when grader names are not visible to the final grader' 


            it 'returns names in the format "Grader #" for graders not visible to the final grader' 


            it 'always includes other graders when the final grader is viewing' 


            it 'requests that all returned annotations belong to users in the user_filter' 

          end
        end
      end
    end
  end
end

