require 'rails_helper'

describe UserVmAnalysis do

  context "enqueing jobs" do
    before(:each) do
      Sidekiq::Testing.fake!
      Sidekiq::Worker.clear_all
    end

    it "enques job" 

  end

  describe 'splitting users' do
    before(:each) do
      count_days = 2
      stub_const("UserServerCount::DO_NOT_COUNT_VM_LASTING_LESS_DAYS", count_days)

      FactoryGirl.create(:server)
      2.times { FactoryGirl.create(:user) }

      # counted as recent
      Timecop.freeze(Time.zone.now.midnight - 1.day) do
        @updated = FactoryGirl.create(:server)
        @updated.destroy
      end

      # not counted as recent
      Timecop.freeze(Time.zone.now.midnight - count_days.days - 1.second) do
        @not_updated = FactoryGirl.create(:server)
        @not_updated.destroy
      end
    end

    after(:all) do

    end

    it 'finds users with servers' 


    it 'finds users ids with no servers' 


    it 'calls zero update in slices' 

  end
end

