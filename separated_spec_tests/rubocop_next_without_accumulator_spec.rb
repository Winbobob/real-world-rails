# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Lint::NextWithoutAccumulator do
  subject(:cop) { described_class.new }

  def code_without_accumulator(method_name)
    <<-SOURCE
      (1..4).#{method_name}(0) do |acc, i|
        next if i.odd?
        acc + i
      end
    SOURCE
  end

  def code_with_accumulator(method_name)
    <<-SOURCE
      (1..4).#{method_name}(0) do |acc, i|
        next acc if i.odd?
        acc + i
      end
    SOURCE
  end

  def code_with_nested_block(method_name)
    <<-SOURCE
      [(1..3), (4..6)].#{method_name}(0) do |acc, elems|
        elems.each_with_index do |elem, i|
          next if i == 1
          acc << elem
        end
        acc
      end
    SOURCE
  end

  shared_examples 'reduce/inject' do |reduce_alias|
    context "given a #{reduce_alias} block" do
      it 'registers an offense for a bare next' 


      it 'accepts next with a value' 


      it 'accepts next within a nested block' 

    end
  end

  it_behaves_like 'reduce/inject', :reduce
  it_behaves_like 'reduce/inject', :inject

  context 'given an unrelated block' do
    it 'accepts a bare next' 


    it 'accepts next with a value' 

  end
end

