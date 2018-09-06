#
# Copyright (C) 2013 - present Instructure, Inc.
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

require File.expand_path(File.dirname(__FILE__) + '/../sharding_spec_helper')

describe GradesPresenter do

  let(:presenter) { GradesPresenter.new(enrollments) }
  let(:shard){ FakeShard.new }

  describe '#course_grade_summaries' do
    before(:once) do
      account = Account.create!
      course = account.courses.create!
      student = User.create!
      teacher = User.create!
      section_one = course.course_sections.create!
      section_two = course.course_sections.create!
      course.enroll_teacher(teacher, enrollment_state: 'active')
      @section_one_student_enrollment = course.enroll_student(
        student,
        section: section_one,
        allow_multiple_enrollments: true,
        enrollment_state: 'active'
      )
      course.enroll_student(
        student,
        section: section_two,
        allow_multiple_enrollments: true,
        enrollment_state: 'active'
      )
      @presenter = GradesPresenter.new(course.enrollments)
    end

    it 'does not throw an error when there exists a user with multiple student enrollments' 


    it 'does not throw an error when there exists a user with multiple student enrollments and ' \
      'some of those enrollments have a score while others do not' do
        @section_one_student_enrollment.scores.create!(current_score: 80.0)
        expect { @presenter.course_grade_summaries }.not_to raise_error
    end
  end

  describe '#student_enrollments' do
    let(:course1) { double }
    let(:course2) { double }
    let(:student) { double(:student? => true, :course => course1, :state_based_on_date => :active) }
    let(:nonstudent) { double(:student? => false, :course => course2, :state_based_on_date => :active) }
    let(:enrollments) { [student, nonstudent] }
    let(:student_enrollments) { presenter.student_enrollments }

    it 'puts the enrollments in a hash with courses as keys' 


    it 'includes enrollments that are students' 


    it 'excludes objects which are not students' 

  end

  describe '#observed_enrollments' do

    let(:enrollment) { double(:state_based_on_date => :active, :is_a? => true, :associated_user_id => 1, :course_id => 1) }
    let(:enrollment2) { double(:state_based_on_date => :active, :is_a? => true, :associated_user_id => 2, :course_id => 2) }
    let(:enrollments) { [enrollment, enrollment2] }
    let(:presenter) { GradesPresenter.new(enrollments) }

    before do
      enrollments.each do |e|
        allow(e).to receive(:shard).and_return(shard)
      end
    end

    it 'uniqs out duplicates' 


    it 'removes nil enrollments' 


    context 'exclusions' do
      before do
        active_enrollments = double('active_enrollments')
        allow(active_enrollments).to receive(:where).and_return([1], [2], [3])
        allow(StudentEnrollment).to receive_messages(:active => active_enrollments)
      end

      it 'only selects ObserverEnrollments' 


      it 'excludes enrollments without an associated user id' 

    end

    context 'across multiple shards' do
      specs_require_sharding

      it 'pulls the student enrollment from the same shard as the observer enrollment' 

    end
  end

  describe '#teacher_enrollments' do

    let(:course1) { double }
    let(:course2) { double }
    let(:instructor2) { double(:instructor? => true, :course => course1, :course_section_id => 3, :state_based_on_date => :active) }
    let(:instructor) { double(:instructor? => true, :course => course1, :course_section_id => 1, :state_based_on_date => :active) }
    let(:noninstructor) { double(:instructor? => false, :course => course2, :state_based_on_date => :active) }
    let(:enrollments) { [instructor, instructor2, noninstructor] }
    let(:teacher_enrollments) { presenter.teacher_enrollments }

    it 'includes instructors' 


    it 'includes should not include duplicate courses' 


    it 'excludes non-instructors' 

  end

  describe '#single_enrollment' do

    let(:course) { double('course') }

    let(:attrs) {
      { :student? => false, :instructor? => false, :course_id => 1, :state_based_on_date => :active, :course => course, :is_a? => false }
    }

    let(:observed_enrollment) { double('observerd_enrollment', attrs.merge(:is_a? => true, :associated_user_id => 1)) }
    let(:teacher_enrollment) { double('teacher_enrollment', attrs.merge(:instructor? => true)) }
    let(:student_enrollment) { student_enrollment = double('student_enrollment', attrs.merge(:student? => true)) }

    before do
      allow(StudentEnrollment).to receive_messages(active: double(where: [double]))
      allow(observed_enrollment).to receive(:shard).and_return(shard)
    end

    it 'is true with one student enrollment' 


    it 'is true with one teacher enrollment' 


    it 'is true with one observed enrollment' 


    it 'is false with one of each' 


    it 'is false with none of each' 

  end

end

class FakeShard
  def activate; yield; end
end

