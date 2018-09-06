#
# Copyright (C) 2015 - present Instructure, Inc.
#
# This file is part of Canvas.
#
# Canvas is free software: you can redistribute it and/or modify it under
# the terms of the GNU Affero General Public License as published by the Free
# Software Foundation, version 3 of the License.
#
# Canvas is distributed in the hope that it will be useful, but WITHOUT ANY
# WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
# A PARTICULAR PURPOSE. See the GNU Affero General Public License for more
# details.
#
# You should have received a copy of the GNU Affero General Public License along
# with this program. If not, see <http://www.gnu.org/licenses/>.

require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper.rb')

describe 'Canvas::Twilio' do
  def make_phone_number_stub(number, country_code)
    phone_number_stub = double("Canvas::Twilio.lookups_client.phone_numbers(#{number})")
    fetch_stub = double("Canvas::Twilio.lookups_client.phone_numbers(#{number}).fetch")
    allow(fetch_stub).to receive(:country_code).and_return(country_code)
    allow(phone_number_stub).to receive(:fetch).and_return(fetch_stub)
    phone_number_stub
  end

  def stub_twilio(available_phone_numbers, phone_number_countries = {})
    phone_number_objects = available_phone_numbers.map do |number|
      double("Canvas::Twilio.client.incoming_phone_numbers.list/#{number}",
        phone_number: number
      )
    end

    lookups = double('Canvas::Twilio.client.lookups')
    # Expectations are matched last to first, so add our catch-all expectation before the number specific ones
    allow(lookups).to receive(:phone_numbers).with(anything).and_return(
      make_phone_number_stub('anything', Canvas::Twilio::DEFAULT_COUNTRY)
    )
    # Now add one expectation for each number+country mapping
    phone_number_countries.each do |number, country_code|
      allow(lookups).to receive(:phone_numbers).with(number).and_return(
        make_phone_number_stub(number.inspect, country_code)
      )
    end

    account = double('Canvas::Twilio.client.account')
    allow(account).to receive(:incoming_phone_numbers).and_return(
      double('Canvas::Twilio.client.api.account.client.incoming_phone_numbers',
        stream: phone_number_objects
      )
    )
    allow(account).to receive(:messages).and_return(double)

    client = double('Canvas::Twilio.client')
    allow(client).to receive(:lookups).and_return(lookups)
    allow(client).to receive(:api).and_return(
      double('Canvas::Twilio.client.api', account: account)
    )
    allow(Canvas::Twilio).to receive(:client).and_return(client)
  end

  def test_hrw(number_map)
    stub_twilio(number_map.keys.shuffle)

    number_map.each do |sender, recipients|
      recipients.each do |recipient|
        expect(Canvas::Twilio.client.api.account.messages).to receive(:create).with(from: sender, to: recipient, body: 'message text')

        Canvas::Twilio.deliver(recipient, 'message text')
      end
    end
  end

  describe '.deliver' do
    it 'sends messages' 


    it 'uses HRW hashing to choose which numbers to send from' 


    it 'raises an exception when attempting to deliver without a config file' 


    it "delivers to a phone number in the recipient's country if such a phone number exists" 


    it "defaults to the default country if we don't own any phone numbers in the recipient's country" 


    it "defaults to the default country if we tell it not to send from the recipient's country" 


    it 'pings StatsD about outgoing messages' 

  end
end

