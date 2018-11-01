# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Performance::TimesMap do
  subject(:cop) { described_class.new }

  before do
    inspect_source(source)
  end

  shared_examples 'map_or_collect' do |method|
    context ".times.#{method}" do
      context 'with a block' do
        let(:source) { "4.times.#{method} { |i| i.to_s }" }

        it 'registers an offense' 


        it 'auto-corrects' 

      end

      context 'for non-literal receiver' do
        let(:source) { "n.times.#{method} { |i| i.to_s }" }

        it 'registers an offense' 

      end

      context 'with an explicitly passed block' do
        let(:source) { "4.times.#{method}(&method(:foo))" }

        it 'registers an offense' 


        it 'auto-corrects' 

      end

      context 'without a block' do
        let(:source) { "4.times.#{method}" }

        it "doesn't register an offense" 

      end

      context 'called on nothing' do
        let(:source) { "times.#{method} { |i| i.to_s }" }

        it "doesn't register an offense" 

      end
    end
  end

  it_behaves_like 'map_or_collect', 'map'
  it_behaves_like 'map_or_collect', 'collect'
end

