# frozen_string_literal: true

require 'rails_helper'
require "#{Rails.root}/lib/importers/category_importer"

describe CategoryImporter do
  let(:category) { 'Category:Crocodile Dundee' }
  let(:article_in_cat) { 'Michael_"Crocodile"_Dundee' }
  let(:article_in_subcat) { 'Crocodile_Dundee_in_Los_Angeles' }
  let(:wiki) { Wiki.default_wiki }

  it 'imports data for articles in a category' 


  it 'imports subcategories recursively' 


  it 'outputs filtered data about a category' 


  it 'imports missing data for category' 


  describe '.show_category' do
    it 'should return the articles in a category' 

  end

  describe '.page_titles_for_category' do
    let(:category) { 'Category:AfD debates' }
    let(:depth) { 0 }
    let(:subject) { described_class.new(wiki).page_titles_for_category(category, depth) }

    it 'returns page page titles for a given category' 

  end
end

