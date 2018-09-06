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

RSpec.describe OccurrencesController, type: :controller do
  describe "#index" do
    before :all do
      @bug         = FactoryGirl.create(:bug)
      @occurrences = FactoryGirl.create_list(:rails_occurrence, 100, bug: @bug)
    end

    def sort(occurrences, reverse=false)
      occurrences.sort_by! { |b| [b.occurred_at, b.number] }
      occurrences.reverse! if reverse
      occurrences
    end

    it "should require a logged-in user" 


    context '[authenticated]' do
      before(:each) { login_as @bug.environment.project.owner }

      it_should_behave_like "action that 404s at appropriate times", :get, :index, 'polymorphic_params(@bug, true, format: "json")'

      context '[JSON]' do
        it "should load the first 50 occurrences" 


        it "should load the first 50 occurrences ascending" 


        it "should load the next 50 occurrences" 

      end
    end
  end

  describe "#histogram" do
    before :all do
      @env = FactoryGirl.create(:environment)
      @bug = FactoryGirl.create(:bug, environment: @env)
    end

    it "should require a logged-in user" 


    context '[authenticated]' do
      before :all do
        occurrences = FactoryGirl.create_list(:rails_occurrence, 27, bug: @bug)
        occurrences.each_with_index { |occ, i| Occurrence.where(id: occ.id).update_all occurred_at: Time.at(1234567890) - (i*13).minutes }
        FactoryGirl.create(:deploy, environment: @env, revision: '30e7c2ff8758f4f19bfbc0a57e26c19ab69d1d44', deployed_at: Time.at(1234567890))
        FactoryGirl.create(:deploy, environment: @env, revision: '2dc20c984283bede1f45863b8f3b4dd9b5b554cc', deployed_at: Time.at(123467890) - 1.year)
      end

      before :each do
        login_as @bug.environment.project.owner
        allow(Time).to receive(:now).and_return(Time.at(1234567890)) # make sure we don't get boundary errors
      end

      it_should_behave_like "action that 404s at appropriate times", :get, :histogram, "polymorphic_params(@bug, true, dimensions: %w( host pid ), step: 1000*60*60*5, size: 20, format: 'json')"

      it "should return a histogram of occurrence frequencies and deploys" 


      it "should return empty arrays for bugs with no recent occurrences" 

    end
  end

  describe "#aggregate" do
    before(:all) { @bug = FactoryGirl.create(:bug) }

    it "should require a logged-in user" 


    context '[authenticated]' do
      before :all do
        occurrences_host1_pid1 = FactoryGirl.create_list(:rails_occurrence, 25, bug: @bug, host: 'host1', pid: 1)
        occurrences_host1_pid2 = FactoryGirl.create_list(:rails_occurrence, 25, bug: @bug, host: 'host1', pid: 2)
        occurrences_host2_pid1 = FactoryGirl.create_list(:rails_occurrence, 25, bug: @bug, host: 'host2', pid: 1)
        occurrences_host2_pid2 = FactoryGirl.create_list(:rails_occurrence, 25, bug: @bug, host: 'host2', pid: 2)

        # give them all unique occurred_at values
        occurrences            = occurrences_host1_pid1.zip(occurrences_host1_pid2).zip(occurrences_host2_pid1).zip(occurrences_host2_pid2).flatten
        occurrences.each_with_index { |o, i| Occurrence.where(id: o.id).update_all(occurred_at: Time.at(1234567890) - i.hours) }
      end

      before :each do
        login_as @bug.environment.project.owner
        allow(Time).to receive(:now).and_return(Time.at(1234567890)) # make sure we don't get boundary errors
      end

      it_should_behave_like "action that 404s at appropriate times", :get, :aggregate, "polymorphic_params(@bug, true, dimensions: %w( host pid ), step: 1000*60*60*5, size: 20, format: 'json')"

      it "should aggregate occurrences based on given dimensions" 


      it "should collapse duplicate dimensions" 


      it "should 422 for non-aggregating dimensions" 


      it "should 422 for nonexistent dimensions" 


      it "should return an empty array given no dimensions" 


      it "should 422 given too many dimensions" 

    end
  end

  describe "#show" do
    before(:all) { @occurrence = FactoryGirl.create(:rails_occurrence) }

    it "should require a logged-in user" 


    context '[authenticated]' do
      before :each do
        login_as @occurrence.bug.environment.project.owner
      end

      it_should_behave_like "action that 404s at appropriate times", :get, :show, "polymorphic_params(@occurrence, false)"

      it "should not raise an exception for improperly-formatted JSON" 

    end
  end
end

