# frozen_string_literal: true

RSpec.describe RuboCop::Cop::MessageAnnotator do
  let(:options) { {} }
  let(:config) { RuboCop::Config.new({}) }
  let(:annotator) { described_class.new(config, config['Cop/Cop'], options) }

  describe '#annotate' do
    subject(:annotate) do
      annotator.annotate('message', 'Cop/Cop')
    end

    context 'with default options' do
      it 'returns the message' 

    end

    context 'with options on' do
      let(:options) do
        {
          extra_details: true,
          display_cop_names: true,
          display_style_guide: true
        }
      end
      let(:config) do
        RuboCop::Config.new(
          'Cop/Cop' => {
            'Details' => 'my cop details',
            'StyleGuide' => 'http://example.org/styleguide'
          }
        )
      end

      it 'returns an annotated message' 

    end
  end

  describe 'with style guide url' do
    subject(:annotate) do
      annotator.annotate('', 'Cop/Cop')
    end

    let(:options) do
      {
        display_style_guide: true
      }
    end

    context 'when StyleGuide is not set in the config' do
      let(:config) { RuboCop::Config.new({}) }

      it 'does not add style guide url' 

    end

    context 'when StyleGuide is set in the config' do
      let(:config) do
        RuboCop::Config.new(
          'Cop/Cop' => { 'StyleGuide' => 'http://example.org/styleguide' }
        )
      end

      it 'adds style guide url' 

    end

    context 'when a base URL is specified' do
      let(:config) do
        RuboCop::Config.new(
          'AllCops' => {
            'StyleGuideBaseURL' => 'http://example.org/styleguide'
          }
        )
      end

      it 'does not specify a URL if a cop does not have one' 


      it 'combines correctly with a target-based setting' 


      it 'can use a path-based setting' 


      it 'can accept relative paths if base has a full path' 


      it 'allows absolute URLs in the cop config' 

    end
  end

  describe '#urls' do
    let(:urls) { annotator.urls }
    let(:config) do
      RuboCop::Config.new(
        'AllCops' => {
          'StyleGuideBaseURL' => 'http://example.org/styleguide'
        }
      )
    end

    it 'returns an empty array without StyleGuide URL' 


    it 'returns style guide url when it is specified' 


    it 'returns reference url when it is specified' 


    it 'returns style guide and reference url when they are specified' 

  end
end

