require "rails_helper"

class FakeGibbonRequest < Gibbon::Request
  def lists(*args); super end

  def members(*args); super end
end

RSpec.describe MailchimpBot do
  let(:user) { create(:user, :ignore_after_callback) }
  let(:article) { create(:article, user_id: user.id) }
  let(:my_gibbon_client) { instance_double(FakeGibbonRequest) }

  before do
    allow(Gibbon::Request).to receive(:new) { my_gibbon_client }
    allow(my_gibbon_client).to receive(:lists) { my_gibbon_client }
    allow(my_gibbon_client).to receive(:members) { my_gibbon_client }
    allow(my_gibbon_client).to receive(:upsert).and_return(true)
  end

  def matcher
    {
      body: {
        email_address: user.email,
        status: "subscribed",
        merge_fields: {
          NAME: user.name.to_s,
          USERNAME: user.username.to_s,
          TWITTER: user.twitter_username.to_s,
          GITHUB: user.github_username.to_s,
          IMAGE_URL: user.profile_image_url.to_s,
          ARTICLES: user.articles.size,
          COMMENTS: user.comments.size,
          ONBOARD_PK: user.onboarding_package_requested.to_s,
          EXPERIENCE: user.experience_level || 666,
          COUNTRY: user.shipping_country.to_s,
          STATE: user.shipping_state.to_s,
          POSTAL_ZIP: user.shipping_postal_code.to_s,
        },
      },
    }
  end

  describe "#upsert" do
    it "works" 

  end

  describe "#upsert_to_newsletter" do
    it "sends proper information" 


    it "unsubscribes properly" 


    it "subscribes properly" 


    it "updates email properly" 

  end

  describe "#upsert_to_membership_newsletter" do
    it "returns false if user isn't a sustaining member" 


    # rubocop:disable RSpec/ExampleLength
    context "when user is a sustaining member" do
      it "send proper information" 


      it "unsubscribes if monthly due become 0" 

    end
    # rubocop:enable RSpec/ExampleLength
  end
end

