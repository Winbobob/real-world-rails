# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Performance::UnneededSort do
  subject(:cop) { described_class.new }

  it 'registers an offense when first is called with sort' 


  it 'registers an offense when last is called on sort with comparator' 


  it 'registers an offense when first is called on sort_by' 


  it 'registers an offense when last is called on sort_by no block' 


  it 'registers an offense when slice(0) is called on sort' 


  it 'registers an offense when [0] is called on sort' 


  it 'registers an offense when [](0) is called on sort' 


  it 'registers an offense when at(0) is called on sort_by' 


  it 'registers an offense when slice(-1) is called on sort_by' 


  it 'registers an offense when [-1] is called on sort' 


  # Arguments get too complicated to handle easily, e.g.
  # '[1, 2, 3].sort.last(2)' is not equivalent to '[1, 2, 3].max(2)',
  # so we don't register an offense.
  it 'does not register an offense when first has an argument' 


  it 'does not register an offense for sort!.first' 


  it 'does not register an offense for sort_by!(&:something).last' 


  it 'does not register an offense when sort_by is used without first' 


  it 'does not register an offense when first is used without sort_by' 


  it 'does not register an offense when first is used before sort' 


  # `[2, 1, 3].sort_by.first` is equivalent to `[2, 1, 3].first`, but this
  # cop would "correct" it to `[2, 1, 3].min_by`.
  it 'does not register an offense when sort_by is not given a block' 


  context 'when not taking first or last element' do
    it 'does not register an offense when [1] is called on sort' 


    it 'does not register an offense when at(-2) is called on sort_by' 

  end

  context 'autocorrect' do
    it 'corrects sort.first to min' 


    it 'corrects sort.last to max' 


    it 'corrects sort.first (with comparator) to min' 


    it 'corrects sort.at(-1) to max' 


    it 'corrects sort_by(&:foo).slice(0) to min_by(&:foo)' 


    it 'corrects sort_by(&:foo)[0] to min_by(&:foo)' 


    it 'corrects sort_by(&:something).first to min_by(&:something)' 


    it 'corrects sort_by { |x| x.foo }[-1] to max_by { |x| x.foo }' 


    it 'corrects sort_by { |x| x.foo }.[](-1) to max_by { |x| x.foo }' 


    it 'corrects sort_by { |x| x.something }.last ' \
       'to max_by { |x| x.something }' do
      new_source = autocorrect_source('foo.sort_by { |x| x.something }.last')

      expect(new_source).to eq('foo.max_by { |x| x.something }')
    end
  end
end

