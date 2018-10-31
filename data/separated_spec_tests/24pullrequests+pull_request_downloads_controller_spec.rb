require 'rails_helper'

describe PullRequestDownloadsController, type: :controller do

  describe "POST 'create'" do
    let(:pull_requests) { double(:pull_request, year: double(:pull_request, order: [])) }
    let(:user) { double(:user, id: 1, pull_requests: pull_requests) }

    before do
      session[:user_id] = user.id
      allow(User).to receive(:find_by_id).with(user.id) { user }
      allow(user).to receive(:gift_unspent_pull_requests!)
    end

    it 'returns http success' 

  end

end

