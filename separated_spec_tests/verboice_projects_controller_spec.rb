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

describe ProjectsController do
  let!(:account) { Account.make }
  let!(:project) { Project.make :account => account }

  before(:each) do
    sign_in account
  end

  context "CRUD" do
    it "should edit a project" 


    it "should update a project" 


    it "delete a project" 


    it "should not be able to delete a shared project" 

  end

  context "Call enqueue:" do
    let!(:call_flow) { CallFlow.make :project => project }
    let!(:channel) { Channel.all_leaf_subclasses.sample.make :call_flow => call_flow, :account => account }
    let!(:schedule) { project.schedules.make :weekdays => "1", :time_to => Time.utc(2012, 1, 1, 23, 59, 59)}

    before(:each) do
      Timecop.freeze(Time.local(2012, 1, 1, 0, 0, 0))
      allow(BrokerClient).to receive(:notify_call_queued)
    end

    after(:each) do
      Timecop.return
    end

    it 'should enqueue a call' 


    it 'should ignore the not before date if not before check is not set' 


    it 'should enqueue a call not before specific date' 


    it 'should enqueue a call not before specific date with a timezone' 


    it 'should ignore the not after date if not after check is not set' 


    it "shouldn't enqueue a call after an specific date" 


    it 'should check that not after date is greater than not before date' 


    it 'should enqueue multiple calls' 


    it 'should fail if there is no call flow' 


    it 'should fail if the channel is disabled' 


    it 'should not enqueue multiple calls to the same number' 


    context "contact with multiple numbers" do
      before(:each) do
        @contact = project.contacts.new
        @contact.addresses.build address: '1'
        @contact.addresses.build address: '2'
        @contact.save!
      end

      it 'should not enqueue multiple calls to the same contact' 


      it "should enqueue a call to a contact's first number" 

    end
  end
end

