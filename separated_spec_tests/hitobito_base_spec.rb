# encoding: utf-8

#  Copyright (c) 2012-2013, Jungwacht Blauring Schweiz. This file is part of
#  hitobito and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito.

require 'spec_helper'

describe MailRelay::Base do

  let(:simple)  { Mail.new(File.read(Rails.root.join('spec', 'fixtures', 'email', 'simple.eml'))) }
  let(:regular) { Mail.new(File.read(Rails.root.join('spec', 'fixtures', 'email', 'regular.eml'))) }
  let(:list)    { Mail.new(File.read(Rails.root.join('spec', 'fixtures', 'email', 'list.eml'))) }

  let(:relay) { MailRelay::Base.new(message) }

  before do
    # we do not have custom content for report loaded in test env
    allow_any_instance_of(DeliveryReportMailer).
      to receive(:bulk_mail)
  end

  describe '#receiver_from_received_header' do
    context 'simple' do
      let(:message) { simple }

      it 'returns nil' 

    end

    context 'regular' do
      let(:message) { regular }

      it 'returns receiver' 

    end

    context 'list' do
      let(:message) { list }

      it 'returns receiver' 

    end
  end

  describe '#envelope_receiver_name' do
    context 'regular' do
      let(:message) { regular }

      it 'returns receiver' 

    end
  end

  describe '#relay' do
    let(:message) { regular }

    subject { last_email }

    context 'without receivers' do
      before { relay.relay }

      it { is_expected.to be_nil }
    end

    context 'with receivers' do
      let(:receivers) { %w(a@example.com b@example.com) }
      before do
        allow(relay).to receive(:receivers).and_return(receivers)
        relay.relay
      end

      it { is_expected.to be_present }
      its(:smtp_envelope_to) { should == receivers }
      its(:to) { should == ['zumkehr@puzzle.ch'] }
      its(:from) { should == ['animation@jublaluzern.ch'] }

      context 'with internationalized domain names' do
        let(:receivers) { %w(a@exämple.com b@example.com) }

        its(:smtp_envelope_to) { should == %w(a@xn--exmple-cua.com b@example.com) }
      end

    end

  end

  describe '.relay_current' do
    it 'processes all mails' 


    it 'creates log entry for mail with rejected sender' 


    it 'creates log entry for mail with unknown recipient' 


    it 'skips already processed mail and sends airbrake notification' 


    it 'creates mail log entry for sent bulk mail' 


    # our mysql instances to not support storeing emojis
    it 'creates mail log entry for mail with emoji in subject' 


    it 'fails after one batch' 

  end
end

