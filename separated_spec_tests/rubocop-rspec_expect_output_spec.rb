# frozen_string_literal: true

require 'spec_helper'

RSpec.describe RuboCop::Cop::RSpec::ExpectOutput do
  subject(:cop) { described_class.new }

  it 'registers an offense for overwriting $stdout within an example' 


  it 'registers an offense for overwriting $stderr ' \
     'within an example scoped hook' do
    expect_offense(<<-RUBY)
      before(:each) do
        $stderr = StringIO.new
        ^^^^^^^ Use `expect { ... }.to output(...).to_stderr` instead of mutating $stderr.
      end
    RUBY
  end

  it 'does not register an offense for interacting with $stdout' 


  it 'does not flag assignments to other global variables' 


  it 'does not flag assignments to $stdout outside of example scope' 


  it 'does not flag assignments to $stdout in example_group scope' 


  it 'does not flag assigns to $stdout when in the root scope' 

end

