# frozen_string_literal: true
require 'rails_helper'

describe FormDuplicator do
  let(:form) { create(:form_with_fields, master: true) }

  subject(:copy) { FormDuplicator.duplicate(form) }

  describe '.duplicate' do
    it 'duplicates the passed form' 


    it 'duplicates elements onto new form' 


    it 'sets master to false on new form' 

  end
end

