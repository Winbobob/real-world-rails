require 'spec_helper'

describe CouchSettings do

  describe '#new_with_defaults' do
    it 'should use correct config file' 


    it 'should use correct Rails env' 

  end

  before :each do
    @settings = CouchSettings.new 'test_path', 'test_env', {}
  end

  describe 'defaults' do
    it { expect(@settings.host).to eq('localhost') }
    it { expect(@settings.http_port).to eq('5984') }
    it { expect(@settings.https_port).to eq('6984') }
    it { expect(@settings.db_prefix).to eq('rapidftr') }
    it { expect(@settings.db_suffix).to eq('test_env') }
    it { expect(@settings.ssl_enabled_for_rapidftr?).to eq(false) }
  end

  describe 'HTTPS' do
    it 'returns https_port when using SSL' 


    it 'returns HTTPS uri with username and password' 


    xit 'should check whether SSL is enabled in CouchDB' do
    end
  end

  describe 'HTTP' do
    it 'returns http_port when not using SSL' 


    it 'returns HTTP uri with username and password' 

  end

end

