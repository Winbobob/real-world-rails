#
# Copyright (C) 2012 - present Instructure, Inc.
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

require_relative '../../spec_helper'
require_dependency "api/v1/course_json"

module Api
  module V1

    describe CourseJson do
      let(:includes) { [] }
      let(:course) { double(:course) }
      let(:user) { double(:user) }
      let(:course_json) { CourseJson.new( course, nil, includes, [] ) }

      describe '#include_description' do
        let(:predicate){ course_json.include_description }

        it 'affirms when the public_description key is in the includes array' 


        it 'affirms when the public_description key is a symbol' 


        it 'negates when the public_description key is missing' 

      end


      describe '#include_total_scores?' do
        let(:predicate) { course_json.include_total_scores? }
        let(:course_settings) { Hash.new }
        let(:course) { double( course_settings ) }

        describe 'when total scores key is set' do
          before { includes << :total_scores }

          it 'is false if the final grade is hidden' 


          it 'is true if the course allows the grade to be seen' 

        end

        describe 'when total scores key is not set' do
          before { includes.clear }

          it 'is false if the final grade is hidden' 


          it 'is false even even if the final grade is NOT hidden' 

        end
      end


      describe '#allowed_attributes' do
        it 'just returns the base attributes when there are no includes' 


        it 'tacks on any includes' 

      end


      describe '#methods_to_send' do
        it 'includes the end_at field' 


        it 'includes the public_syllabus field' 


        it 'includes the public_syllabus_to_auth field' 


        it 'includes the storage_quota_mb field' 


        it 'includes the hide_final_grades method if its in the includes array' 

      end


      describe '#clear_unneeded_fields' do
        let(:hash){ Hash.new }

        describe 'with an optional field' do
          before { hash['enrollments'] = [] }

          it 'kicks the key-value pair out if the value is nil' 


          it 'keeps the key-value pair if the value is not nil' 

        end

        describe 'with any other field' do
          before { hash['some_other_key'] = 'some_value' }

          it 'keeps the key-value pair even if the value is nil' 


          it 'keeps the key-value pair if the value is not nil' 

        end

      end

      describe '#description' do
        let(:course) { double(:public_description => 'an eloquent anecdote' ) }

        it 'returns the description when its configured for inclusion' 


        it 'is nil when configured not to be included' 

      end

      describe '#initialization' do
        let(:enrollments) { double(:enrollments) }
        let(:hash) { {:a => '1', :b => '2'} }
        let(:includes) { ['these', 'three', 'keys' ] }

        before(:each) do
          @json = CourseJson.new(course, user, includes, enrollments){ hash }
        end

        subject{ @json }

        describe '#course' do
          subject { super().course }
          it { is_expected.to eq course }
        end

        describe '#user' do
          subject { super().user }
          it { is_expected.to eq user }
        end

        describe '#includes' do
          subject { super().includes }
          it { is_expected.to eq [:these, :three, :keys] }
        end

        describe '#enrollments' do
          subject { super().enrollments }
          it { is_expected.to eq enrollments }
        end

        describe '#hash' do
          subject { super().hash }
          it { is_expected.to eq hash }
        end
      end

      describe '#set_sis_course_id' do
        let(:sis_course) { double(grants_any_right?: @has_right, sis_source_id: @sis_id, sis_batch_id: @batch, root_account: root_account) }
        let(:root_account) { double(grants_right?: @has_right ) }
        let(:hash) { Hash.new }

        before do
          @sis_id = 1357
          @batch = 991357
          @has_right = false
        end

        describe 'when appropriate rights are granted' do
          before { @has_right = true }

          it 'adds sis the key-value pair to the hash' 


          describe 'with a nil sis_id' do
            before do
              @sis_id = nil
              @batch = nil
              course_json.set_sis_course_id( hash, sis_course, user )
            end

            it 'allows the nil value to go into the has' 


            it 'does not get cleared out before translation to json' 

          end
        end

        it 'doesnt add the sis_course_id key at all if the rights are NOT present' 

      end

      describe '#permissions' do
        let(:course) { double(:public_description => 'an eloquent anecdote' ) }

        it 'returns the permissions when its configured for inclusion' 


        it 'is nil when configured not to be included' 

      end
    end
  end
end

