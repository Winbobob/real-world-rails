# -*- encoding : utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/alaveteli_dsl')

describe 'when making a zipfile available' do

  after do
    FileUtils.rm_rf(InfoRequest.download_zip_dir)
  end

  def inspect_zip_download(session, info_request)
    using_session(session) do
      visit show_request_path(info_request)
      within('.request-header__action-bar') do
        find_link('Download a zip file of all correspondence').click
      end

      Tempfile.open('download') do |f|
        f.binmode
        f.write(page.body)
        f.flush
        Zip::File.open(f.path) do |zip|
          yield zip
        end
      end
    end
  end

  def sleep_and_receive_mail(name, info_request)
    # The path of the zip file is based on the hash of the timestamp of the last request
    # in the thread, so we wait for a second to make sure this one will have a different
    # timestamp than the previous.
    sleep 1
    receive_incoming_mail(name, info_request.incoming_email)
  end

  context 'when an html to pdf converter is supplied' do

    before do
      # We want to test the contents of the pdf, and we don't know whether a particular
      # instance will have a working html_to_pdf tool, so just copy the HTML rendered
      # to the PDF file for the purposes of checking it doesn't contain anything that
      # shouldn't be there.
      allow(AlaveteliConfiguration).to receive(:html_to_pdf_command).and_return('/bin/cp')
    end

    context 'when an incoming message is made "requester_only"' do

      it 'should not include the incoming message or attachments in a download of the entire request
                by a non-request owner but should retain them for owner and admin' do

        # Non-owner can download zip with incoming and attachments
        non_owner = login(FactoryBot.create(:user))
        info_request = FactoryBot.create(:info_request_with_incoming_attachments)

        inspect_zip_download(non_owner, info_request) do |zip|
          expect(zip.count).to eq(3)
          expect(zip.read('correspondence.pdf')).to match('hereisthetext')
        end

        # Admin makes the incoming message requester only
        admin = login(FactoryBot.create(:admin_user))

        using_session(admin) do
          hide_incoming_message(info_request.incoming_messages.first,
                                'requester_only',
                                'boring')
        end

        # Admin retains the requester only things
        inspect_zip_download(admin, info_request) do |zip|
          expect(zip.count).to eq(3)
          expect(zip.read('correspondence.pdf')).to match('hereisthetext')
        end

        # Zip for non owner is now without requester_only things
        inspect_zip_download(non_owner, info_request) do |zip|
          expect(zip.count).to eq(1)
          correspondence_text = zip.read('correspondence.pdf')
          expect(correspondence_text).not_to match('hereisthetext')
          expected_text = "This message has been hidden.\n    boring"
          expect(correspondence_text).to match(expected_text)
        end

        # Requester retains the requester only things
        owner = login(info_request.user)
        inspect_zip_download(owner, info_request) do |zip|
          expect(zip.count).to eq(3)
          expect(zip.read('correspondence.pdf')).to match('hereisthetext')
        end

      end

    end

    context 'when an outgoing message is made "requester_only"' do

      it 'should not include the outgoing message in a download of the entire request
                by a non-request owner but should retain them for owner and admin' do

        # Non-owner can download zip with outgoing
        non_owner = login(FactoryBot.create(:user))
        info_request = FactoryBot.create(:info_request)

        inspect_zip_download(non_owner, info_request) do |zip|
          expect(zip.count).to eq(1)
          expect(zip.read('correspondence.pdf')).to match('Some information please')
        end

        # Admin makes the outgoing message requester only
        admin = login(FactoryBot.create(:admin_user))

        using_session(admin) do
          hide_outgoing_message(info_request.outgoing_messages.first,
                                'requester_only',
                                'boring')
        end

        # Admin retains the requester only things
        inspect_zip_download(admin, info_request) do |zip|
          expect(zip.count).to eq(1)
          expect(zip.read('correspondence.pdf')).to match('Some information please')
        end

        # Zip for non owner is now without requester_only things
        inspect_zip_download(non_owner, info_request) do |zip|
          expect(zip.count).to eq(1)
          correspondence_text = zip.read('correspondence.pdf')
          expect(correspondence_text).not_to match('Some information please')
          expected_text = "This message has been hidden.\n    boring"
          expect(correspondence_text).to match(expected_text)
        end

        # Requester retains the requester only things
        owner = login(info_request.user)
        inspect_zip_download(owner, info_request) do |zip|
          expect(zip.count).to eq(1)
          expect(zip.read('correspondence.pdf')).to match('Some information please')
        end

      end

    end

    context 'when a message contains redacted material' do

      it 'should use associated censor rules on outgoing messages' 


      it 'should use associated censor rules on the incoming messages' 


      it 'uses associated censor rules on attachments' 


    end

  end

  context 'when no html to pdf converter is supplied' do

    before do
      allow(AlaveteliConfiguration).to receive(:html_to_pdf_command).and_return('')
    end

    it "should update the contents of the zipfile when the request changes" 


    context 'when a request is "requester_only"' do

      before do
        @non_owner = login(FactoryBot.create(:user))
        @info_request = FactoryBot.create(:info_request_with_incoming,
                                          :prominence => 'requester_only')
        @request_owner = login(@info_request.user)
        @admin = login(FactoryBot.create(:admin_user))
      end


      it 'should allow a download of the request by the request owner and admin only' 

    end

    context 'when a request is "hidden"' do

      it 'should not allow a download of the request by an admin only' 


    end

    context 'when an incoming message is made "requester_only"' do

      it 'should not include the incoming message or attachments in a download of the entire request
                by a non-request owner but should retain them for owner and admin' do

        # Non-owner can download zip with outgoing
        non_owner = login(FactoryBot.create(:user))
        info_request = FactoryBot.create(:info_request_with_incoming_attachments)

        inspect_zip_download(non_owner, info_request) do |zip|
          expect(zip.count).to eq(3)
          expect(zip.read('correspondence.txt')).to match('hereisthetext')
        end

        # Admin makes the incoming message requester only
        admin = login(FactoryBot.create(:admin_user))

        using_session(admin) do
          hide_incoming_message(info_request.incoming_messages.first,
                                'requester_only',
                                'boring')
        end

        # Admin retains the requester only things
        inspect_zip_download(admin, info_request) do |zip|
          expect(zip.count).to eq(3)
          expect(zip.read('correspondence.txt')).to match('hereisthetext')
        end

        # Zip for non owner is now without requester_only things
        inspect_zip_download(non_owner, info_request) do |zip|
          expect(zip.count).to eq(1)
          correspondence_text = zip.read('correspondence.txt')
          expect(correspondence_text).not_to match('hereisthetext')
          expected_text = 'This message has been hidden. boring'
          expect(correspondence_text).to match(expected_text)
        end

        # Requester retains the requester only things
        owner = login(info_request.user)
        inspect_zip_download(owner, info_request) do |zip|
          expect(zip.count).to eq(3)
          expect(zip.read('correspondence.txt')).to match('hereisthetext')
        end

      end

    end

    context 'when an outgoing message is made "requester_only"' do

      it 'should not include the outgoing message in a download of the entire request
                by a non-request owner but should retain them for owner and admin' do

        # Non-owner can download zip with original message initially
        non_owner = login(FactoryBot.create(:user))
        info_request = FactoryBot.create(:info_request)

        inspect_zip_download(non_owner, info_request) do |zip|
          expect(zip.count).to eq(1)
          expect(zip.read('correspondence.txt')).to match('Some information please')
        end

        # Admin makes the outgoing message requester only
        admin = login(FactoryBot.create(:admin_user))

        using_session(admin) do
          visit edit_admin_outgoing_message_path info_request.outgoing_messages.first
          select 'requester_only', :from => 'Prominence'
          fill_in 'Reason for prominence', :with => 'boring'
          find_button('Save').click
        end

        # Admin retains the requester only things
        inspect_zip_download(admin, info_request) do |zip|
          expect(zip.count).to eq(1)
          expect(zip.read('correspondence.txt')).to match('Some information please')
        end

        # Zip for non owner is now without requester_only things
        inspect_zip_download(non_owner, info_request) do |zip|
          expect(zip.count).to eq(1)
          correspondence_text = zip.read('correspondence.txt')
          expect(correspondence_text).not_to match('Some information please')
          expected_text = 'This message has been hidden. boring'
          expect(correspondence_text).to match(expected_text)
        end

        # Requester retains the requester only things
        owner = login(info_request.user)
        inspect_zip_download(owner, info_request) do |zip|
          expect(zip.count).to eq(1)
          expect(zip.read('correspondence.txt')).to match('Some information please')
        end

      end

    end

    context 'when a message contains redacted material' do

      it 'should use associated censor rules on outgoing messages' 


      it 'should use associated censor rules on the incoming messages' 


      it 'uses associated censor rules on attachments' 


    end

    it 'should successfully make a zipfile for an external request' 

  end

end

