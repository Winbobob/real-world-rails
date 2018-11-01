# frozen_string_literal: true

require 'rails_helper'

describe LiquidMarkupSeeder do
  subject { LiquidMarkupSeeder }

  describe '.name' do
    it 'parses filename for partial' 


    it 'parses filename for template' 

  end

  describe '.meta' do
    it 'returns array with class and name' 

  end

  describe 'set_metadata_fields' do
    let(:view) { build :liquid_layout }
    let(:description) { '{% comment %} description: something sweet {%endcomment%}' }
    let(:experimental) { '{% comment %} experimental: true {% endcomment %}' }
    let(:post_action) { '{% comment %} Post-action layout: true {% endcomment %}' }
    let(:primary) { '{% comment %} Primary layout: true {% endcomment %}' }

    it 'sets experimental, post-action, primary, and description if they are included' 


    it 'sets to nil if not included' 


    it 'can set just experimental' 


    it 'can set just description' 


    it 'does not raise error when passed a liquid partial' 

  end
end

