# frozen_string_literal: true

require 'rails_helper'
require 'rake'

describe 'scholarsphere:expire' do
  before do
    load_rake_environment ["#{Rails.root}/lib/tasks/scholarsphere/expire.rake"]
  end

  describe ':leases_and_embargoes' do
    context 'by default' do
      it 'expires any leases and embargoes from today' 

    end

    context 'with a specific date' do
      it 'expires any leases and embargoes from today' 

    end
  end
end

