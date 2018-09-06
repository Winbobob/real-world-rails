require 'rails_helper'

RSpec.describe EmailThresholdReminderJob, type: :job do
  let!(:moderator_1) { FactoryBot.create(:moderator_user, email: "alice@parliament.uk") }
  let!(:moderator_2) { FactoryBot.create(:moderator_user, email: "bob@parliament.uk") }

  let!(:petition_1) { FactoryBot.create(:open_petition, signature_count: 11) }
  let!(:petition_2) { FactoryBot.create(:open_petition, signature_count: 10) }
  let!(:petition_3) { FactoryBot.create(:open_petition, signature_count: 9) }
  let!(:petition_4) { FactoryBot.create(:open_petition, notified_by_email: true) }

  let(:deliveries) { ActionMailer::Base.deliveries }
  let(:email) { deliveries.last }

  before do
    allow(Site).to receive(:threshold_for_debate).and_return(10)
  end

  it "send out an email alert" 


  it "delivers it to all the moderators" 


  it "updates notified by email on petition 1" 


  it "updates notified by email on petition 2" 

end

