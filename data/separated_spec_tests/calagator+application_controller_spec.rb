require 'spec_helper'

module Calagator

describe ApplicationController, :type => :controller do
  describe "#append_flash" do
    before :each do
      flash.clear
    end

    it "should set flash message if one isn't set already" 


    it "should append flash message if one is already set" 

  end

  describe "#help" do
    it "should respond to a view helper method" 


    it "should not respond to an invalid method" 

  end

  describe "#escape_once" do
    let(:raw) { "this & that" }
    let(:escaped) { "this &amp; that" }

    it "should escape raw string" 


    it "should not escape an already escaped string" 

  end

  describe "#recaptcha_enabled?" do
    let(:temporary_key) { nil }

    subject do
      result = nil

      Recaptcha.with_configuration(public_key: temporary_key) do
        result = controller.send(:recaptcha_enabled?)
      end

      result
    end

    context "when Recaptcha public_key is not set" do
      it { is_expected.to be_falsey }
    end

    context "when ENV key is set" do
      let(:temporary_key) { "asdf" }

      it { is_expected.to be_truthy }
    end
  end
end

end

