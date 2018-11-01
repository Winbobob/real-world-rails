require 'spec_helper'

describe Gitlab::GithubImport::Representation::User do
  shared_examples 'a User' do
    it 'returns an instance of User' 


    context 'the returned User' do
      it 'includes the user ID' 


      it 'includes the username' 

    end
  end

  describe '.from_api_response' do
    it_behaves_like 'a User' do
      let(:response) { double(:response, id: 42, login: 'alice') }
      let(:user) { described_class.from_api_response(response) }
    end
  end

  describe '.from_json_hash' do
    it_behaves_like 'a User' do
      let(:hash) { { 'id' => 42, 'login' => 'alice' } }
      let(:user) { described_class.from_json_hash(hash) }
    end
  end
end

