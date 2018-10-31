require 'spec_helper'
require 'rubocop'
require 'rubocop/rspec/support'
require_relative '../../../rubocop/cop/line_break_around_conditional_block'

describe RuboCop::Cop::LineBreakAroundConditionalBlock do
  include CopHelper

  subject(:cop) { described_class.new }

  shared_examples 'examples with conditional' do |conditional|
    it "flags violation for #{conditional} without line break before" 


    it "flags violation for #{conditional} without line break after" 


    it "doesn't flag violation for #{conditional} with line break before and after" 


    it "doesn't flag violation for #{conditional} preceded by a method definition" 


    it "doesn't flag violation for #{conditional} preceded by a class definition" 


    it "doesn't flag violation for #{conditional} preceded by a module definition" 


    it "doesn't flag violation for #{conditional} preceded by a begin definition" 


    it "doesn't flag violation for #{conditional} preceded by an assign/begin definition" 


    it "doesn't flag violation for #{conditional} preceded by a block definition" 


    it "doesn't flag violation for #{conditional} preceded by a block definition using brackets" 


    it "doesn't flag violation for #{conditional} preceded by a comment" 


    it "doesn't flag violation for #{conditional} preceded by an assignment" 


    it "doesn't flag violation for #{conditional} preceded by a multiline comment" 


    it "doesn't flag violation for #{conditional} preceded by another conditional" 


    it "doesn't flag violation for #{conditional} preceded by an else" 


    it "doesn't flag violation for #{conditional} preceded by an elsif" 


    it "doesn't flag violation for #{conditional} preceded by an ensure" 


    it "doesn't flag violation for #{conditional} preceded by a when" 


    it "doesn't flag violation for #{conditional} followed by a comment" 


    it "doesn't flag violation for #{conditional} followed by an end" 


    it "doesn't flag violation for #{conditional} followed by an else" 


    it "doesn't flag violation for #{conditional} followed by a when" 


    it "doesn't flag violation for #{conditional} followed by an elsif" 


    it "doesn't flag violation for #{conditional} preceded by a rescue" 


    it "doesn't flag violation for #{conditional} followed by a rescue" 


    it "autocorrects #{conditional} without line break before" 


    it "autocorrects #{conditional} without line break after" 


    it "autocorrects #{conditional} without line break before and after" 

  end

  %w[if unless].each do |example|
    it_behaves_like 'examples with conditional', example
  end

  it "doesn't flag violation for if with elsif" 

end

