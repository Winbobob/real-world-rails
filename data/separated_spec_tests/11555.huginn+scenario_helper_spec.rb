require 'rails_helper'

describe ScenarioHelper do
  let(:scenario) { users(:bob).scenarios.build(name: 'Scene', tag_fg_color: '#AAAAAA', tag_bg_color: '#000000') }

  describe '#style_colors' do
    it 'returns a css style-formated version of the scenario foreground and background colors' 


    it 'defauls foreground and background colors' 

  end

  describe '#scenario_label' do
    it 'creates a scenario label with the scenario name' 


    it 'creates a scenario label with the given text' 

  end

end

