# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Layout::LeadingBlankLines, :config do
  subject(:cop) { described_class.new(config) }

  it 'allows an empty input' 


  it 'allows blank lines without any comments or code' 


  it 'accepts not having a blank line before a class' 


  it 'accepts not having a blank line before code' 


  it 'accepts not having a blank line before a comment' 


  it 'registers an offense when there is a new line before a class' 


  it 'registers an offense when there is a new line before code' 


  it 'registers an offense when there is a new line before a comment' 


  context 'auto-correct' do
    it 'removes new lines before a class' 


    it 'removes new lines before code' 


    it 'removes new lines before a comment' 


    it 'removes multiple new lines' 


    context 'in collaboration' do
      let(:config) do
        RuboCop::Config.new('Layout/SpaceAroundEqualsInParameterDefault' => {
                              'SupportedStyles' => [:space],
                              'EnforcedStyle' => :space
                            })
      end
      let(:cops) do
        cop_classes = [
          described_class,
          ::RuboCop::Cop::Layout::SpaceAroundEqualsInParameterDefault
        ]
        ::RuboCop::Cop::Registry.new(cop_classes)
      end

      it 'does not invoke conflicts with other cops' 

    end
  end
end

