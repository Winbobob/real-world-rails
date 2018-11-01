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

RSpec.describe Service::PagerDuty do
  before :each do
    @pagerduty = Service::PagerDuty.new('abc123')
    FakeWeb.register_uri :post,
                         Squash::Configuration.pagerduty.api_url,
                         response: File.read(Rails.root.join('spec', 'fixtures', 'pagerduty_response.json'))

  end

  [:trigger, :acknowledge, :resolve].each do |method|
    describe "##{method}" do
      it "should apply headers to the request" 


      it "should parse the response" 


      it "should use an HTTP proxy if configured" 

    end
  end

  describe "#trigger" do
    it "should send a trigger event" 

  end

  describe "#acknowledge" do
    it "should send an acknowledge event" 

  end

  describe "#resolve" do
    it "should send a resolve event" 

  end
end unless Squash::Configuration.pagerduty.disabled?

