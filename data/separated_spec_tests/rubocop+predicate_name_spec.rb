# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Naming::PredicateName, :config do
  subject(:cop) { described_class.new(config) }

  context 'with blacklisted prefixes' do
    let(:cop_config) do
      { 'NamePrefix' => %w[has_ is_],
        'NamePrefixBlacklist' => %w[has_ is_] }
    end

    it 'registers an offense when method name starts with "is"' 


    it 'registers an offense when method name starts with "has"' 


    it 'accepts method name that starts with unknown prefix' 


    it 'accepts method name that is an assignment' 

  end

  context 'without blacklisted prefixes' do
    let(:cop_config) do
      { 'NamePrefix' => %w[has_ is_], 'NamePrefixBlacklist' => [] }
    end

    it 'registers an offense when method name starts with "is"' 


    it 'registers an offense when method name starts with "has"' 


    it 'accepts method name that starts with unknown prefix' 

  end

  context 'with whitelisted predicate names' do
    let(:cop_config) do
      { 'NamePrefix' => %w[is_], 'NamePrefixBlacklist' => %w[is_],
        'NameWhitelist' => %w[is_a?] }
    end

    it 'accepts method name which is in whitelist' 

  end

  context 'with method definition macros' do
    let(:cop_config) do
      { 'NamePrefix' => %w[is_], 'NamePrefixBlacklist' => %w[is_],
        'MethodDefinitionMacros' => %w[define_method def_node_matcher] }
    end

    it 'registers an offense when using `define_method`' 


    it 'registers an offense when using an internal affair macro' 

  end

  context 'without method definition macros' do
    let(:cop_config) do
      { 'NamePrefix' => %w[is_], 'NamePrefixBlacklist' => %w[is_] }
    end

    it 'registers an offense when using `define_method`' 


    it 'does not register any offenses when using an internal affair macro' 

  end
end

