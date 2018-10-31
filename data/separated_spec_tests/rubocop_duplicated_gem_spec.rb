# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Bundler::DuplicatedGem, :config do
  subject(:cop) { described_class.new(config) }

  let(:cop_config) { { 'Include' => ['**/Gemfile'] } }

  context 'when investigating Ruby files' do
    it 'does not register any offenses' 

  end

  context 'when investigating Gemfiles' do
    context 'and the file is empty' do
      let(:source) { '' }

      it 'does not raise an error' 


      it 'does not register any offenses' 

    end

    context 'and no duplicate gems are present' do
      it 'does not register any offenses' 

    end

    context 'and a gem is duplicated in default group' do
      let(:source) { <<-GEM }
        source 'https://rubygems.org'
        gem 'rubocop'
        gem 'rubocop'
      GEM

      it 'registers an offense' 


      it "references gem's first occurrence in message" 


      it 'highlights the duplicate gem' 

    end

    context 'and a duplicated gem is in a git/path/group/platforms block' do
      let(:source) { <<-GEM }
        gem 'rubocop'
        group :development do
          gem 'rubocop', path: '/path/to/gem'
        end
      GEM

      it 'registers an offense' 


      it 'highlights the duplicate gem' 

    end
  end
end

