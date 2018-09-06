# -*- encoding : utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe TranslatableParams do
  include TranslatableParams

  describe '#translatable_params' do

    let(:keys) { { :translated_keys => [ :name, :locale ],
                   :general_keys => [ :status ] } }

    it 'whitelists translatable_params' 


  end

end

describe TranslatableParams::WhitelistedParams do

  describe '#whitelist' do

    let(:keys) { { :translated_keys => [ :name, :locale ],
                   :general_keys => [ :status ] } }

    it 'removes a non-whitelisted model param' 


    it 'allows id in the translation params' 


    it 'removes a non-whitelisted translation param' 


  end

end

