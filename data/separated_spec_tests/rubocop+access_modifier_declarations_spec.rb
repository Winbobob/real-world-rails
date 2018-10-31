# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Style::AccessModifierDeclarations, :config do
  subject(:cop) { described_class.new(config) }

  context 'when `group` is configured' do
    let(:cop_config) do
      {
        'EnforcedStyle' => 'group'
      }
    end

    %w[private protected public].each do |access_modifier|
      it "offends when #{access_modifier} is inlined with a method" 


      it "offends when #{access_modifier} is inlined with a symbol" 


      it "does not offend when #{access_modifier} is not inlined" 


      it "does not offend when #{access_modifier} is not inlined and " \
         'has a comment' do
        expect_no_offenses(<<-RUBY.strip_indent)
          class Test
            #{access_modifier} # hey
          end
        RUBY
      end
    end
  end

  context 'when `inline` is configured' do
    let(:cop_config) do
      {
        'EnforcedStyle' => 'inline'
      }
    end

    %w[private protected public].each do |access_modifier|
      it "offends when #{access_modifier} is not inlined" 


      it "offends when #{access_modifier} is not inlined and has a comment" 


      it "does not offend when #{access_modifier} is inlined with a method" 


      it "does not offend when #{access_modifier} is inlined with a symbol" 

    end
  end
end

