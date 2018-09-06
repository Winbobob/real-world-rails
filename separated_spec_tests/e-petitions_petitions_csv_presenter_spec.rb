require 'rails_helper'

RSpec.describe PetitionsCSVPresenter do
  class DummyPresenterClass
    def self.fields
      [:id, :name]
    end

    def initialize(petition)
      @petition = petition
    end

    def to_csv
      self.class.fields.map {|f| @petition[f] }.join(",") + "\n"
    end
  end

  # Use an array that quacks like the expected Browseable::Search instance
  class BatchifiedArray < Array
    alias :in_batches :each
  end

  subject { described_class.new(BatchifiedArray.new([{id: 321, name: "Slim Jim"}]), presenter_class: DummyPresenterClass) }

  describe "#initialize" do
    it "initializes the presenter with default" 


    it "initializes the presenter with custom options" 

  end

  describe "#render" do
    it "returns an enumerator" 


    it "renders a header row as the first enumerator call" 


    it "renders the fields for each petition after the header" 

  end
end

