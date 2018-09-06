require 'rails_helper'

RSpec.describe ApplicationLayoutHelper, type: :helper do
  describe '#page_title' do
    it 'defaults to Test Track Admin' 


    it 'accepts a page title' 

  end

  describe '#header_modifier' do
    context 'when the header_modifier content_for has been provided' do
      before do
        helper.content_for :header_modifier, 'green'
      end

      it 'returns the custom modifier' 

    end
  end

  describe '#body_layout_body_color' do
    it 'defaults to near white' 


    it 'accepts a custom color' 

  end

  describe '#body_layout_body_color_class' do
    it 'returns descendant class and color modifier class' 


    it 'returns descendant class and color modifier class' 

  end

  describe '#controller_css_class' do
    it 'creates a controller css class' 

  end

  describe '#controller_action_css_class' do
    it 'creates a controller action css class' 

  end
end

