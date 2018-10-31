# frozen_string_literal: true
require 'rails_helper'

describe LiquidI18n do
  # to define a liquid filter, you make a module with instance methods that
  # gets included by liquid. You can't make them module_functions, so here
  # we extend a generic class to call the filter
  subject { Class.new.extend(LiquidI18n) }

  before :all do
    translations = {
      'liquidi18nspec' => {
        'basic' => 'Super simple',
        'temperature' => 'It is %{temp} degrees',
        'two' => 'First you %{one} then you %{two}',
        'ten' => '%{a} - %{b} - %{c} - %{d} - %{e} - %{f} - %{g} - %{h} - %{i} - %{j}',
        'eleven' => '%{a} - %{b} - %{c} - %{d} - %{e} - %{f} - %{g} - %{h} - %{i} - %{j} - %{k}',
        'variety' => '%{one} for the %{money}, %{two} for the %{show}, %{three} to get ready and four to go!'
      }
    }
    I18n.backend.store_translations('en', translations)
  end

  describe 't' do
    it 'translates without interpolation' 


    it 'correctly interpolates one value with spaces' 


    it 'correctly interpolates one value without spaces' 


    it 'correctly interpolates two values' 


    it 'correctly interpolates ten values' 


    it 'will not interpolate more than ten values' 


    it 'can interpolate punctuation, numbers, and accents' 


    it 'handles a case with no commas' 


    it 'handles a case with too many commas and colons' 


    describe 'handles a missing translation' do
      it 'by raising an error in test' 


      it 'by raising an error in development' 


      it 'by showing the best effort on production' 

    end
  end

  describe 'val' do
    it 'can append one value pair' 


    it 'nests nicely' 

  end

  describe '#date_for_link' do
    {
      en: '1 December 2016',
      fr: '1 décembre 2016',
      de: '1. Dezember 2016'
    }.each do |locale, translation|
      it "localises date for #{locale}" 

    end
  end
end

