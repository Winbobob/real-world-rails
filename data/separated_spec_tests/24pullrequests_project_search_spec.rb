require 'rails_helper'

describe ProjectSearch do
  context 'Attributes' do
    it '#language' 


    it '#labels' 


    it '#page' 


    it '#per_page' 

  end

  context 'Search' do
    let(:refactoring) do
      create(:label, name: 'refactoring')
    end

    let(:tests) do
      create(:label, name: 'tests')
    end

    let!(:rails) do
      create(:project, name: 'Rails',
                       main_language: 'Ruby',
                       labels: [refactoring])
    end

    let!(:phoenix) do
      create(:project, name: 'Phoenix',
                       main_language: 'Elixir',
                       labels: [tests])
    end

    let!(:inactive) do
      create(:project, name: 'Inactive',
                       main_language: 'JavaScript',
                       inactive: true)
    end

    it 'Default find all' 


    it 'Pagination' 


    it '#more?' 


    it 'random order' 


    it 'by_language' 


    it 'by_label' 


    it 'by_label and by_language' 

  end
end

