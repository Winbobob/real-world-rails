require 'spec_helper'

describe AsyncDownloadCookie do
  include ActiveSupport::Testing::TimeHelpers

  let(:cookie_jar) { ActionDispatch::Request.new({}).cookie_jar }
  let(:value)      { JSON.parse(cookie_jar[:async_downloads]) }
  let(:subject)    { described_class.new(cookie_jar) }

  it 'tracks single download in cookie' 


  it 'tracks multiple downloads in cookie' 


  it 'removes download from values' 


  it 'removes cookie if no values are left' 


  it 'removes properly when object is instantiated multiple times' 


  context 'Set-Cookie' do
    let(:now) { Time.zone.parse("Fri, 15 Jun 2018 10:35:57 CEST +02:00") }

    def write(timestamp)
      travel_to(timestamp) do
        {}.tap do |hash|
          yield
          cookie_jar.write(hash)
        end['Set-Cookie'].split('; ')
      end
    end

    it 'sets values as cookie' 


    it 'sets path' 


    it 'sets expires' 


    it 'updates expires when new entry is added' 

  end
end

