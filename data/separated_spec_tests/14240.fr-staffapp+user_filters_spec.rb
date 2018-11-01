require 'rails_helper'

RSpec.describe UserFilters do
  before do
    create_list :active_user, 2
    create :inactive_user
  end

  let(:filters) { { office: '', activity: 'active' } }
  let(:users) { User.all }
  let(:active_users) { User.active }
  let(:inactive_users) { User.inactive }
  let(:filtered_users) { described_class.new(users, filters).apply }

  describe 'FILTER_LIST' do
    it 'includes the activity and office filters' 

  end

  describe '#apply' do
    it 'returns an ActiveRecord collection' 


    context 'without filters' do
      let(:filters) { {} }
      it 'returns all users' 

    end

    context 'with filters' do
      context 'activity filter' do
        context 'for active users' do
          it 'returns the active users' 

        end

        context 'for inactive users' do
          let(:filters) { { activity: 'inactive' } }

          it 'returns the inactive users' 

        end
      end

      context 'office filter' do
        let(:office_id) { Office.first.id }
        let(:filters) { { office: office_id } }
        let(:filtered_users_offices) { filtered_users.map(&:office_id).uniq }

        it 'returns users only from one office' 


        it 'returns users from the specified office' 

      end
    end
  end
end

