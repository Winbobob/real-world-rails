require "rails_helper"
require "support/helpers/features/user_accounts"

RSpec.describe "RequestDeliveryUpdates" do
  let!(:admin_user) { FactoryGirl.create(:admin_user) }
  let!(:user1) { FactoryGirl.create(:user) }
  let!(:user2) { FactoryGirl.create(:user) }
  let!(:user3) { FactoryGirl.create(:user) }
  let!(:study1) do
    FactoryGirl.create(:study, principal_investigator: user1,
                               study_stage: :delivery,
                               protocol_needed: false)
  end
  let!(:study2) do
    FactoryGirl.create(:study, principal_investigator: user1,
                               study_stage: :delivery,
                               protocol_needed: false)
  end
  let!(:study3) { FactoryGirl.create(:study, principal_investigator: user1) }
  let!(:study4) do
    FactoryGirl.create(:study, principal_investigator: user2,
                               study_stage: :delivery,
                               protocol_needed: false)
  end
  let!(:study5) { FactoryGirl.create(:study, principal_investigator: user3) }

  before do
    # Clear out emails for new users etc before our tests
    ActionMailer::Base.deliveries = []
  end

  it "allows you to create a new delivery update" 

end

