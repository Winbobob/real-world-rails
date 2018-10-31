require 'spec_helper'

describe ComponentCreator do
  describe 'set_manufacturer_key' do
    context 'manufacturer in db' do
      it 'sets the manufacturer_id' 

    end
    context 'unknown manufacturer' do
      it 'adds other manufacturer name and set the set the foreign keys' 

    end
    context 'manufacturer_id a manufacturer name' do
      it 'sets manufacturer_id correctly' 

    end
  end

  describe 'set_component_type' do
    it 'sets the component_type from a string' 

    it "creates a new component type if we don't recognize it" 

  end

  describe 'create_component' do
    it 'creates the component' 

    it "creates the component and ignore attributes it shouldn't use" 

  end

  describe 'create_components_from_params' do
    it 'returns nil if there are no components' 

    it 'calls the necessary methods to create a component on each component' 

  end
end

