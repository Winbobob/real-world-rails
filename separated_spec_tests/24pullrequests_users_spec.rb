require 'rails_helper'

describe 'Users', type: :request do
  subject { page }
  let(:user) { create :user, nickname: 'akira' }

  before do
    mock_is_admin
  end

  describe 'viewing the list of users' do
    before do
      5.times { create :user }
      visit users_path
    end

    it { is_expected.to have_content '5 Developers already involved' }
  end

  describe 'authenticated user navigation' do
    before do
      login(user)
    end

    describe '#profile' do

      describe 'when the user has not issued any pull requests' do
        it 'should display the grinchy message' 

      end

      describe 'when the user has gifted code or issued pull requests' do
        let!(:pull_requests) do
          [
            create(:pull_request, user: user, repo_name: 'foo/bar', title: "Moar foos"),
            create(:pull_request, user: user, repo_name: 'baz/qux', title: "Hi baz")
          ]
        end
        let!(:gift) { create(:gift, user: user, pull_request: pull_requests.first) }

        it 'has pull requests' 


        context 'with ignored organisations' do
          before { user.update_attribute(:ignored_organisations, %w{foo}) }

          it 'filters out repos for ignored organisations but still allows gifts' 

        end
      end

      describe 'when the user belong to an organisation' do
        let!(:organisation) { create(:organisation)  }
        let!(:user) { create(:user) }

        before do
          organisation.users << user
        end

        it 'has organisations' 

      end
    end

    context '#my_suggestions' do

      it 'when there are none' 


      it 'when the user has suggested projects' 


      context 'claiming projects' do
        it 'without an owner' 


        it 'with an owner' 

      end
    end
  end
end

