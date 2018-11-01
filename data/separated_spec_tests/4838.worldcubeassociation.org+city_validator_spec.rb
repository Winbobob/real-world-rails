# frozen_string_literal: true

require 'rails_helper'
require 'relations'

RSpec.describe CityValidator do
  context "US" do
    let(:country) { Country.find_by_iso2!("US") }
    let(:model) { TestModel.new(country: country) }

    it "requires city, state" 


    it "allows multiple cities" 

  end

  context "CA" do
    let(:country) { Country.find_by_iso2!("CA") }
    let(:model) { TestModel.new(country: country) }

    it "requires city, province" 

  end

  context "GB" do
    let(:country) { Country.find_by_iso2!("GB") }
    let(:model) { TestModel.new(country: country) }

    it "anything goes" 

  end
end

class TestModel
  include ActiveModel::Model

  attr_accessor :city
  validates :city, city: true

  attr_accessor :country
end

