require 'spec_helper'

describe UserMailer, type: :mailer do

  context "claim notification" do
    title = 'Imported Work Title'
    title2 = 'Second ' + title
    let(:author) { create(:user) }
    let(:work) { create(:work, title: title, authors: [author.pseuds.first]) }
    let(:work2) { create(:work, title: title2, authors: [author.pseuds.first]) }
    let(:email) { UserMailer.claim_notification(author.id, [work.id, work2.id], true).deliver }

    # Shared content tests for both email types
    shared_examples_for 'claim content' do
      it 'contains the text for a claim email' 

    end

    # Test the headers
    it 'has a valid from line' 


    it 'has the correct subject line' 


    # Test both body contents
    it_behaves_like "multipart email"

    describe 'HTML version' do
      it_behaves_like "claim content" do
        let(:part) { get_message_part(email, /html/) }
      end

      it 'lists the first imported work in an unordered list in the HTML body' 


      it 'lists the second imported work in an unordered list in the HTML body' 


      it 'only has style_to links in the HTML body' 

    end

    describe 'text version' do
      it_behaves_like 'claim content' do
        let(:part) { get_message_part(email, /plain/) }
      end

      it 'lists the first imported work as plain text' 


      it 'lists the second imported work with a leading hyphen' 

    end
  end

  describe "invitation to claim" do
    title = 'Imported Work Title'
    title2 = 'Second ' + title
    token = 'abc123'

    before(:each) do
      @author = FactoryGirl.create(:user)
      @archivist = FactoryGirl.create(:user)
      @external_author = FactoryGirl.create(:external_author)
      @external_author_name = FactoryGirl.create(:external_author_name, external_author_id: @external_author.id, name: 'External Author')

      @invitation = FactoryGirl.create(:invitation, token: token, external_author_id: @external_author.id)
      @fandom1 = FactoryGirl.create(:fandom)

      @work = FactoryGirl.create(:work, title: title, fandoms: [@fandom1], authors: [@author.pseuds.first])
      @work2 = FactoryGirl.create(:work, title: title2, fandoms: [@fandom1], authors: [@author.pseuds.first])
      FactoryGirl.create(:external_creatorship, creation_id: @work.id, external_author_name_id: @external_author_name.id)
      FactoryGirl.create(:external_creatorship, creation_id: @work2.id, external_author_name_id: @external_author_name.id)
    end

    # before(:all) doesn't get cleaned up by database cleaner
    after(:all) do
      @author.destroy if @author
      @archivist.destroy if @archivist
      @external_author.destroy if @external_author
      @external_author_name.destroy if @external_author_name

      @invitation.destroy if @invitation
      @fandom1.destroy if @fandom1

      @work.destroy if @work
      @work2.destroy if @work2
    end

    let(:email) { UserMailer.invitation_to_claim(@invitation.id, @archivist.login).deliver }

    # Shared content tests for both email types
    shared_examples_for 'invitation to claim content' do
      it 'contains the text for an invitation claim email' 

    end

    # Test the headers
    it 'has a valid from line' 


    it 'has the correct subject line' 


    # Test both body contents
    it_behaves_like "multipart email"

    describe 'HTML version' do
      it_behaves_like 'invitation to claim content' do
        let(:part) { get_message_part(email, /html/) }
      end

      it 'lists the first imported work in an unordered list in the HTML body' 


      it 'lists the second imported work in an unordered list in the HTML body' 


      it 'only has style_to links in the HTML body' 


      it 'does not have exposed HTML' 


      it 'does not have missing translations' 

    end

    describe 'text version' do
      it_behaves_like 'invitation to claim content' do
        let(:part) { get_message_part(email, /plain/) }
      end

      it 'lists the first imported work as plain text' 


      it 'lists the second imported work with a leading hyphen' 


      it 'does not have missing translations' 

    end
  end
  
  describe "invitation from a user request" do
    token = 'abc123'

    before(:each) do
      @user = FactoryGirl.create(:user)
      @invitation = FactoryGirl.create(:invitation, token: token, creator: @user)
    end

    let(:email) { UserMailer.invitation(@invitation.id).deliver }

    # Test the headers
    it 'has a valid from line' 


    it 'has the correct subject line' 


    # Test both body contents
    it_behaves_like "multipart email"

    describe 'HTML version' do
      it 'has text contents' 

      
      it 'does not have missing translations' 

    end

    describe 'text version' do
      it 'says the right thing' 

      
      it 'does not have missing translations' 

    end
  end
  
  describe "invitation" do
    token = 'abc123'

    before(:each) do
      @user = FactoryGirl.create(:user)
      @invitation = FactoryGirl.create(:invitation, token: token)
    end

    let(:email) { UserMailer.invitation(@invitation.id).deliver }

    # Test the headers
    it 'has a valid from line' 


    it 'has the correct subject line' 


    # Test both body contents
    it_behaves_like "multipart email"

    describe 'HTML version' do
      it 'has text contents' 

      
      it 'does not have missing translations' 

      
      it 'does not have exposed HTML' 

    end

    describe 'text version' do
      it 'says the right thing' 

      
      it 'does not have missing translations' 

    end
  end

  describe "challenge assignment" do
    let!(:gift_exchange) { create(:gift_exchange) }
    let!(:collection) { create(:collection, challenge: gift_exchange, challenge_type: "GiftExchange") }
    let!(:otheruser) { create(:user) }
    let!(:offer) { create(:challenge_signup, collection: collection, pseud: otheruser.default_pseud) }
    let!(:open_assignment) { create(:challenge_assignment, collection: collection, offer_signup: offer) }

    let(:email) { UserMailer.challenge_assignment_notification(collection.id, otheruser.id, open_assignment.id).deliver }

    # Test the headers
    it 'has a valid from line' 


    it 'has the correct subject line' 


    # Test both body contents
    it_behaves_like "multipart email"

    describe 'HTML version' do
      it 'has text contents' 

      
      it 'does not have missing translations' 

      
      it 'does not have exposed HTML' 

    end

    describe 'text version' do
      it 'says the right thing' 

      
      it 'does not have missing translations' 

    end
  end
end

