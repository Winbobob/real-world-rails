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

describe CallFlowsController do
  before(:each) do
    sign_in account
  end

  let!(:account) { Account.make }
  let!(:project) { Project.make account: account }
  let!(:call_flow) { CallFlow.make project: project }
  let!(:channel) { Channels::Custom.make account: account, name: "Channel1" }

  describe "Download call results" do
    def download_equals(file)
      response = get :download_results, :format => :csv, id: call_flow.id, project_id: call_flow.project.id
      expect(response.body).to eq File.read(File.join(Rails.root, file))
    end

    before(:each) { Timecop.freeze(Time.utc(2012, 1, 1, 0, 0, 0)) }
    after(:each) { Timecop.return }

    let!(:flow) do
      f = [{"id"=>1, "name"=>"Initial menu", "type"=>"menu", "root"=>true, "options"=>[{"number"=>1, "next"=>593}, {"number"=>2, "next"=>737}], "end_call_message"=>{"name"=>"Bye", "type"=>"recording", "duration"=>"00:00"}, "invalid_message"=>{"name"=>"Wrong number!", "type"=>"recording", "duration"=>"00:00"}, "explanation_message"=>{"name"=>"Welcome to test call_flow 01", "type"=>"recording", "duration"=>"00:00"}, "options_message"=>{"name"=>"Press 1 for foo, press 2 for bar", "type"=>"recording", "duration"=>"00:00"}}, {"id"=>593, "name"=>"Menu Foo", "type"=>"menu", "root"=>false, "options"=>[{"number"=>1, "next"=>509}, {"number"=>2, "next"=>897}], "end_call_message"=>{}, "invalid_message"=>{}, "explanation_message"=>{"name"=>"You pressed Foo", "type"=>"recording", "duration"=>"00:00"}, "options_message"=>{"name"=>"Press 1 if it's ok, if not, 2", "type"=>"recording", "duration"=>"00:00"}}, {"id"=>737, "name"=>"Menu Bar", "type"=>"menu", "root"=>false, "options"=>[{"number"=>2, "next"=>2}, {"number"=>3, "next"=>3}], "end_call_message"=>{"name"=>"Goodbye", "type"=>"recording", "duration"=>"00:00"}, "invalid_message"=>{}, "explanation_message"=>{"name"=>"You chosed Bar", "type"=>"recording", "duration"=>"00:00"}, "options_message"=>{"name"=>"Press 2 if it's ok, 3 if not", "type"=>"recording", "duration"=>"00:00"}}, {"id"=>509, "name"=>"Menu Ok", "type"=>"menu", "root"=>false, "options"=>[], "end_call_message"=>{"name"=>"Goodbye", "type"=>"recording", "duration"=>"00:00"}, "invalid_message"=>{}, "explanation_message"=>{"name"=>"Thank you for chosing foo", "type"=>"recording", "duration"=>"00:00"}, "options_message"=>{}}, {"id"=>897, "name"=>"Menu not ok", "type"=>"menu", "root"=>false, "options"=>[], "end_call_message"=>{"name"=>"Bye", "type"=>"recording", "duration"=>"00:00"}, "invalid_message"=>{}, "explanation_message"=>{"name"=>"We will call you back later", "type"=>"recording", "duration"=>"00:00"}, "options_message"=>{}}, {"id"=>2, "name"=>"Menu Ok", "type"=>"menu", "root"=>false, "options"=>[], "end_call_message"=>{}, "invalid_message"=>{}, "explanation_message"=>{"name"=>"Ok. Thank you for choosing bar", "type"=>"recording", "duration"=>"00:00"}, "options_message"=>{}}, {"id"=>3, "name"=>"Menu Not ok", "type"=>"menu", "root"=>false, "options"=>[], "end_call_message"=>{}, "invalid_message"=>{}, "explanation_message"=>{"name"=>"Goodbye", "type"=>"recording", "duration"=>"00:00"}, "options_message"=>{}}]

      call_flow.user_flow = f
      call_flow.save!
      f
    end

    it 'Should retrieve a csv with the call traces' 


    it 'should include call state' 

  end


  describe "GET index" do
    it "assigns all call_flows as @call_flows" 

  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new CallFlow" 


      it "assigns a newly created call_flow as @call_flow" 


      it "redirects to the created call_flow" 

    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved call_flow as @call_flow" 


      it "re-renders the 'new' template" 

    end

    it "creates a new CallFlow in shared project" 


    it "cannot create a new CallFlow in shared project without admin role" 

  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested call_flow" 


      it "assigns the requested call_flow as @call_flow" 


      it "redirects to the call_flow" 

    end

    describe "with invalid params" do
      it "assigns the call_flow as @call_flow" 


      it "re-renders the 'edit' template" 

    end
  end

  describe "DELETE destroy" do
    it "destroys the requested call_flow" 


    it "redirects to the call_flows list" 

  end

  private

  def make_call_log_entries(entries)
    entries.each do |entry|
      activity = {body: {'@fields' => entry}}.to_json
      CallLogEntry.make call_id: entry['call_log_id'], details: {activity: activity}
    end
  end

end

