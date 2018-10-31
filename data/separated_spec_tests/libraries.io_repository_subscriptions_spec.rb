require "rails_helper"

describe "RepositorySubscriptionsController" do
  let(:user) { create(:user) }
  let(:repository) { create(:repository) }
  let(:repository_subscription) { create(:repository_subscription, user: user, repository: repository) }

  describe "GET /repository_subscriptions/:id/edit", type: :request do
    it "redirects to /login if not logged in" 


    it "renders successfully if logged in" 

  end
end

