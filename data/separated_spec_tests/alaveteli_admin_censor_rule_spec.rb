# -*- encoding : utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/alaveteli_dsl')

describe 'Updating censor rules' do
  let!(:admin) do
    confirm(:admin_user)
    login(:admin_user)
  end

  let(:user) { FactoryGirl.create(:user) }
  let(:authority) { FactoryGirl.create(:public_body) }
  let(:request) do
    FactoryGirl.create(:info_request,
                       :public_body => authority,
                       :user => user)
  end

  let!(:incoming_message) do
    raw_email_data = <<-EOF.strip_heredoc
    From: authority@example.com
    To: Jane Doe <request-magic-email@example.net>
    Subject: A response

    I have a rubbish answer for you
    EOF

    incoming_message = FactoryGirl.create(:incoming_message,
                                          :info_request => request)
    incoming_message.raw_email.data = raw_email_data
    incoming_message.parse_raw_email!(true)
    InfoRequestEvent.create(:event_type => "response",
                            :incoming_message => incoming_message,
                            :info_request => request,
                            :params => {
                              :incoming_message_id => incoming_message.id
                            })
    incoming_message
  end

  before do
    allow(AlaveteliConfiguration).to receive(:skip_admin_auth).and_return(false)
  end

  describe "Authority censor rules" do

    it 'clears the cache for existing requests when a new rule is added' 


    it 'clears the cache for existing requests when a rule is updated' 


    it 'clears the cache for existing requests when a rule is deleted' 


  end

  describe "User censor rules" do

    it 'clears the cache for existing requests when a new rule is added' 


    it 'clears the cache for existing requests when a rule is updated' 


    it 'clears the cache for existing requests when a rule is deleted' 


  end

  describe "Request censor rules" do

    it 'clears the cache for existing requests when a new rule is added' 


    it 'clears the cache for existing requests when a rule is updated' 


    it 'clears the cache for existing requests when a rule is deleted' 


  end

  describe "Global censor rules" do

    it 'clears the cache for existing requests when a new rule is added' 


    it 'clears the cache for existing requests when a rule is updated' 


    it 'clears the cache for existing requests when a rule is deleted' 


  end

end

