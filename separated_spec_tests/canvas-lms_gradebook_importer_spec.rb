#
# Copyright (C) 2011 - present Instructure, Inc.
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

require 'csv'

describe GradebookImporter do
  let(:gradebook_user) do
    teacher = User.create!
    course_with_teacher(user: teacher, course: @course)
    teacher
  end

  context "construction" do
    let!(:gradebook_course){ course_model }

    it "requires a context, usually a course" 


    it "stores the context and make it available" 


    it "requires the contents of an upload" 


    it "handles points possible being sorted in weird places" 


    it "handles muted line and being sorted in weird places" 


    context 'when dealing with a file containing semicolon field separators' do
      context 'with interspersed commas to throw you off' do
        before(:each) do
          @rows = [
            'Student;ID;Section;Aufgabe 1;Aufgabe 2;Final Score',
            'Points Possible;;;10000,54;100,00;',
            '"Merkel 1,0, Angela";1;Mein Kurs;123,4;57,4%;',
            '"Einstein 1,1, Albert";2;Mein Kurs;1.234,5;4.200,3%;',
            '"Curie, Marie";3;Mein Kurs;12.34,5;4.20.0,3%;',
            '"Planck, Max";4;Mein Kurs;-1.234,50;-4.200,30%;',
            '"Bohr, Neils";5;Mein Kurs;1.234.5;4.200.3%;',
            '"Dirac, Paul";6;Mein Kurs;1,234,5;4,200,3%;'
          ]

          importer_with_rows(*@rows)
        end

        it 'parses out assignments only' 


        it 'parses out points_possible correctly' 


        it 'parses out students correctly' 


        it 'does not reformat numbers that are part of strings' 


        it 'normalizes pure numbers' 


        it 'normalizes percentages' 

      end

      context 'without any interspersed commas' do
        before(:each) do
          @rows = [
            'Student;ID;Section;Aufgabe 1;Aufgabe 2;Final Score',
            'Points Possible;;;10000,54;100,00;',
            '"Angela Merkel";1;Mein Kurs;123,4;57,4%;',
            '"Albert Einstein";2;Mein Kurs;1.234,5;4.200,3%;',
            '"Marie Curie";3;Mein Kurs;12.34,5;4.20.0,3%;',
            '"Max Planck";4;Mein Kurs;-1.234,50;-4.200,30%;',
            '"Neils Bohr";5;Mein Kurs;1.234.5;4.200.3%;',
            '"Paul Dirac";6;Mein Kurs;1,234,5;4,200,3%;'
          ]

          importer_with_rows(*@rows)
        end

        it 'parses out assignments only' 


        it 'parses out points_possible correctly' 


        it 'parses out students correctly' 


        it 'does not reformat numbers that are part of strings' 


        it 'normalizes pure numbers' 


        it 'normalizes percentages' 

      end
    end

    it "creates a GradebookUpload" 


    context "when attachment and gradebook_upload is provided" do

      let(:attachment) do
        a = attachment_model
        file = Tempfile.new("gradebook.csv")
        file.puts("'Student,ID,Section,Assignment 1,Final Score'\n")
        file.puts("\"Blend, Bill\",6,My Course,-,\n")
        file.close
        allow(a).to receive(:open).and_return(file)
        return a
      end

      let(:progress){ Progress.create!(tag: "test", context: gradebook_user) }

      let(:upload) do
        GradebookUpload.create!(course: gradebook_course, user: gradebook_user, progress: progress)
      end

      let(:importer) { new_gradebook_importer(attachment, upload, gradebook_user, progress) }

      it "hangs onto the provided model for streaming" 


      it "nils out contents when using an attachment (saves on memory to not parse all at once)" 


      it "keeps the provided upload rather than creating a new one" 


      it "sets the uploads course as the importer context" 


    end
  end

  context "User lookup" do
    it "Lookups with either Student Name, ID, SIS User ID, or SIS Login ID" 


    it "Lookups by root account" 


    it "allows ids that look like numbers" 


    it "fails and updates progress if invalid header row" 

  end

  it "parses new and existing assignments" 


  it "parses CSVs with the SIS Login ID column" 


  it "does not include missing assignments if no new assignments" 


  it "does not include assignments with no changes" 


  it "doesn't include readonly assignments" 


  it "includes assignments that changed only in points possible" 


  it "does not create assignments for the totals columns" 


  it "does not create assignments for unposted columns" 


  it "parses new and existing users" 


  it "does not include assignments that don't have any grade changes" 


  it "includes assignments that the grade changed for an existing user" 


  context "to_json" do
    before do
      course_model
      new_gradebook_importer
    end

    let(:hash)        { @gi.as_json }
    let(:student)     { hash[:students].first }
    let(:submission)  { student[:submissions].first }
    let(:assignment)  { hash[:assignments].first }

    describe "simplified json output" do
      it "has only the specified keys" 


      it "a student only has specified keys" 


      it "a submission only has specified keys" 


      it "an assignment only has specified keys" 

    end
  end

  context "differentiated assignments" do
    def setup_DA
      course_with_teacher(active_all: true)
      @section_one = @course.course_sections.create!(name: 'Section One')
      @section_two = @course.course_sections.create!(name: 'Section Two')

      @student_one = student_in_section(@section_one)
      @student_two = student_in_section(@section_two)

      @assignment_one = assignment_model(course: @course, title: "a1")
      @assignment_two = assignment_model(course: @course, title: "a2")

      differentiated_assignment(assignment: @assignment_one, course_section: @section_one)
      differentiated_assignment(assignment: @assignment_two, course_section: @section_two)
    end

    before :once do
      setup_DA
    end

    it "ignores submissions for students without visibility" 


    it "does not break the creation of new assignments" 

  end

  context "with grading periods" do
    before(:once) do
      account = Account.default
      @course = account.courses.create!
      @teacher = User.create!
      course_with_teacher(course: @course, user: @teacher, active_enrollment: true)
      group = account.grading_period_groups.create!
      group.enrollment_terms << @course.enrollment_term
      @now = Time.zone.now
      @closed_period = group.grading_periods.create!(
        title: "Closed Period",
        start_date: 3.months.ago(@now),
        end_date: 1.month.ago(@now),
        close_date: 1.month.ago(@now)
      )

      @active_period = group.grading_periods.create!(
        title: "Active Period",
        start_date: 1.month.ago(@now),
        end_date: 2.months.from_now(@now),
        close_date: 2.months.from_now(@now)
      )

      @closed_assignment = @course.assignments.create!(
        name: "Assignment in closed period",
        points_possible: 10,
        due_at: date_in_closed_period
      )

      @open_assignment = @course.assignments.create!(
        name: "Assignment in open period",
        points_possible: 10,
        due_at: date_in_open_period
      )
    end

    let(:assignments) { @gi.as_json[:assignments] }
    let(:date_in_open_period) { 1.month.from_now(@now) }
    let(:date_in_closed_period) { 2.months.ago(@now) }
    let(:student_submissions) { @gi.as_json[:students][0][:submissions] }

    context "uploading submissions for existing assignments" do
      context "assignments without overrides" do
        before(:once) do
          @student = User.create!
          course_with_student(course: @course, user: @student, active_enrollment: true)
        end


        it "excludes entire assignments if no submissions for the assignment are being uploaded" 


        it "includes assignments if there is at least one submission in the assignment being uploaded" 


        context "submissions already exist" do
          before(:once) do
            Timecop.freeze(@closed_period.end_date - 1.day) do
              @closed_assignment.grade_student(@student, grade: 8, grader: @teacher)
            end
            @open_assignment.grade_student(@student, grade: 8, grader: @teacher)
          end

          it "does not include submissions that fall in closed grading periods" 


          it "includes submissions that do not fall in closed grading periods" 

        end


        context "submissions do not already exist" do
          it "does not include submissions that will fall in closed grading periods" 


          it "includes submissions that will not fall in closed grading periods" 

        end
      end

      context "assignments with overrides" do
        before(:once) do
          section_one = @course.course_sections.create!(name: 'Section One')
          @student = student_in_section(section_one)

          # set up overrides such that the student has a due date in an open grading period
          # for @closed_assignment and a due date in a closed grading period for @open_assignment
          @override_in_open_grading_period = @closed_assignment.assignment_overrides.create! do |override|
            override.set = section_one
            override.due_at_overridden = true
            override.due_at = date_in_open_period
          end

          @open_assignment.assignment_overrides.create! do |override|
            override.set = section_one
            override.due_at_overridden = true
            override.due_at = date_in_closed_period
          end
        end

        it "excludes entire assignments if there are no submissions in the assignment" \
        "being uploaded that are gradeable" do
          @override_in_open_grading_period.update_attribute(:due_at, date_in_closed_period)
          importer_with_rows(
            "Student,ID,Section,Assignment in closed period,Assignment in open period",
            ",#{@student.id},,5,5"
          )
          assignment_ids = assignments.map { |a| a[:id] }
          expect(assignment_ids).not_to include @closed_assignment.id
        end

        it "includes assignments if there is at least one submission in the assignment" \
        "being uploaded that is gradeable (it does not fall in a closed grading period)" do
          importer_with_rows(
            "Student,ID,Section,Assignment in closed period,Assignment in open period",
            ",#{@student.id},,5,5"
          )
          assignment_ids = assignments.map { |a| a[:id] }
          expect(assignment_ids).to include @closed_assignment.id
        end

        context "submissions already exist" do
          before(:once) do
            Timecop.freeze(@closed_period.end_date - 1.day) do
              @closed_assignment.grade_student(@student, grade: 8, grader: @teacher)
              @open_assignment.grade_student(@student, grade: 8, grader: @teacher)
            end
          end

          it "does not include submissions that fall in closed grading periods" 


          it "includes submissions that do not fall in closed grading periods" 

        end

        context "submissions do not already exist" do
          it "does not include submissions that will fall in closed grading periods" 


          it "includes submissions that will not fall in closed grading periods" 

        end
      end
    end

    context "uploading submissions for new assignments" do
      before(:once) do
        @student = User.create!
        course_with_student(course: @course, user: @student, active_enrollment: true)
      end

      it "does not create a new assignment if the last grading period is closed" 


      it "creates a new assignment if the last grading period is not closed" 

    end
  end

  describe "#translate_pass_fail" do
    let(:account) { Account.default }
    let(:course) { Course.create account: account }
    let(:student) do
      student = User.create
      student.gradebook_importer_submissions = [{ "grade" => "",
                                                  "original_grade" => ""}]
      student
    end
    let(:assignment) do
      course.assignments.create!(:name => 'Assignment 1',
                                 :grading_type => "pass_fail",
                                 :points_possible => 6)
    end
    let(:assignments) { [assignment] }
    let(:students) { [student] }
    let(:progress) { Progress.create tag: "test", context: student }
    let(:gradebook_upload){ GradebookUpload.create!(course: course, user: student, progress: progress) }
    let(:importer) { GradebookImporter.new(gradebook_upload, "", student, progress) }
    let(:submission) { student.gradebook_importer_submissions.first }

    it "translates positive score in submission['grade'] to complete" 


    it "translates positive grade in submission['original_grade'] to complete" 


    it "translates 0 grade in submission['grade'] to incomplete" 


    it "translates 0 grade in submission['original_grade'] to incomplete" 


    it "doesn't change empty string grade in submission['grade']" 


    it "doesn't change empty string grade in submission['original_grade']" 

  end
