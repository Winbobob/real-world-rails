# -*- encoding : utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/alaveteli_dsl')

describe "When viewing requests" do

  before do
    @info_request = FactoryBot.create(:info_request)
    @unregistered = without_login
  end

  it 'allows the user to link to individual messages' 


  it "should not make endlessly recursive JSON <link>s" 


  it 'should not raise a routing error when making a json link for a request with an
       "action" querystring param' do
    using_session(@unregistered) do
      browse_request("#{@info_request.url_title}?action=add")
    end
  end

  context "when a request is hidden by an admin" do

    it 'should not retain any cached attachments to be served up by the webserver' 


  end

  context 'when a response has prominence "normal"' do

    before do
      @info_request = FactoryBot.create(:info_request_with_incoming)
    end

    it 'should show the message itself to any user' 


  end

  context 'when a response has prominence "hidden"' do

    before do
      @info_request = FactoryBot.create(:info_request_with_incoming)
      message = @info_request.incoming_messages.first
      message.prominence = 'hidden'
      message.prominence_reason = 'It is too irritating.'
      message.save!
    end

    it 'should show a hidden notice, not the message, to an unregistered user or the requester and
            the message itself to an admin ' do

      # unregistered
      using_session(without_login) do
        browse_request(@info_request.url_title)
        expect(page).to have_content("This message has been hidden.")
        expect(page).to have_content("It is too irritating.")
        expect(page).not_to have_content("sign in</a> to view the message.")
        expect( page).not_to have_content("hereisthetext")
      end

      # requester
      owner = login(@info_request.user)
      using_session(owner) do
        browse_request(@info_request.url_title)
        expect(page).to have_content("This message has been hidden.")
        expect(page).to have_content("It is too irritating")
        expect(page).not_to have_content("hereisthetext")
      end

      # admin
      admin_user = login(FactoryBot.create(:admin_user))
      using_session(admin_user) do
        browse_request(@info_request.url_title)
        expect(page).to have_content('hereisthetext')
        expect(page).to have_content("This message has prominence 'hidden'.")
        expect(page).to have_content("It is too irritating.")
        expect(page).to have_content("You can only see it because you are logged in as a super user.")
      end
    end

  end

  context 'when a response has prominence "requester_only"' do

    before do
      @info_request = FactoryBot.create(:info_request_with_incoming)
      message = @info_request.incoming_messages.first
      message.prominence = 'requester_only'
      message.prominence_reason = 'It is too irritating.'
      message.save!
    end

    it 'should show a hidden notice with login link to an unregistered user, and the message itself
            with a hidden note to the requester or an admin' do

      # unregistered
      using_session(without_login) do
        browse_request(@info_request.url_title)
        expect(page).to have_content("This message has been hidden.")
        expect(page).to have_content("It is too irritating")
        expect(page).to have_content("sign in to view the message.")
        expect(page).not_to have_content("hereisthetext")
      end

      # requester
      owner = login(@info_request.user)
      using_session(owner) do
        browse_request(@info_request.url_title)
        expect(page).to have_content("hereisthetext")
        expect(page).to have_content("This message is hidden, so that only you, the requester, can see it.")
        expect(page).to have_content("It is too irritating.")
      end

      # admin
      admin_user = login(FactoryBot.create(:admin_user))
      using_session(admin_user) do
        browse_request(@info_request.url_title)
        expect(page).to have_content('hereisthetext')
        expect(page).not_to have_content("This message has been hidden.")
        expect(page).to have_content("This message is hidden, so that only you, the requester, can see it.")
      end
    end

  end

  context 'when an outgoing message has prominence "requester_only"' do

    before do
      @info_request = FactoryBot.create(:info_request)
      message = @info_request.outgoing_messages.first
      message.prominence = 'requester_only'
      message.prominence_reason = 'It is too irritating.'
      message.save!
    end

    it 'should show a hidden notice with login link to an unregistered user, and the message itself
            with a hidden note to the requester or an admin' do

      # unregistered
      using_session(without_login) do
        browse_request(@info_request.url_title)
        expect(page).to have_content("This message has been hidden.")
        expect(page).to have_content("It is too irritating")
        expect(page).to have_content("sign in to view the message.")
        expect(page).not_to have_content("Some information please")
      end

      # requester
      owner = login(@info_request.user)
      using_session(owner) do
        browse_request(@info_request.url_title)
        expect(page).to have_content("Some information please")
        expect(page).to have_content("This message is hidden, so that only you, the requester, can see it.")
        expect(page).to have_content("It is too irritating.")
      end

      # admin
      admin_user = login(FactoryBot.create(:admin_user))
      using_session(admin_user) do
        browse_request(@info_request.url_title)
        expect(page).to have_content('Some information please')
        expect(page).not_to have_content("This message has been hidden.")
        expect(page).to have_content("This message is hidden, so that only you, the requester, can see it.")
      end
    end

  end

end

