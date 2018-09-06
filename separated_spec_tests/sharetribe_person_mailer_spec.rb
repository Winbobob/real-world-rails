require 'spec_helper'

describe PersonMailer, type: :mailer do

  # Include EmailSpec stuff (https://github.com/bmabey/email-spec)
  include(EmailSpec::Helpers)
  include(EmailSpec::Matchers)

  before(:each) do
    @test_person = FactoryGirl.create(:person)
    @test_person2 = FactoryGirl.create(:person)
    @test_person2.locale = "en"
    @test_person2.save
    @community = FactoryGirl.create(:community)
  end

  it "should send email about a new message" 


  it "should send email about a new comment to own listing" 


  it "should send email about listing with payment but without user's payment details" 


  describe "status changed" do

    let(:author) { FactoryGirl.build(:person) }
    let(:listing) { FactoryGirl.build(:listing, author: author, listing_shape_id: 123) }
    let(:starter) { FactoryGirl.build(:person, given_name: "Teppo", family_name: "Testaaja") }
    let(:conversation) { FactoryGirl.build(:conversation) }
    let(:transaction) { FactoryGirl.create(:transaction, listing: listing, starter: starter, conversation: conversation) }
    let(:community) { FactoryGirl.create(:community) }

    before(:each) do
      conversation.messages.build({
        sender: starter,
        content: "Test"
      })
    end

    it "should send email about an accepted offer or request" 


    it "should send email about a rejected offer or request" 


  end

  it "should send email about a new testimonial" 


  it "should remind about testimonial" 


  it "should send email to admins of new feedback" 


  it "should send email to community admins of new feedback if that setting is on" 


  it "should send email to community admins of new member if wanted" 


  describe "#welcome_email" do

    before(:each) do
      @c1 = FactoryGirl.create(:community)
      @p1 = FactoryGirl.create(:person, :emails => [ FactoryGirl.create(:email, :address => "update_tester@example.com") ])

      @p1.accepted_community = @c1
    end

    it "should welcome a regular member" 


    it "should contain custom content if that is defined for the community" 


  end

  describe "#new_listing_by_followed_person" do

    before do
      @community = FactoryGirl.create(:community)
      @listing = FactoryGirl.create(:listing, listing_shape_id: 123, community_id: @community.id)
      @recipient = FactoryGirl.create(:person)
    end

    it "should notify of a new listing" 


  end

  describe "#community_member_email_from_admin" do
    let(:community) { FactoryGirl.create(:community) }
    let(:sender) { FactoryGirl.create(:person, member_of: community, member_is_admin: true) }
    let(:recipient) { FactoryGirl.create(:person, member_of: community) }

    it 'works ordinary user as recipient' 


    it 'works yourself as recipient' 

  end

  describe "#transaction_confirmed" do
    let(:community) { FactoryGirl.create(:community) }
    let(:seller) {
      FactoryGirl.create(:person, member_of: community,
                                  given_name: "Joan", family_name: "Smith")
    }
    let(:buyer) { FactoryGirl.create(:person, member_of: community) }
    let(:listing) { FactoryGirl.create(:listing, community_id: community.id, author: seller) }
    let(:confirmed_transaction) {
      FactoryGirl.create(:transaction, starter: buyer,
                                       community: community, listing: listing,
                                       current_state: 'confirmed')
    }

    it 'works with default payment gateway' 


    it 'works with stripe payment gateway' 

  end
end

