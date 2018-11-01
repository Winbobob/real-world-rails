# frozen_string_literal: true
require 'rails_helper'

describe ChampaignLiquidFilters do
  # to define a liquid filter, you make a module with instance methods that
  # gets included by liquid. You can't make them module_functions, so here
  # we extend a generic class to call the filter
  subject { Class.new.extend(ChampaignLiquidFilters) }

  describe 'select_option' do
    let(:base_options) do
      '<option value="DM">Dominique</option>
       <option value="SV">El Salvador</option>
       <option value="ES">Espagne</option>
       <option value="EE">Estonie</option>'
    end

    it 'does not add selected if one is already selected with attribute' 


    it 'does not add selected if one is already selected with property"' 


    it 'correctly selects with single quotes' 


    it 'correctly selects with double quotes' 

  end
end

