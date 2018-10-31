# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Style::InfiniteLoop do
  subject(:cop) { described_class.new(config) }

  let(:config) do
    RuboCop::Config.new('Layout/IndentationWidth' => { 'Width' => 2 })
  end

  %w(1 2.0 [1] {}).each do |lit|
    it "registers an offense for a while loop with #{lit} as condition" 

  end

  %w[false nil].each do |lit|
    it "registers an offense for a until loop with #{lit} as condition" 

  end

  it 'accepts Kernel#loop' 


  shared_examples_for 'auto-corrector' do |keyword, lit|
    it "auto-corrects single line modifier #{keyword}" 


    context 'with non-default indentation width' do
      let(:config) do
        RuboCop::Config.new('Layout/IndentationWidth' => { 'Width' => 4 })
      end

      it "auto-corrects multi-line modifier #{keyword} and indents correctly" 

    end

    it "auto-corrects begin-end-#{keyword} with one statement" 


    it "auto-corrects begin-end-#{keyword} with two statements" 


    it "auto-corrects single line modifier #{keyword} with and" 


    it "auto-corrects the usage of #{keyword} with do" 


    it "auto-corrects the usage of #{keyword} without do" 

  end

  it_behaves_like 'auto-corrector', 'while', 'true'
  it_behaves_like 'auto-corrector', 'until', 'false'
end

