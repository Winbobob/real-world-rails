require 'spec_helper'

describe Users::SalesforceIdSynchronizer do
  describe '.call' do
    before { allow_any_instance_of(Apiguru::ListUsers).to receive(:call) { apiguru_users } }

    context 'When each user is both present on salesforce and people side' do
      let(:apiguru_users) do
        [{
          id: 'salesforce_id1',
          first_name: 'Eddard',
          last_name: 'Stark',
          email: 'eddy2121@got.com',
        }, {
          id: 'salesforce_id2',
          first_name: 'Jon',
          last_name: 'Snow',
          email: 'bastard666@thug.life',
        }]
      end

      subject { described_class.new([user1.id, user2.id]).call }

      context 'and have never been synced' do
        let!(:user1) { create :user, first_name: 'Eddard', last_name: 'Stark' }
        let!(:user2) { create :user, first_name: 'Jon', last_name: 'Snow' }

        it 'returns true when synced all users without error' 


        it 'updates users with salesforce_id after successful sync' 

      end

      context 'and was synced before' do
        let!(:user1) { create :user, first_name: 'Eddard', last_name: 'Stark', salesforce_id: 'id1' }
        let!(:user2) { create :user, first_name: 'Jon', last_name: 'Snow', salesforce_id: 'id2' }

        it 'returns true when synced all users without error' 


        it 'updates users with salesforce_id after successful sync' 

      end
    end

    context 'When there are 2 users with exact names' do
      let(:apiguru_users) do
        [{
          id: 'salesforce_id1',
          first_name: 'Eddard',
          last_name: 'Stark',
          email: 'eddy2121@got.com',
        }, {
          id: 'salesforce_id2',
          first_name: 'Eddard',
          last_name: 'Stark',
          email: 'eddy.kox@got.com',
        }]
      end

      subject { described_class.new([user1.id, user2.id]).call }

      context 'and both of them have never been synced' do
        let!(:user1) { create :user, first_name: 'Eddard', last_name: 'Stark', email: 'eddy2121@got.com' }
        let!(:user2) { create :user, first_name: 'Eddard', last_name: 'Stark', email: 'eddy.kox@got.com' }

        it 'returns true when synced all users without error' 


        it 'updates users with salesforce_id after successful sync' 

      end
    end

    context 'When there is no matching user on salesforce side' do
      let(:apiguru_users) do
        [{
          id: 'salesforce_id1',
          first_name: 'Eddard',
          last_name: 'Stark',
          email: 'eddy2121@got.com',
        }]
      end

      subject { described_class.new(user.id).call }

      let!(:user) { create :user, first_name: 'Jon', last_name: 'Snow', email: 'bastard666@thug.life' }

      it 'returns proper errors' 

    end
  end
end

