require 'spec_helper'

require 'rubocop'
require 'rubocop/rspec/support'

require_relative '../../../../rubocop/cop/qa/element_with_pattern'

describe RuboCop::Cop::QA::ElementWithPattern do
  include CopHelper

  let(:source_file) { 'qa/page.rb' }

  subject(:cop) { described_class.new }

  context 'in a QA file' do
    before do
      allow(cop).to receive(:in_qa_file?).and_return(true)
    end

    it "registers an offense for elements with a pattern" 


    it "does not register an offense for element without a pattern" 

  end

  context 'outside of a migration spec file' do
    it "does not register an offense" 

  end
end

