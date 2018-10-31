require 'rails_helper'

describe RemoveCouponCodes do
  context "enqueing jobs" do
    before(:each) do
      Sidekiq::Testing.fake!
      Sidekiq::Worker.clear_all
    end
    it "should enque job" 

  end

  context "performing task" do
    let(:user) {  FactoryGirl.build(:user) }

    before(:each) do
      Timecop.freeze(7.month.ago) do
        user.servers << FactoryGirl.build(:server, memory: 512)
        user.servers << FactoryGirl.build(:server, memory: 1024)
        user.account.coupon = FactoryGirl.create(:coupon)
      end
    end

    it "removes coupon" 


    it 'recalculates forecasted_revenue' 

  end
end

