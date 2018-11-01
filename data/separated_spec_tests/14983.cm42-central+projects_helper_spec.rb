require 'rails_helper'

describe ProjectsHelper do
  describe '#point_scale_options' do
    specify { expect(point_scale_options).to be_instance_of(Array) }

    it 'returns an array of arrays' 

  end

  describe '#iteration_length_options' do
    specify { expect(iteration_length_options).to be_instance_of(Array) }

    it 'returns an array of arrays' 

  end

  describe '#day_name_options' do
    specify { expect(day_name_options).to be_instance_of(Array) }

    it 'returns an array of arrays' 

  end

  describe '#velocity_strategy_options' do
    subject(:options) { helper.velocity_strategy_options }

    it 'returns an array containing translated options to use in a select' 

  end
end

