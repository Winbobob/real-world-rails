require "spec_helper"
include EmailSpec::Helpers
include EmailSpec::Matchers

describe AdminMailer, '#payment_notification' do
  before(:each) do
    FactoryGirl.create(:settings)
    FactoryGirl.create(:user, :admin)
    @campaign = FactoryGirl.create(:campaign)
    @payment = FactoryGirl.create(:payment, campaign: @campaign)
    @email = AdminMailer.payment_notification(@payment.id)
  end

  it 'delivers the snippet to the proper address' 


  it "has the correct subject" 


  it "contains the proper copy" 

end

