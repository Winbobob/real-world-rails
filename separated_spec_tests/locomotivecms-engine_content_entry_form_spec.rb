require 'spec_helper'

describe Locomotive::API::Forms::ContentEntryForm do

  class MyClass
    def self.by_ids_or_slugs(ids_or_slugs); end
  end

  describe '#set_belongs_to' do

    let(:field) { double(:field, name: :foo, class_name: 'MyClass') }
    let(:result) { double(:result, pluck: []) }

    subject { described_class.new(nil, nil) }

    before do
      allow(MyClass).to receive(:by_ids_or_slugs).and_return(result)
    end

    it 'sets the dynamic attribute field' 


  end

  describe '#set_many_to_many' do

    let(:field) { double(:field, name: 'projects', class_name: 'MyClass') }
    let(:result) { double(:result, pluck: [[1, :sacha], [2, :paul]]) }

    subject { described_class.new(nil, nil) }

    before do
      allow(MyClass).to receive(:by_ids_or_slugs).and_return(result)
    end

    it 'sets the dynamic attribute field' 


  end

end

