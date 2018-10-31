# -*- encoding : utf-8 -*-
require File.expand_path(File.join('..', '..', '..', 'spec_helper'), __FILE__)

describe "track_mailer/event_digest" do
  let(:user) { FactoryBot.create(:user, :name => "Test Us'r") }
  let(:body) { FactoryBot.create(:public_body, :name => "Apostrophe's") }
  let(:request) do
    FactoryBot.create(:info_request_with_incoming,
                      :public_body => body,
                      :user => user,
                      :title => "Request apostrophe's data")
  end
  let(:track) { FactoryBot.create(:search_track, :tracking_user => user) }
  let(:xapian_search) do
    double('xapian search', :results => [event], :words_to_highlight => 'test')
  end

  before do
    allow(AlaveteliConfiguration).to receive(:site_name).
      and_return("l'Information")
  end

  describe "tracking a response" do
    let(:event) do
      FactoryBot.create(:response_event,
                        :incoming_message => request.incoming_messages.last,
                        :info_request => request)
    end

    it "does not add HTMLEntities to the request title" 


    it "does not add HTMLEntities to the public body name" 


    it "does not add HTMLEntities to the user name" 

  end

  describe "tracking a followup" do
    let(:event) do
      FactoryBot.create(:response_event,
                        :outgoing_message => request.outgoing_messages.last,
                        :info_request => request,
                        :event_type => 'followup_sent')
    end

    it "does not add HTMLEntities to the request title" 


    it "does not add HTMLEntities to the public body name" 


    it "does not add HTMLEntities to the user name" 

  end

  describe "tracking a comment" do
    let(:comment) do
      FactoryBot.create(:comment, :info_request => request, :user => user)
    end
    let(:event) do
      FactoryBot.create(:info_request_event,
                        :comment => comment,
                        :info_request => request,
                        :event_type => 'comment')
    end

    it "does not add HTMLEntities to the request title" 


    it "does not add HTMLEntities to the user name" 

  end

  # this is unlikely to happen in real life, but happens in the test code
  describe "tracking a sent event" do
    let(:event) do
      FactoryBot.create(:info_request_event,
                        :outgoing_message => request.outgoing_messages.last,
                        :info_request => request,
                        :event_type => 'sent')
    end

    it "does not add HTMLEntities to the request title" 


    it "does not add HTMLEntities to the public body name" 


    it "does not add HTMLEntities to the user name" 

  end

  it "does not add HTMLEntities to the site name" 

end

