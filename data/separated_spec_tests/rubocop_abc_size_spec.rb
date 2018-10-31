# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Metrics::AbcSize, :config do
  subject(:cop) { described_class.new(config) }

  context 'when Max is 0' do
    let(:cop_config) { { 'Max' => 0 } }

    it 'accepts an empty method' 


    it 'accepts an empty `define_method`' 


    it 'registers an offense for an if modifier' 


    it 'registers an offense for an assignment of a local variable' 


    it 'registers an offense for an assignment of an element' 


    it 'registers an offense for complex content including A, B, and C ' \
       'scores' do
      inspect_source(<<-RUBY.strip_indent)
        def method_name
          my_options = Hash.new if 1 == 1 || 2 == 2 # 1, 3, 2
          my_options.each do |key, value|           # 0, 1, 0
            p key                                   # 0, 1, 0
            p value                                 # 0, 1, 0
          end
        end
      RUBY
      expect(cop.messages)
        .to eq(['Assignment Branch Condition size for method_name is too ' \
                'high. [6.4/0]']) # sqrt(1*1 + 6*6 + 2*2) => 6.4
    end

    it 'registers an offense for a `define_method`' 


    context 'target_ruby_version >= 2.3', :ruby23 do
      it 'treats safe navigation method calls like regular method calls' 

    end
  end

  context 'when Max is 2' do
    let(:cop_config) { { 'Max' => 2 } }

    it 'accepts two assignments' 

  end

  context 'when Max is 1.8' do
    let(:cop_config) { { 'Max' => 1.8 } }

    it 'accepts a total score of 1.7' 

  end

  {
    1.3     => '3.74/1.3',    # no more than 2 decimals reported
    10.3    => '37.42/10.3',
    100.321 => '374.2/100.3', # 4 significant digits, so only 1 decimal here
    1000.3  => '3742/1000'
  }.each do |max, presentation|
    context "when Max is #{max}" do
      let(:cop_config) { { 'Max' => max } }

      it "reports size and max as #{presentation}" 

    end
  end
end

