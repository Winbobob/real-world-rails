require 'spec_helper'

module ChefSpec::Error
  describe CommandNotStubbed do
    let(:instance) { described_class.new(args: ['cat']) }

    it 'raises an exception with the correct message' 

  end

  describe CookbookPathNotFound do
    let(:instance) { described_class.new }

    it 'raises an exception with the correct message' 

  end

  describe GemLoadError do
    let(:instance) { described_class.new(gem: 'bacon', name: 'bacon') }

    it 'raises an exception with the correct message' 

  end
end

