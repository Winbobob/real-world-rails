require 'spec_helper'

describe Locomotive::API::Resources::AccountResource do

  include_context 'api site setup'

  let(:params) { { locale: :en } }
  let(:url_prefix) { '/locomotive/api/v3/accounts' }
  let!(:new_account) { create(:account, email: 'abc@example.com', name: 'Lisa Johnson') }

  context 'authenticated site as super admin' do
    include_context 'api header setup'
    let(:account) { create(:account, super_admin: true) }

    describe 'GET index' do
      context 'JSON' do
        before { get "#{url_prefix}/index.json" }

        it 'returns a successful response' 


        it 'returns an array' 


      end
    end

    describe 'GET show' do
      context 'JSON' do
        before { get "#{url_prefix}/#{account.id}.json" }

        it 'returns the spec account' 

      end
    end

    describe 'POST create' do
      context 'JSON' do
        let(:new_account) do
          attributes_for('account').tap do |_account|
            _account[:name] = 'Homer Simpson'
            _account[:email] = 'homer@example.com'
          end
        end

        it 'creates the account' 


        it 'does not set super_admin on create' 

      end
    end

    describe 'PUT update' do
      context 'JSON' do
        let(:updated_account_params) { { name: 'Maggie Anderson' } }
        let(:put_request) do
          put "#{url_prefix}/#{account.id}.json", account: updated_account_params
        end

        it 'changes the account name' 


        context 'setting super admin' do
          let(:put_request) do
            put("#{url_prefix}/#{new_account.id}.json", account: updated_account_params)
          end

          it 'sets super admin on the new account' 

        end

      end
    end

    describe 'DELETE destroy' do
      context 'JSON' do
        let(:delete_request) { delete("#{url_prefix}/#{new_account.id}.json")}

        it 'deletes the account' 

      end
    end

  end

end

