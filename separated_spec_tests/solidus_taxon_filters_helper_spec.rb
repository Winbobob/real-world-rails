# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Spree::TaxonFiltersHelper, type: :helper do
  let(:taxon) { nil }
  subject { applicable_filters_for(taxon) }

  it "returns the price/brand filters" 

end

