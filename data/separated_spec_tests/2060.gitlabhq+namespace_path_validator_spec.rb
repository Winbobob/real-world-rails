require 'spec_helper'

describe NamespacePathValidator do
  let(:validator) { described_class.new(attributes: [:path]) }

  describe '.valid_path?' do
    it 'handles invalid utf8' 

  end

  describe '#validates_each' do
    it 'adds a message when the path is not in the correct format' 


    it 'adds a message when the path is reserved when creating' 


    it 'adds a message when the path is reserved when updating' 

  end
end

