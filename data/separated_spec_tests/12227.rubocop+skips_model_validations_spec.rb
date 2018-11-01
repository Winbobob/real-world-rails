# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Rails::SkipsModelValidations, :config do
  cop_config = {
    'Blacklist' => %w[decrement!
                      decrement_counter
                      increment!
                      increment_counter
                      toggle!
                      touch
                      update_all
                      update_attribute
                      update_column
                      update_columns
                      update_counters]
  }

  subject(:cop) { described_class.new(config) }

  let(:msg) { 'Avoid using `%s` because it skips validations.' }
  let(:cop_config) { cop_config }

  methods_with_arguments = described_class::METHODS_WITH_ARGUMENTS

  context 'with default blacklist' do
    cop_config['Blacklist'].each do |method_name|
      it "registers an offense for `#{method_name}`" 

    end

    it 'accepts FileUtils.touch' 

  end

  context 'with methods that require at least an argument' do
    methods_with_arguments.each do |method_name|
      it "doesn't register an offense for `#{method_name}`" 

    end
  end

  context "with methods that don't require an argument" do
    (cop_config['Blacklist'] - methods_with_arguments).each do |method_name|
      it "registers an offense for `#{method_name}`" 

    end
  end

  context 'with `update_attribute` method in blacklist' do
    let(:cop_config) do
      { 'Blacklist' => %w[update_attribute] }
    end

    whitelist = cop_config['Blacklist'].reject do |val|
      val == 'update_attribute'
    end

    whitelist.each do |method_name|
      it "accepts `#{method_name}`" 

    end

    it 'registers an offense for `update_attribute`' 

  end

  context 'with whitelist' do
    let(:cop_config) do
      {
        'Blacklist' => %w[toggle! touch],
        'Whitelist' => %w[touch]
      }
    end

    it 'registers an offense for method not in whitelist' 


    it 'accepts method in whitelist, superseding the blacklist' 

  end
end

