require 'spec_helper'

describe Gitlab::Git::LfsPointerFile do
  let(:data) { "1234\n" }

  subject { described_class.new(data) }

  describe '#size' do
    it 'counts the bytes' 


    it 'handles non ascii data' 

  end

  describe '#sha256' do
    it 'hashes the content correctly' 

  end

  describe '#pointer' do
    it 'starts with the LFS version' 


    it 'includes sha256' 


    it 'ends with the size' 

  end
end

