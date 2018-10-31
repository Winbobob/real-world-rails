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

require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ContentMigrationsController do
  context 'course' do
    before(:once) do
      course_factory active_all: true
    end

    let(:migration) do
      migration = @course.content_migrations.build(migration_settings: {})
      migration.save!
      migration
    end

    it 'index exports quizzes_next environment' 


    describe '#show' do
      context 'params[:include] present' do
        it 'shows content migration with audit_info' 

      end

      context 'params[:include] not present' do
        it 'shows content migration without audit_info' 

      end
    end
  end
end

