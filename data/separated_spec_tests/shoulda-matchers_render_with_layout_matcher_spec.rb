require 'unit_spec_helper'

describe Shoulda::Matchers::ActionController::RenderWithLayoutMatcher, type: :controller do
  include ActionController::TemplateAssertions

  context 'a controller that renders with a layout' do
    it 'accepts rendering with any layout' 


    it 'accepts rendering with that layout' 


    it 'rejects rendering with another layout' 


    def controller_with_wide_layout
      create_view('layouts/wide.html.erb', 'some content, <%= yield %>')
      build_fake_response { render layout: 'wide' }
    end
  end

  context 'a controller that renders without a layout' do

    it 'rejects rendering with a layout' 

  end

  context 'a controller that renders a partial' do
    it 'rejects rendering with a layout' 

  end

  context 'given a context with layouts' do
    it 'accepts that layout in that context' 


    def set_layout_in_context(context, layout)
      layouts = Hash.new(0)
      layouts[layout] = 1
      context.instance_variable_set('@_layouts', layouts)
    end

    def controller_without_layout
      build_fake_response { render layout: false }
    end
  end
end

