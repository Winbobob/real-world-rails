# encoding: utf-8

#  Copyright (c) 2012-2018, Jungwacht Blauring Schweiz. This file is part of
#  hitobito and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito.

require 'spec_helper'

describe MailRelay::BulkMail do

  let(:message)  { Mail.new(File.read(Rails.root.join('spec', 'fixtures', 'email', 'simple.eml'))) }
  let(:recipients) { 16.times.collect { Faker::Internet.email } }
  let(:envelope_sender) { 'mailing_list@example.hitobito.com' }
  let(:delivery_report_to) { 'author@example.hitobito.com' }
  let(:bulk_mail) { MailRelay::BulkMail.new(message, envelope_sender, delivery_report_to, recipients) }
  let(:failed_recipients) { bulk_mail.instance_variable_get(:@failed_recipients) }
  let(:logger) { double }
  let(:log_prefix) { "BULK MAIL #{envelope_sender} '#{message.subject}' |" }

  before do
    allow(bulk_mail)
      .to receive(:sleep)
      .with(5)

    allow(bulk_mail)
      .to receive(:logger)
      .and_return(logger)

    allow(logger)
      .to receive(:info)
  end

  describe 'delivery error' do

    context 'at initial deliver' do

      it 'throws exception if smtp connection error' 


      it 'throws exception if smtp relaying denied' 


    end

    context 'after previous successful deliver of recipients block' do

      before do
        # initial block deliver successful
        expect(message)
          .to receive(:deliver)

        # make sure report is sent
        expect(bulk_mail)
          .to receive(:delivery_report)
      end

      it 'retries delivery after 5mins' 


      it 'retries delivery a second time after 10mins' 


      it 'cancels all remaining recipients if still unable to deliver at third try' 


    end

    context 'domain not found error' do

      let(:invalid_domain_email) { recipients[3] }
      let(:domain_not_found_error) { "450 4.1.2 #{invalid_domain_email}: Recipient address rejected: Domain not found" }

      it 'skips recipients with invalid mail domain' 


      it 'raises error if email cannot be extracted from smtp error message' 


    end

    context 'only one recipient' do

      let(:recipient) { Faker::Internet.email }
      let(:domain_not_found_error) { "450 4.1.2 #{recipient}: Recipient address rejected: Domain not found" }
      let(:recipients) { [recipient] }

      it 'failing' 


    end

  end

  describe 'send' do

    context 'bulk send' do

      let(:recipients) { 42.times.collect { Faker::Internet.email } }

      it 'sends mail to recipients in blocks' 


    end

    context 'without subject' do

      it 'delivers message' 


    end

    context 'with delivery_report_to set to nil' do

      let(:delivery_report_to) { nil }

      it 'does not send delivery_report' 

    end


  end

end

