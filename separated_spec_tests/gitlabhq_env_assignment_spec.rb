require 'spec_helper'

require 'rubocop'
require 'rubocop/rspec/support'

require_relative '../../../../rubocop/cop/rspec/env_assignment'

describe RuboCop::Cop::RSpec::EnvAssignment do
  include CopHelper

  OFFENSE_CALL_SINGLE_QUOTES_KEY = %(ENV['FOO'] = 'bar').freeze
  OFFENSE_CALL_DOUBLE_QUOTES_KEY = %(ENV["FOO"] = 'bar').freeze

  let(:source_file) { 'spec/foo_spec.rb' }

  subject(:cop) { described_class.new }

  shared_examples 'an offensive ENV#[]= call' do |content|
    it "registers an offense for `#{content}`" 

  end

  shared_examples 'an autocorrected ENV#[]= call' do |content, autocorrected_content|
    it "registers an offense for `#{content}` and autocorrects it to `#{autocorrected_content}`" 

  end

  context 'in a spec file' do
    before do
      allow(cop).to receive(:in_spec?).and_return(true)
    end

    context 'with a key using single quotes' do
      it_behaves_like 'an offensive ENV#[]= call', OFFENSE_CALL_SINGLE_QUOTES_KEY
      it_behaves_like 'an autocorrected ENV#[]= call', OFFENSE_CALL_SINGLE_QUOTES_KEY, %(stub_env('FOO', 'bar'))
    end

    context 'with a key using double quotes' do
      it_behaves_like 'an offensive ENV#[]= call', OFFENSE_CALL_DOUBLE_QUOTES_KEY
      it_behaves_like 'an autocorrected ENV#[]= call', OFFENSE_CALL_DOUBLE_QUOTES_KEY, %(stub_env("FOO", 'bar'))
    end
  end

  context 'outside of a spec file' do
    it "does not register an offense for `#{OFFENSE_CALL_SINGLE_QUOTES_KEY}` in a non-spec file" 

  end
end

