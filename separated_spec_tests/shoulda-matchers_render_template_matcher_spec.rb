require 'unit_spec_helper'

describe Shoulda::Matchers::ActionController::RenderTemplateMatcher, type: :controller do
  context 'a controller that renders a template' do
    it 'accepts rendering that template' 


    it 'rejects rendering a different template' 


    it 'accepts rendering that template in the given context' 


    it 'rejects rendering a different template in the given context' 


    def controller_with_show
      build_fake_response(action: 'show') { render }
    end
  end

  context 'a controller that renders a partial' do
    it 'accepts rendering that partial' 


    it 'rejects rendering a different template' 


    it 'accepts rendering that template in the given context' 


    it 'rejects rendering a different template in the given context' 


    def controller_with_customer_partial
      build_fake_response(partial: '_customer') { render partial: 'customer' }
    end
  end

  context 'a controller that does not render partials' do
    it 'accepts not rendering a partial' 

  end

  context 'a controller that renders a partial several times' do
    it 'accepts rendering that partial twice' 

  end

  context 'a controller that does not render a template' do
    it 'rejects rendering a template' 

  end
end

