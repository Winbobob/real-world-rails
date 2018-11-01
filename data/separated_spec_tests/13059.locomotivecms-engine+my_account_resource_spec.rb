require 'spec_helper'

describe Locomotive::API::Resources::MyAccountResource do

  include_context 'api site setup'

  let!(:account) { create(:account) }
  let(:params) { { locale: :en } }
  let(:url_prefix) { '/locomotive/acmi/api/v3/my_account' }
  let(:post_request) { post("#{url_prefix}.json", account: account_params) }

  context 'authenticated site' do

    include_context 'api header setup'

    describe 'GET show' do
      context 'JSON' do
        before { get "#{url_prefix}.json" }
        it 'returns the correct account' 

      end
    end

    describe 'PUT update' do
      context 'JSON' do
        let(:put_request) { put("#{url_prefix}.json", account: account_params) }
        let(:account_params) { { name: 'changed name' } }
        it 'changes the name' 

      end
    end

    describe 'POST create' do
      let(:account_params) { account.serializable_hash }

      context 'logged in' do
        it 'does not create the account' 

      end
    end

  end

  context 'not logged in' do
    let(:account_params) do
      account.serializable_hash.merge(
        email: 'ex@example.com',
        password: 'password123',
        password_confirmation: 'password123'
      )
    end

    context 'JSON' do
      it 'creates the account' 


      context 'invalid account' do
        let(:account_params) { { name: 'Wrong account' } }

        it 'does not create the account' 


        it 'sends the errors in the JSON response' 


      end
    end

  end

end

