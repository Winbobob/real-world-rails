# frozen_string_literal: true

require 'rails_helper'
require 'rake'

describe 'scholarsphere:harvest' do
  before { load_rake_environment ["#{Rails.root}/lib/tasks/scholarsphere/harvest.rake"] }

  context 'when harvesting lexvo languages' do
    it 'loads the terms from the rdf file' 

  end

  context 'when harvesting LC subjects' do
    it 'loads the terms from the rdf file' 

  end
end

