require 'spec_helper'

describe Locomotive::API::Resources::MembershipResource do

  include_context 'api site setup'

  let(:params) { { locale: :en } }
  let(:url_prefix) { '/locomotive/acmi/api/v3/memberships' }
  let(:target_account) { create(:account, email: 'ex@example.com')}

  context 'authenticated site' do
    include_context 'api header setup'

    describe 'GET index' do
      context 'JSON' do
        before { get "#{url_prefix}.json" }

        it 'returns a successful response' 


        it 'returns an array' 


      end
    end

    describe 'GET show' do
      context 'JSON' do
        before { get "#{url_prefix}/#{membership.id}.json" }

        it 'returns a successful response' 

      end
    end

    describe 'POST create' do
      let(:new_membership) do
        { role: 'author', account_id: target_account.id.to_s }
      end
      let(:post_request) do
        post "#{url_prefix}.json", membership: new_membership
      end

      it 'creates the new membership' 

    end

    describe 'PUT update' do
      let!(:target_membership) do
        create(:admin, account: target_account, site: site, role: 'admin')
      end
      let(:new_membership) { { role: 'author' } }
      let(:put_request) do
        put("#{url_prefix}/#{target_membership.id}.json",
            membership: new_membership)
      end

      it 'updates the membership' 

    end

    describe 'DELETE destroy' do
      context 'JSON' do
        let!(:target_membership) do
          create(:author, account: target_account, site: site, role: 'admin')
        end
        let(:delete_request) { delete "#{url_prefix}/#{target_membership.id}.json" }

        it 'deletes the membership' 


      end
    end

  end
end

