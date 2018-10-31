# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Lint::AmbiguousBlockAssociation do
  subject(:cop) { described_class.new }

  let(:error_message) do
    'Parenthesize the param `%s` to make sure that the block will be ' \
      'associated with the `%s` method call.'
  end

  shared_examples 'accepts' do |code|
    it 'does not register an offense' 

  end

  it_behaves_like 'accepts', 'foo == bar { baz a }'
  it_behaves_like 'accepts', 'foo ->(a) { bar a }'
  it_behaves_like 'accepts', 'some_method(a) { |el| puts el }'
  it_behaves_like 'accepts', 'some_method(a) do;puts a;end'
  it_behaves_like 'accepts', 'some_method a do;puts "dev";end'
  it_behaves_like 'accepts', 'some_method a do |e|;puts e;end'
  it_behaves_like 'accepts', 'Foo.bar(a) { |el| puts el }'
  it_behaves_like 'accepts', 'env ENV.fetch("ENV") { "dev" }'
  it_behaves_like 'accepts', 'env(ENV.fetch("ENV") { "dev" })'
  it_behaves_like 'accepts', '{ f: "b"}.fetch(:a) do |e|;puts e;end'
  it_behaves_like 'accepts', 'Hash[some_method(a) { |el| el }]'
  it_behaves_like 'accepts', 'foo = lambda do |diagnostic|;end'
  it_behaves_like 'accepts', 'Proc.new { puts "proc" }'
  it_behaves_like 'accepts', 'expect { order.save }.to(change { orders.size })'
  it_behaves_like 'accepts', 'scope :active, -> { where(status: "active") }'
  it_behaves_like(
    'accepts',
    'assert_equal posts.find { |p| p.title == "Foo" }, results.first'
  )
  it_behaves_like(
    'accepts',
    'assert_equal(posts.find { |p| p.title == "Foo" }, results.first)'
  )
  it_behaves_like(
    'accepts',
    'assert_equal(results.first, posts.find { |p| p.title == "Foo" })'
  )
  it_behaves_like(
    'accepts',
    'allow(cop).to receive(:on_int) { raise RuntimeError }'
  )
  it_behaves_like(
    'accepts',
    'allow(cop).to(receive(:on_int) { raise RuntimeError })'
  )

  context 'without parentheses' do
    context 'without receiver' do
      it 'registers an offense' 

    end

    context 'with receiver' do
      it 'registers an offense' 

    end

    context 'rspec expect {}.to change {}' do
      it 'registers an offense' 

    end

    context 'as a hash key' do
      it 'registers an offense' 

    end

    context 'with assignment' do
      it 'registers an offense' 

    end
  end
end

