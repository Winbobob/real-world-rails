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

require 'sharding_spec_helper'

describe PermissionsHelper do
  describe '#manageable_enrollments_by_permission' do
    before :once do
      @student_role = Role.get_built_in_role('StudentEnrollment')
      @teacher_role = Role.get_built_in_role('TeacherEnrollment')
    end

    it 'should return enrollments that have permission by default' 


    it 'should return enrollments that have permission from a direct account override' 


    it 'should return enrollments that have permission from an ancestor account override' 


    it 'should only return enrollments that have permission for the given override' 


    it 'should return enrollments that have permission from an account role' 


    it 'should handle AccountAdmin roles' 


    it 'should inherit AccountAdmin rights from a parent account' 


    it 'should use AccountAdmin permissions when another role disables the permission' 


    it 'should handle account role overrides that conflict with course role overrides' 


    it 'should handle account role overrides from a higher account that conflict with course role overrides' 


    it 'should handle course role overrides from a higher account that conflict with account role overrides' 


    it 'should handle role override disabling the permission in a lower account' 


    it 'should handle account role overrides from a lower account than the account the role belongs to' 


    it 'should not be affected by role overrides in a sub-account of the current enrollment' 


    it 'should handle conflicting course enrollments' 


    it 'should handle role overrides that are turned on and off by sub-account' 


    it 'should handle locked overrides when there are sub-account overrides' 


    it 'should handle role overrides that do not apply to self' 


    it 'should handle role overrides that do not apply to descendants' 


    it 'should handle role overrides that do not apply to descendants and are locked' 


    it 'should handle AccountAdmin when the permission is off by default' 


    it 'should handle role overrides that turn off the permission for AccountAdmin but on for another account admin' 


    it 'should handle role overrides that turn off the permission for AccountAdmin and a course role that has it on by default' 


    it 'should handle AccountAdmin with the permission on when another override turns it off' 


    it 'should handle conflicting account role overrides' 


    context "cross-sharding" do
      specs_require_sharding

      it "should handle cross-shard enrollment permissions" 


      it "should handle non-standard cross-shard enrollment permissions" 

    end
  end

  describe "precalculate_permissions_for_courses" do
    def exclude_reads(permissions_hash)
      Hash[permissions_hash.map{|k, v| [k, v.except(:read, :read_grades, :read_as_admin, :participate_as_student)]}]
    end

    it "should return other course-level (non-standard) permission values for active enrollments" 


    it "should still let concluded term teachers read_as_admin" 


    it 'should return true for enrollments that have permission from a direct account override' 


    it 'should return true for enrollments that have permission from an ancestor account override' 


    it 'should only return true for enrollments that have permission for the given override' 


    it 'should return true for enrollments that have permission from an account role' 


    it "should work with future restricted permissions" 


    it "should work with unenrolled account admins" 


    it "should work with concluded-available permissions" 


    context "sharding" do
      specs_require_sharding

      it "should work across shards" 


      it "should not try to precalculate for a cross-shard admin" 

    end
  end
end

