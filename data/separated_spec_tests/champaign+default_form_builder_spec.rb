# frozen_string_literal: true

require 'rails_helper'

describe DefaultFormBuilder do
  it 'creates a default master form' 


  it 'creates fields' 


  describe 'i18n' do
    it 'translates the fields to German' 


    it 'translates the fields to French' 


    it 'translates the fields to English' 


    it 'marks the German form as DE' 


    it 'marks the French form as FR' 


    it 'marks the English form as EN' 

  end

  context 'when form already exists' do
    before { DefaultFormBuilder.find_or_create }

    it "doesn't create a new form" 


    it 'returns existing form' 

  end
end

