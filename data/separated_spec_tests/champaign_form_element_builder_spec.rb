# frozen_string_literal: true
require 'rails_helper'

describe FormElementBuilder do
  subject { described_class }

  let(:form) { create(:form) }
  let(:params) { attributes_for(:form_element) }

  describe '.create' do
    context 'with valid params' do
      it 'creates an element for a passed form' 


      it 'parses JSON choices while leaving non-JSON choices' 

    end
  end
end

