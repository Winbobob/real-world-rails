# Copyright (C) 2010-2012, InSTEDD
#
# This file is part of Verboice.
#
# Verboice is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# Verboice is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with Verboice.  If not, see <http://www.gnu.org/licenses/>.

require 'spec_helper'

describe Api::CallsController do
  let(:account) { Account.make }
  let(:project) { Project.make :account => account }
  let(:call_flow) { CallFlow.make project: project }
  let(:channel) { Channel.all_leaf_subclasses.sample.make :call_flow => call_flow, :account => account }
  let(:schedule) { project.schedules.make }

  before(:each) do
    sign_in account
  end

  context "call" do
    before(:each) do
      allow(BrokerClient).to receive(:notify_call_queued)
    end

    it "calls" 


    it "calls with channel id" 


    it "schedule call in the future" 


    it "schedule call with deadline" 


    it "doesn't schedule overdue call" 


    it "schedule call in specific schedule" 


    it "calls with call flow id" 


    it "calls with call flow name" 


    it "rejects a call without a channel" 


    it "rejects a call with empty address" 


    it "rejects a call using a disabled channel" 

  end

  it "call state" 


  it "cancells a call" 

end

