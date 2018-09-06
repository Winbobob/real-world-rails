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

RSpec.describe NotificationThresholdsController, type: :controller do
  {create: :post, update: :patch}.each do |action, method|
    before :all do
      @env    = FactoryGirl.create(:environment)
      @params = {notification_threshold: {period: 3600, threshold: 500}}
    end
    before(:each) { @bug = FactoryGirl.create(:bug, environment: @env) }

    describe "##{action}" do
      it "should require a logged-in user" 


      context '[authenticated]' do
        before(:each) { login_as @bug.environment.project.owner }

        it_should_behave_like "action that 404s at appropriate times", method, action, 'polymorphic_params(@bug, true, @params.merge(format: "json"))'

        it "should create a new notification" 


        it "should update an existing notification" 


        it "should not allow user or bug ID to be changed" 

      end
    end
  end

  describe "#destroy" do
    before(:all) { @env = FactoryGirl.create(:environment) }
    before(:each) { @bug = FactoryGirl.create(:bug, environment: @env) }

    it "should require a logged-in user" 


    context '[authenticated]' do
      before(:each) { login_as @bug.environment.project.owner }

      it "should delete a notification threshold" 


      it "should do nothing if no notification threshold exists" 

    end
  end
end

