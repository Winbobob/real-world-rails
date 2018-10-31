# frozen_string_literal: true
require 'rails_helper'

describe PageService do
  let(:english) { create(:language, :english) }
  let(:french) { create(:language, :french) }

  describe '.list' do
    let!(:en_page) { create(:page, :published, language: english, updated_at: 1.year.ago) }
    let!(:en_unpublished) { create(:page, :unpublished, language: english) }
    let!(:fr_page) { create(:page, :published, created_at: 1.year.ago, language: french) }

    it 'returns pages by language' 


    it 'returns only published pages' 


    it 'limits result to 30 by default' 


    it 'limits result by passed value' 


    it 'orders pages by date (most recently updated first)' 

  end

  describe '.list_featured' do
    let!(:en_page) do
      create(:page, :published, featured: true, language: english, updated_at: 1.year.ago)
    end
    let!(:en_unpublished) { create(:page, :unpublished, language: english) }
    let!(:en_unfeatured) { create(:page, :published, language: english) }
    let!(:fr_page) { create(:page, :published, featured: true, created_at: 1.year.ago, language: french) }

    it 'returns featured pages by language' 


    it 'returns only published, featured pages' 


    it 'limits result to 30 by default' 


    it 'limits result by passed value' 


    it 'orders pages by date (most recently updated  first)' 

  end
end

