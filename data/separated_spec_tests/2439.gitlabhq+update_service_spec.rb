require 'spec_helper'

describe Labels::UpdateService do
  describe '#execute' do
    let(:project) { create(:project) }

    let(:hex_color) { '#FF0000' }
    let(:named_color) { 'red' }
    let(:upcase_color) { 'RED' }
    let(:spaced_color) { ' red ' }
    let(:unknown_color) { 'unknown' }
    let(:no_color) { '' }

    let(:expected_saved_color) { hex_color }

    before do
      @label = Labels::CreateService.new(title: 'Initial', color: '#000000').execute(project: project)
      expect(@label).to be_persisted
    end

    context 'with color in hex-code' do
      it 'updates the label' 

    end

    context 'with color in allowed name' do
      it 'updates the label' 

    end

    context 'with color in up-case allowed name' do
      it 'updates the label' 

    end

    context 'with color surrounded by spaces' do
      it 'updates the label' 

    end

    context 'with unknown color' do
      it 'doesn\'t update the label' 

    end

    context 'with no color' do
      it 'doesn\'t update the label' 

    end
  end

  def params_with(color)
    {
      title: 'A Label',
      color: color
    }
  end
end

