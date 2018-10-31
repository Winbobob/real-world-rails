require 'rails_helper'

RSpec.describe JaduXml::DocumentIdPresenter, type: :presenter do
  around { |example| travel_to Date.new(2014, 9, 29) { example.run } }

  let(:jadu_xml_document_presenter) { described_class.new(Object.new) }

  its(:name)    { is_expected.to eq "ETFeesEntry" }
  its(:type)    { is_expected.to eq "ETFeesEntry" }
  its(:version) { is_expected.to eq 1 }

  describe "#id" do
    it "returns the current time in 'number' format" 

  end

  describe "#time" do
    it "returns the current time in xmlschema format" 

  end
end

