require 'spec_helper'

describe Gitlab::Search::Query do
  let(:query) { 'base filter:wow anotherfilter:noway name:maybe other:mmm leftover' }
  let(:subject) do
    described_class.new(query) do
      filter :filter
      filter :name, parser: :upcase.to_proc
      filter :other
    end
  end

  it { expect(described_class).to be < SimpleDelegator }

  it 'leaves undefined filters in the main query' 


  it 'parses filters' 


  context 'with an empty filter' do
    let(:query) { 'some bar name: baz' }

    it 'ignores empty filters' 

  end

  context 'with a pipe' do
    let(:query) { 'base | nofilter' }

    it 'does not escape the pipe' 

  end
end

