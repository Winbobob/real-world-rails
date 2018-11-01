require 'spec_helper'

describe Labels::CreateService do
  describe '#execute' do
    let(:project) { create(:project) }
    let(:group)   { create(:group) }

    let(:hex_color) { '#FF0000' }
    let(:named_color) { 'red' }
    let(:upcase_color) { 'RED' }
    let(:spaced_color) { ' red ' }
    let(:unknown_color) { 'unknown' }
    let(:no_color) { '' }

    let(:expected_saved_color) { hex_color }

    context 'in a project' do
      context 'with color in hex-code' do
        it 'creates a label' 

      end

      context 'with color in allowed name' do
        it 'creates a label' 

      end

      context 'with color in up-case allowed name' do
        it 'creates a label' 

      end

      context 'with color surrounded by spaces' do
        it 'creates a label' 

      end

      context 'with unknown color' do
        it 'doesn\'t create a label' 

      end

      context 'with no color' do
        it 'doesn\'t create a label' 

      end
    end

    context 'in a group' do
      context 'with color in hex-code' do
        it 'creates a label' 

      end

      context 'with color in allowed name' do
        it 'creates a label' 

      end

      context 'with color in up-case allowed name' do
        it 'creates a label' 

      end

      context 'with color surrounded by spaces' do
        it 'creates a label' 

      end

      context 'with unknown color' do
        it 'doesn\'t create a label' 

      end

      context 'with no color' do
        it 'doesn\'t create a label' 

      end
    end

    context 'in admin area' do
      context 'with color in hex-code' do
        it 'creates a label' 

      end

      context 'with color in allowed name' do
        it 'creates a label' 

      end

      context 'with color in up-case allowed name' do
        it 'creates a label' 

      end

      context 'with color surrounded by spaces' do
        it 'creates a label' 

      end

      context 'with unknown color' do
        it 'doesn\'t create a label' 

      end

      context 'with no color' do
        it 'doesn\'t create a label' 

      end
    end
  end

  def params_with(color)
    {
      title: 'A Label',
      color: color
    }
  end
end

