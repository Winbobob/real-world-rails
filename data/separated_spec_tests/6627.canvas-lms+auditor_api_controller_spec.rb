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
#

require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe AuditorApiController do
  class AuditsController < AuditorApiController
    def check_configured
      super
    end

    def query_options
      super
    end
  end

  let(:audits_controller) { AuditsController.new }

  context 'check_configured' do
    it 'should return not_found if database is not configured' 


    it 'should not block when database is configured' 

  end

  context 'query_options' do
    it 'should return hash of audit api parameters' 

  end
end

