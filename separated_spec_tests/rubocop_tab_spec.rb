# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Layout::Tab do
  subject(:cop) { described_class.new(config) }

  let(:config) do
    RuboCop::Config.new('Layout/IndentationWidth' => { 'Width' => 2 })
  end

  it 'registers an offense for a line indented with tab' 


  it 'registers an offense for a line indented with multiple tabs' 


  it 'registers an offense for a line indented with mixed whitespace' 


  it 'registers offenses before __RUBY__ but not after' 


  it 'registers an offense for a tab other than indentation' 


  it 'accepts a line with tab in a string' 


  it 'accepts a line which begins with tab in a string' 


  it 'accepts a line which begins with tab in a heredoc' 


  it 'accepts a line which begins with tab in a multiline heredoc' 


  it 'auto-corrects a line indented with tab' 


  it 'auto-corrects a line indented with multiple tabs' 


  it 'auto-corrects a line indented with mixed whitespace' 


  it 'auto-corrects a line with tab in a string indented with tab' 


  context 'custom indentation width' do
    let(:config) do
      RuboCop::Config.new('Layout/Tab' => {
                            'IndentationWidth' => 3
                          },
                          'Layout/IndentationWidth' => { 'Width' => 2 })
    end

    it 'uses the configured number of spaces to replace a tab' 

  end
end

