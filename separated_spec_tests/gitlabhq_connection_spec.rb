require 'spec_helper'

describe Bitbucket::Connection do
  before do
    allow_any_instance_of(described_class).to receive(:provider).and_return(double(app_id: '', app_secret: ''))
  end

  describe '#get' do
    it 'calls OAuth2::AccessToken::get' 

  end

  describe '#expired?' do
    it 'calls connection.expired?' 

  end

  describe '#refresh!' do
    it 'calls connection.refresh!' 

  end
end

