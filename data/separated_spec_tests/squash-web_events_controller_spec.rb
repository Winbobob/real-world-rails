# Copyright 2014 Square Inc.
#
#    Licensed under the Apache License, Version 2.0 (the "License");
#    you may not use this file except in compliance with the License.
#    You may obtain a copy of the License at
#
#        http://www.apache.org/licenses/LICENSE-2.0
#
#    Unless required by applicable law or agreed to in writing, software
#    distributed under the License is distributed on an "AS IS" BASIS,
#    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#    See the License for the specific language governing permissions and
#    limitations under the License.

require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  include EventDecoration

  describe "#index" do
    before :all do
      membership = FactoryGirl.create(:membership)
      @env       = FactoryGirl.create(:environment, project: membership.project)
      @bug       = FactoryGirl.create(:bug, environment: @env)
      kinds      = ['open', 'comment', 'assign', 'close', 'reopen']
      data       = {'status'        => 'fixed',
                    'from'          => 'closed',
                    'revision'      => '8f29160c367cc3e73c112e34de0ee48c4c323ff7',
                    'build'         => '10010',
                    'assignee_id'   => FactoryGirl.create(:membership, project: @env.project).user_id,
                    'occurrence_id' => FactoryGirl.create(:rails_occurrence, bug: @bug).id,
                    'comment_id'    => FactoryGirl.create(:comment, bug: @bug, user: membership.user).id}
      @events    = 100.times.map { |i| FactoryGirl.create :event, bug: @bug, user: (i.even? ? @bug.environment.project.owner : membership.user), kind: kinds.sample, data: data }
      @user      = membership.user
    end

    it "should require a logged-in user" 


    context '[authenticated]' do
      before(:each) { login_as @user }

      it_should_behave_like "action that 404s at appropriate times", :get, :index, 'polymorphic_params(@bug, true)'

      it "should load the 50 most recent events" 


      it "should return the next 50 events when given a last parameter" 


      it "should decorate the response" 


      it "should add the original bug and URL to the JSON for dupe events" 

    end
  end
end

