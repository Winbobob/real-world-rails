# -*- encoding : utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe AdminRawEmailController do

  describe 'GET show' do

    before do
      @raw_email = FactoryBot.create(:incoming_message).raw_email
    end

    describe 'html version' do

      it 'renders the show template' 


      context 'when showing a message with a "From" address in the holding pen' do

        before do
          @public_body = FactoryBot.create(:public_body,
                                           :request_email => 'body@example.uk')
          @info_request = FactoryBot.create(:info_request)
          raw_email_data = <<-EOF.strip_heredoc
          From: bob@example.uk
          To: #{@info_request.incoming_email}
          Subject: Basic Email
          Hello, World
          EOF
          @incoming_message = FactoryBot.create(
            :plain_incoming_message,
            :info_request => InfoRequest.holding_pen_request,
          )
          @incoming_message.raw_email.data = raw_email_data
          @incoming_message.raw_email.save!
          @info_request_event = FactoryBot.create(
            :info_request_event,
            :event_type => 'response',
            :info_request => InfoRequest.holding_pen_request,
            :incoming_message => @incoming_message,
            :params => {:rejected_reason => 'Too dull'}
          )
        end

        it 'assigns public bodies that match the "From" domain' 


        it 'assigns info requests based on the hash' 


        it 'assigns a reason why the message is in the holding pen' 


        it 'assigns a default reason if no reason is given' 


      end

    end

    describe 'text version' do

      it 'sends the email as an RFC-822 attachment' 

    end

  end

end

