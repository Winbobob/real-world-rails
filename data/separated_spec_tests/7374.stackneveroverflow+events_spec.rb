require 'spec_helper'

describe 'Nested form', :js => true do
  include Capybara::DSL

  [:jquery, :prototype].each do |js_framework|
    
    url = case js_framework
    when :jquery then '/projects/new'
    when :prototype then '/projects/new?type=prototype'
    end

    context "with #{js_framework}" do
      context 'when field was added' do
        it 'emits general add event' 


        it 'emits add event for current association' 

      end

      context 'when field was removed' do
        it 'emits general remove event' 


        it 'emits remove event for current association' 

      end
    end
  end
end

