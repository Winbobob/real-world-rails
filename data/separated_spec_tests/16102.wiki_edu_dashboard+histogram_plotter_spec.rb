# frozen_string_literal: true

require 'rails_helper'

describe HistogramPlotter do
  let(:course) do
    create(:course, slug: "Sage's/te,_st_(slug)", id: 1, start: 1.year.ago, end: 1.day.from_now)
  end
  let(:opts) { { existing_only: true, minimum_improvement: 1 } }
  let(:article) { create(:article) }
  let(:revision) do
    create(:revision, article: article, date: 1.day.ago, wp10: 70, wp10_previous: 1)
  end

  before do
    FileUtils.rm_rf "#{Rails.root}/public/assets/system"
  end

  after do
    FileUtils.rm_rf "#{Rails.root}/public/assets/system"
  end

  context 'when there is no article data' do
    it 'returns an empty CSV' 

  end

  context 'when there is article data' do
    before do
      course.articles << article
    end

    it 'returns a CSV with article data for a course' 


    it 'returns a CSV with article data for a campaign' 

  end
end
