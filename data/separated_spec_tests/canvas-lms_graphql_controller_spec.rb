
#
# Copyright (C) 2017 - present Instructure, Inc.
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

describe GraphQLController do
  before :once do
    student_in_course
  end

  context "graphiql" do
    it "requires a user" 


    it "doesn't work in production for normal users" 


    it "works in production for site admins" 


    it "works" 


  end

  context "graphql" do
    it "works" 


    context "data dog metrics" do
      it "reports data dog metrics if requested" 


      it "doesn't report normally" 

    end
  end

  context "datadog rest metrics" do
    require 'datadog/statsd'

    # this is the dumbest place to put this test except every where else i
    # could think of
    it "records datadog metrics if requested" 


    it "doesn't normally datadog" 

  end
end

