require 'spec_helper'

describe RspecFlaky::FlakyExamplesCollection, :aggregate_failures do
  let(:collection_hash) do
    {
      a: { example_id: 'spec/foo/bar_spec.rb:2' },
      b: { example_id: 'spec/foo/baz_spec.rb:3' }
    }
  end
  let(:collection_report) do
    {
      a: {
        example_id: 'spec/foo/bar_spec.rb:2',
        first_flaky_at: nil,
        last_flaky_at: nil,
        last_flaky_job: nil
      },
      b: {
        example_id: 'spec/foo/baz_spec.rb:3',
        first_flaky_at: nil,
        last_flaky_at: nil,
        last_flaky_job: nil
      }
    }
  end

  describe '#initialize' do
    it 'accepts no argument' 


    it 'accepts a hash' 


    it 'does not accept anything else' 

  end

  describe '#to_h' do
    it 'calls #to_h on the values' 

  end

  describe '#-' do
    it 'returns only examples that are not present in the given collection' 


    it 'fails if the given collection does not respond to `#key?`' 

  end
end

