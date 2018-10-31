require 'spec_helper'

describe Gitlab::Identifier do
  let(:identifier) do
    Class.new { include Gitlab::Identifier }.new
  end

  let(:project) { create(:project) }
  let(:user) { create(:user) }
  let(:key) { create(:key, user: user) }

  describe '#identify' do
    context 'without an identifier' do
      it 'returns nil' 

    end

    context 'with a user identifier' do
      it 'identifies the user using a user ID' 

    end

    context 'with an SSH key identifier' do
      it 'identifies the user using an SSH key ID' 

    end
  end

  describe '#identify_using_user' do
    it 'returns the User for an existing ID in the identifier' 


    it 'returns nil for a non existing user ID' 


    it 'caches the found users per ID' 

  end

  describe '#identify_using_ssh_key' do
    it 'returns the User for an existing SSH key' 


    it 'returns nil for an invalid SSH key' 


    it 'caches the found users per key' 

  end
end

