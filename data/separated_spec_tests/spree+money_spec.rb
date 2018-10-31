require 'spec_helper'

describe Spree::Money do
  before do
    configure_spree_preferences do |config|
      config.currency = 'USD'
    end
  end

  let(:money)    { described_class.new(10) }
  let(:currency) { Money::Currency.new('USD') }

  it 'formats correctly' 


  it 'can get cents' 


  it 'can get currency' 


  context 'with currency' do
    it 'passed in option' 

  end

  context 'hide cents' do
    it 'hides cents suffix' 


    it 'shows cents suffix' 

  end

  context 'currency parameter' do
    context 'when currency is specified in Canadian Dollars' do
      it 'uses the currency param over the global configuration' 

    end

    context 'when currency is specified in Japanese Yen' do
      it 'uses the currency param over the global configuration' 

    end
  end

  context 'format' do
    it 'passed in option' 

  end

  context 'sign before symbol' do
    it 'defaults to -$10.00' 


    it 'passed in option' 

  end

  context 'JPY' do
    before do
      configure_spree_preferences do |config|
        config.currency = 'JPY'
      end
    end

    it 'formats correctly' 

  end

  context 'EUR' do
    before do
      configure_spree_preferences do |config|
        config.currency = 'EUR'
      end
    end

    # Regression test for #2634
    it 'formats as plain by default' 


    # rubocop:disable Style/AsciiComments
    it 'formats as HTML if asked (nicely) to' 


    it 'formats as HTML with currency' 

    # rubocop:enable Style/AsciiComments
  end

  context 'Money formatting rules' do
    before do
      configure_spree_preferences do |config|
        config.currency = 'EUR'
      end
    end

    after do
      described_class.default_formatting_rules.delete(:decimal_mark)
      described_class.default_formatting_rules.delete(:thousands_separator)
    end

    let(:money) { described_class.new(10) }

    describe '#decimal_mark' do
      it 'uses decimal mark set in Monetize gem' 


      it 'favors decimal mark set in default_formatting_rules' 


      it 'favors decimal mark passed in as a parameter on initialization' 

    end

    describe '#thousands_separator' do
      it 'uses thousands separator set in Monetize gem' 


      it 'favors decimal mark set in default_formatting_rules' 


      it 'favors decimal mark passed in as a parameter on initialization' 

    end
  end

  describe '#amount_in_cents' do
    %w[USD JPY KRW].each do |currency_name|
      context "when currency is #{currency_name}" do
        let(:money) { described_class.new(100, currency: currency_name) }

        it { expect(money.amount_in_cents).to eq(10000) }
      end
    end
  end

  describe '#as_json' do
    let(:options) { double('options') }

    it 'returns the expected string' 

  end
end

