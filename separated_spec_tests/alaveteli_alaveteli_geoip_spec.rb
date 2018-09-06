# -*- encoding : utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe AlaveteliGeoIP do

  describe '.country_code_from_ip' do

    it 'delegates to an instance of the class' 


  end

  describe '.instance' do

    it 'creates a new instance' 


    it 'caches the instance' 


  end

  describe '.new' do

    it 'configures the instance with the configured country code' 


    context 'if a database param is supplied' do

      it 'configures the instance with the database specified' 


    end

    context 'if there is a geoip database configured and present' do

      it 'configures the instance with an instance of geoip' 


    end

    context 'if there is only a Gaze URL configured' do

      it 'configures the instance with the Gaze URL' 


    end

  end

  describe '#country_code_from_ip' do

    context 'when the Gaze service is configured and is in different states' do

      before(:each) do
        FakeWeb.clean_registry
        allow(AlaveteliConfiguration).to receive(:geoip_database).and_return ''
      end

      after(:each) do
        FakeWeb.clean_registry
      end

      it "returns the country code if the service returns one" 


      it "returns the current code if the service domain doesn't exist" 


      it "returns the current code if the service doesn't exist" 


      it "returns the current code if the service isn't configured" 



      it "returns the current code and logs the error with url if the
           service returns an error" do
        FakeWeb.register_uri(:get, %r|500.com|, :body => "Error", :status => ["500", "Error"])
        allow(AlaveteliConfiguration).to receive(:gaze_url).and_return('http://500.com')
        expect(Rails.logger).to receive(:warn).with /500\.com.*500 Error/
        instance = AlaveteliGeoIP.new
        expect(instance.country_code_from_ip('127.0.0.1')).
          to eq(instance.current_code)
      end

    end

    context 'when the geoip database is configured' do

      it 'returns the country code if the geoip object returns one' 


    end

  end

end