end

def new_gradebook_importer(attachment = valid_gradebook_contents, upload = nil, user = gradebook_user, progress = nil)
  @user = user
  @progress = progress || Progress.create!(tag: "test", context: @user)
  upload ||= GradebookUpload.create!(course: @course, user: @user, progress: @progress)
  if attachment.is_a?(String)
    attachment = attachment_with_rows(attachment)
  end
  @gi = GradebookImporter.new(upload, attachment, @user, @progress)
  @gi.parse!
  @gi
end

def valid_gradebook_contents
  attachment_with_file(File.join(File.dirname(__FILE__), %w(.. fixtures gradebooks basic_course.csv)))
end

def valid_gradebook_contents_with_sis_login_id
  attachment_with_file(File.join(File.dirname(__FILE__), %w(.. fixtures gradebooks basic_course_with_sis_login_id.csv)))
end

def attachment_with
  a = attachment_model
  file = Tempfile.new("gradebook_import.csv")
  yield file
  file.close
  allow(a).to receive(:open).and_return(file)
  a
end

def attachment_with_file(path)
  contents = File.read(path)
  attachment_with do |tempfile|
    tempfile.write(contents)
  end
end

def attachment_with_rows(*rows)
  attachment_with do |tempfile|
    rows.each do |row|
      tempfile.puts(row)
    end
  end
end

def importer_with_rows(*rows)
  new_gradebook_importer(attachment_with_rows(rows))
end

