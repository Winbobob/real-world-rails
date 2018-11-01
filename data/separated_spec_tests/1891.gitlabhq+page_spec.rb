require 'spec_helper'

describe BitbucketServer::Page do
  let(:response) { { 'values' => [{ 'description' => 'Test' }], 'isLastPage' => false, 'nextPageStart' => 2 } }

  before do
    # Autoloading hack
    BitbucketServer::Representation::PullRequest.new({})
  end

  describe '#items' do
    it 'returns collection of needed objects' 

  end

  describe '#attrs' do
    it 'returns attributes' 

  end

  describe '#next?' do
    it 'returns true' 


    it 'returns false' 

  end

  describe '#next' do
    it 'returns next attribute' 

  end
end

