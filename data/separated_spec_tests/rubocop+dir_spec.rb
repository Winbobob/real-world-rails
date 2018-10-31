# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Style::Dir, :config do
  subject(:cop) { described_class.new(config) }

  shared_examples 'auto-correct' do |original, expected|
    it 'auto-corrects' 

  end

  it 'registers an offense when using `#expand_path` and `#dirname`' 


  it_behaves_like 'auto-correct',
                  'File.expand_path(File.dirname(__FILE__))',
                  '__dir__'

  it 'registers an offense when using `#dirname` and `#realpath`' 


  it_behaves_like 'auto-correct',
                  'File.dirname(File.realpath(__FILE__))',
                  '__dir__'
end

