# frozen_string_literal: true
require 'rails_helper'

describe 'Liquid page rendering' do
  before(:all) do
    LiquidMarkupSeeder.seed(quiet: true)
  end

  after(:all) do
    DatabaseCleaner.clean_with(:truncation)
  end

  LiquidMarkupSeeder.titles.each do |title|
    describe "page with layout #{title}" do
      [:en, :fr, :de].each do |language_code|
        it "can render in #{language_code} without errors" 

      end
    end
  end
end

