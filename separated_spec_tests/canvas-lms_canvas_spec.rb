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

require File.expand_path(File.dirname(__FILE__) + '/../spec_helper.rb')

describe Canvas do
  describe ".timeout_protection" do
    it "should wrap the block in a timeout" 


    it "should raise on timeout if raise_on_timeout option is specified" 


    it "should use the timeout argument over the generic default" 


    it "should use the settings timeout over the timeout argument" 


    if Canvas.redis_enabled?
      it "should skip calling the block after X failures" 


      it "should raise on cutoff if raise_on_timeout option is specified" 


      it "calls percent_short_circuit_timeout when set to do so" 

    end
  end

  if Canvas.redis_enabled?
    describe '.lookup_cache_store' do
      it "has the switchman namespace when using the pre-existing data redis" 

    end

    describe ".short_circuit_timeout" do
      it "should wrap the block in a timeout" 


      it "should skip calling the block after X failures" 


      it "should raise TimeoutCutoff when the cutoff is reached" 

    end

    describe ".percent_short_circuit_timeout" do
      it "should raise TimeoutCutoff when the protection key is present" 


      it "raise TimeoutCutoff when the failure rate is too high" 


      it "wraps the block in a timeout" 


      it "increments the counter when the block is called" 


      it "raises Timeout::Error on timeout" 


      it "increments the failure count on timeout" 


      it "sets the protection activated key if failure rate too high" 

    end
  end
end

