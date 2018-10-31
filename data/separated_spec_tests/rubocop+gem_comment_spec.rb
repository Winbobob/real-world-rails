# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Bundler::GemComment, :config do
  subject(:cop) { described_class.new(config) }

  let(:cop_config) do
    {
      'Include' => ['**/Gemfile'],
      'Whitelist' => ['rake']
    }
  end

  context 'when investigating Ruby files' do
    it 'does not register any offenses' 

  end

  context 'when investigating Gemfiles' do
    context 'and the file is empty' do
      it 'does not register any offenses' 

    end

    context 'and the gem is commented' do
      it 'does not register any offenses' 

    end

    context 'and the gem is whitelisted' do
      it 'does not register any offenses' 

    end

    context 'and the file contains source and group' do
      it 'does not register any offenses' 

    end

    context 'and a gem has no comment' do
      it 'registers an offense' 

    end
  end
end

