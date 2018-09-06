require 'rails_helper'

describe 'Gifts', type: :request do
  subject { page }
  let(:user) { create :user, nickname: 'akira' }

  before do
    mock_is_admin
    login(user)
  end

  describe 'gifting a pull request' do
    let!(:pull_request) { create(:pull_request, user: user) }
    let!(:gift) { create(:gift, user: user, date: Date.yesterday) }

    before do
      visit new_gift_path
    end

    it 'only displays ungifted pull requests' 


    context 'tweeting' do
      let(:user) { create :user, email_frequency: 'never', twitter_token: 'foo', twitter_secret: 'bar' }

      it "posts a tweet when the user selects 'tweet'" 


      it "does not post a tweet when 'tweet' is not selected" 


      after do
        click_on 'Gift it!'
      end
    end
  end
end

