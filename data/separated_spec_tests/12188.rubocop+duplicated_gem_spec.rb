# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Bundler::DuplicatedGem, :config do
  subject(:cop) { described_class.new(config) }

  let(:cop_config) { { 'Include' => ['**/Gemfile'] } }

  context 'when investigating Ruby files' do
    it 'does not register any offenses' 

  end

  context 'when investigating Gemfiles' do
    context 'and the file is empty' do
      it 'does not register any offenses' 

    end

    context 'and no duplicate gems are present' do
      it 'does not register any offenses' 

    end

    context 'and a gem is duplicated in default group' do
      it 'registers an offense' 

    end

    context 'and a duplicated gem is in a git/path/group/platforms block' do
      it 'registers an offense' 

    end
  end
end

