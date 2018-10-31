# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Style::OptionHash, :config do
  subject(:cop) { described_class.new(config) }

  let(:cop_config) { { 'SuspiciousParamNames' => suspicious_names } }
  let(:suspicious_names) { ['options'] }

  it 'registers an offense' 


  context 'when the last argument is an options hash named something else' do
    let(:source) do
      <<-RUBY.strip_indent
        def steep(flavor, duration, config={})
          mug = config.fetch(:mug)
          prep(flavor, duration, mug)
        end
      RUBY
    end

    it 'does not register an offense' 


    context 'when the argument name is in the list of suspicious names' do
      let(:suspicious_names) { %w[options config] }

      it 'registers an offense' 

    end
  end

  context 'when there are no arguments' do
    it 'does not register an offense' 

  end

  context 'when the last argument is a non-options-hash optional hash' do
    it 'does not register an offense' 

  end

  context 'when passing options hash to super' do
    it 'does not register an offense' 


    it 'does not register an offense when code exists before call to super' 


    it 'does not register an offense when call to super is in a nested block' 

  end
end

