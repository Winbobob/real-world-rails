require "rails_helper"

RSpec.describe "Follows #show", type: :request do
  let(:current_user) { create(:user) }
  let(:user) { create(:user) }
  let(:tag) { create(:tag) }
  let(:organization) { create(:organization) }

  before { login_as current_user }

  def get_following_status
    ["User", "Organization", "Tag"].map do |type|
      get "/follows/#{send(type.downcase).id}", params: { followable_type: type }
      response.body
    end
  end

  it "rejects unless logged-in" 


  it "returns false when not followeing" 


  it "returns true when is following" 


  it "return self if current_user try to follow themself" 

end

