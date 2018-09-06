require 'spec_helper'

def find_email_body_for(email)
  ActionMailer::Base.deliveries.select do |e|
    e.to.first == email.address
  end.first
end

describe "CommunityMailer", type: :mailer do

  # Include EmailSpec stuff (https://github.com/bmabey/email-spec)
  include(EmailSpec::Helpers)
  include(EmailSpec::Matchers)

  describe "#community_updates" do

    before(:each) do
      @c1 = FactoryGirl.create(:community)
      @c1.community_customizations.first.update_attribute(:name, "MarketTestPlace")

      @p1 = FactoryGirl.create(:person, :emails => [ FactoryGirl.create(:email, :address => "update_tester@example.com") ])
      @p1.accepted_community = @c1
      @l2 = FactoryGirl.create(:listing,
          :title => "hammer",
          :created_at => 2.days.ago,
          :updates_email_at => 2.days.ago,
          :listing_shape_id => 123,
          :community_id => @c1.id,
          :description => "<b>shiny</b> new hammer, see details at http://en.wikipedia.org/wiki/MC_Hammer")

      @p1_unsubscribe_token = AuthToken.create_unsubscribe_token(person_id: @p1.id).token

      @email = CommunityMailer.community_updates(
        recipient: @p1,
        community: @p1.accepted_community,
        listings: [@l2],
        unsubscribe_token: @p1_unsubscribe_token
      )
    end

    it "should have correct address and subject" 


    it "should have correct links" 


    it "should include valid auth_token in links" 


    it "should contain correct service name in the link" 

  end

  describe "#deliver_community_updates" do
    before(:each) do

      # for some reason there were more existing users here than should, which confused results
      # delete all to have clear table
      Person.all.each(&:destroy)

      @c1 = FactoryGirl.create(:community)
      @c2 = FactoryGirl.create(:community)
      @p1 = FactoryGirl.create(:person)
      @p1.accepted_community = @c1
      @p2 = FactoryGirl.create(:person)
      @p2.accepted_community = @c1

      @l1 = FactoryGirl.create(:listing,
          :title => "bike",
          :description => "A very nice bike",
          :created_at => 3.hours.ago,
          :listing_shape_id => 123,
          :community_id => @c1.id,
          :author => @p1)
      @l2 = FactoryGirl.create(:listing,
          :title => "motorbike",
          :description => "fast!",
          :created_at => 1.hour.ago,
          :listing_shape_id => 123,
          :community_id => @c2.id,
          :author => @p2)

      @p3 = FactoryGirl.create(:person)
      @p3.accepted_community = @c1
      @p4 = FactoryGirl.create(:person)
      @p4.accepted_community = @c1

      @p1.update_attribute(:community_updates_last_sent_at, 8.hours.ago)
      @p2.update_attribute(:community_updates_last_sent_at, 14.days.ago)
      @p3.update_attribute(:community_updates_last_sent_at, 3.days.ago)
      @p4.update_attribute(:community_updates_last_sent_at, 9.days.ago)

      @p1.update_attribute(:min_days_between_community_updates, 1)
      @p2.update_attribute(:min_days_between_community_updates, 1)
      @p3.update_attribute(:min_days_between_community_updates, 7)
      @p4.update_attribute(:min_days_between_community_updates, 7)
    end

    it "should send only to people who want it now" 


    it "should contain specific time information" 


    it "should send with default 7 days to those with nil as last time sent" 


  end
end

