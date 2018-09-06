# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Lint::MultipleCompare do
  subject(:cop) { described_class.new(config) }

  let(:config) { RuboCop::Config.new }

  shared_examples 'Check to use two comparison operator' do |operator1, operator2| # rubocop:disable Metrics/LineLength
    bad_source = "x #{operator1} y #{operator2} z"
    good_source = "x #{operator1} y && y #{operator2} z"

    it "registers an offense for #{bad_source}" 


    it 'autocorrects' 


    it "accepts for #{good_source}" 

  end

  %w[< > <= >=].repeated_permutation(2) do |operator1, operator2|
    include_examples 'Check to use two comparison operator',
                     operator1, operator2
  end

  it 'accepts to use one compare operator' 

end

