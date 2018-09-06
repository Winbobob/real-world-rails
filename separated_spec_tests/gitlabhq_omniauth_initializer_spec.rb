require 'spec_helper'

describe Gitlab::OmniauthInitializer do
  let(:devise_config) { class_double(Devise) }

  subject { described_class.new(devise_config) }

  describe '#execute' do
    it 'configures providers from array' 


    it 'allows "args" array for app_id and app_secret' 


    it 'passes app_id and app_secret as additional arguments' 


    it 'passes "args" hash as symbolized hash argument' 


    it 'configures fail_with_empty_uid for shibboleth' 


    it 'configures remote_sign_out_handler proc for authentiq' 


    it 'configures on_single_sign_out proc for cas3' 

  end
end

