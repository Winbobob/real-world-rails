describe UsersController do
  include ReturnToHelper
  let(:user) { create(:user, client_slug: "test") }

  describe '#update' do
    before do
      login_as(user)
    end
    it "sets beta_active to true when a beta user isn't active" 

    it "sets beta_active to false when beta is active" 

  end
  def setup_user
    user.add_role(ROLE_BETA_USER)
  end
end

