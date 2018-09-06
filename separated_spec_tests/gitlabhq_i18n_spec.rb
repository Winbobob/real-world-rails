require 'spec_helper'

describe Gitlab::I18n do
  let(:user) { create(:user, preferred_language: 'es') }

  describe '.locale=' do
    after do
      described_class.use_default_locale
    end

    it 'sets the locale based on current user preferred language' 

  end

  describe '.use_default_locale' do
    it 'resets the locale to the default language' 

  end
end

