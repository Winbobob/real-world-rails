require 'spec_helper'

describe Bitbucket::Page do
  let(:response) { { 'values' => [{ 'username' => 'Ben' }], 'pagelen' => 2, 'next' => '' } }

  before do
    # Autoloading hack
    Bitbucket::Representation::User.new({})
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

