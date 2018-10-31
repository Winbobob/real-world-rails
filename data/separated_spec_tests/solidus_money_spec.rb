# frozen_string_literal: true

require 'spec_helper'
require 'spree/money'

RSpec.describe Spree::Money do
  before do
    configure_spree_preferences do |config|
      config.currency = "USD"
    end
  end

  describe '#initialize' do
    subject do
      Spree::Deprecation.silence do
        described_class.new(amount, currency: currency, with_currency: true).to_s
      end
    end

    context 'with no currency' do
      let(:currency) { nil }
      let(:amount){ 10 }
      it { should == "$10.00 USD" }
    end

    context 'with currency' do
      let(:currency){ 'USD' }

      context "CAD" do
        let(:amount){ '10.00' }
        let(:currency){ 'CAD' }
        it { should == "$10.00 CAD" }
      end

      context "with string amount" do
        let(:amount){ '10.00' }
        it { should == "$10.00 USD" }
      end

      context "with no decimal point" do
        let(:amount){ '10' }
        it { should == "$10.00 USD" }
      end

      context "with symbol" do
        let(:amount){ '$10.00' }
        it { should == "$10.00 USD" }
      end

      context "with extra currency" do
        let(:amount){ '$10.00 USD' }
        it { should == "$10.00 USD" }
      end

      context "with different currency" do
        let(:currency){ 'USD' }
        let(:amount){ '$10.00 CAD' }
        it { should == "$10.00 CAD" }
      end

      context "with commas" do
        let(:amount){ '1,000.00' }
        it { should == "$1,000.00 USD" }
      end

      context "with comma for decimal point" do
        let(:amount){ '10,00' }
        it { should == "$10.00 USD" }
      end

      context 'with fixnum' do
        let(:amount){ 10 }
        it { should == "$10.00 USD" }
      end

      context 'with float' do
        let(:amount){ 10.00 }
        it { should == "$10.00 USD" }
      end

      context 'with BigDecimal' do
        let(:amount){ BigDecimal('10.00') }
        it { should == "$10.00 USD" }
      end
    end
  end

  it "formats correctly" 


  it "can get cents" 


  context "with currency" do
    it "passed in option" 

  end

  context "hide cents" do
    it "hides cents suffix" 


    it "shows cents suffix" 

  end

  context "currency parameter" do
    context "when currency is specified in Canadian Dollars" do
      it "uses the currency param over the global configuration" 

    end

    context "when currency is specified in Japanese Yen" do
      it "uses the currency param over the global configuration" 

    end
  end

  context "symbol positioning" do
    it "passed in option" 


    it "config option" 

  end

  context "sign before symbol" do
    it "defaults to -$10.00" 


    it "passed in option" 

  end

  context "JPY" do
    before do
      configure_spree_preferences do |config|
        config.currency = "JPY"
      end
    end

    it "formats correctly" 

  end

  context "EUR" do
    before do
      configure_spree_preferences do |config|
        config.currency = "EUR"
      end
    end

    # Regression test for https://github.com/spree/spree/issues/2634
    it "formats as plain by default" 


    it "formats as HTML if asked (nicely) to" 


    it "formats as HTML with currency" 

  end

  describe "#as_json" do
    let(:options) { double('options') }

    it "returns the expected string" 

  end

  describe 'subtraction' do
    context "for money objects with same currency" do
      let(:money_1) { Spree::Money.new(32.00, currency: "USD") }
      let(:money_2) { Spree::Money.new(15.00, currency: "USD") }

      it "subtracts correctly" 

    end

    context "when trying to subtract money objects in different currencies" do
      let(:money_1) { Spree::Money.new(32.00, currency: "EUR") }
      let(:money_2) { Spree::Money.new(15.00, currency: "USD") }

      it "will not work" 

    end

    context "if other does not respond to .money" do
      let(:money_1) { Spree::Money.new(32.00, currency: "EUR") }
      let(:money_2) { ::Money.new(1500) }

      it 'raises a TypeError' 

    end
  end

  describe 'addition' do
    context "for money objects with same currency" do
      let(:money_1) { Spree::Money.new(37.00, currency: "USD") }
      let(:money_2) { Spree::Money.new(15.00, currency: "USD") }

      it "subtracts correctly" 

    end

    context "when trying to subtract money objects in different currencies" do
      let(:money_1) { Spree::Money.new(32.00, currency: "EUR") }
      let(:money_2) { Spree::Money.new(15.00, currency: "USD") }

      it "will not work" 

    end

    context "if other does not respond to .money" do
      let(:money_1) { Spree::Money.new(32.00, currency: "EUR") }
      let(:money_2) { ::Money.new(1500) }

      it 'raises a TypeError' 

    end
  end

  describe 'equality checks' do
    context "if other does not respond to .money" do
      let(:money_1) { Spree::Money.new(32.00, currency: "EUR") }
      let(:money_2) { ::Money.new(1500) }

      it 'raises a TypeError' 

    end
  end

  it "includes Comparable" 


  describe "<=>" do
    let(:usd_10) { Spree::Money.new(10, currency: "USD") }
    let(:usd_20) { Spree::Money.new(20, currency: "USD") }
    let(:usd_30) { Spree::Money.new(30, currency: "USD") }

    it "compares the two amounts" 


    context "with a non Spree::Money object" do
      it "raises an error" 

    end

    context "with differing currencies" do
      let(:cad) { Spree::Money.new(10, currency: "CAD") }

      it "raises an error" 

    end
  end
end

