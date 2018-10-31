require 'spec_helper'

describe InstanceConfigurationHelper do
  describe '#instance_configuration_cell_html' do
    describe 'if not block is passed' do
      it 'returns the parameter if present' 


      it 'returns "-" if the parameter is blank' 

    end

    describe 'if a block is passed' do
      let(:upcase_block) { ->(value) { value.upcase } }

      it 'returns the result of the block' 


      it 'returns "-" if the parameter is blank' 

    end

    it 'boolean are valid values to display' 

  end

  describe '#instance_configuration_human_size_cell' do
    it 'returns "-" if the parameter is blank' 


    it 'accepts the value in bytes' 


    it 'returns the value in human size readable format' 

  end
end

