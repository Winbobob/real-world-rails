describe Devise::SessionsController, type: 'controller' do
  render_views

  describe "POST /users/sign_in" do
    before do
      @request.env["devise.mapping"] = Devise.mappings[:user]
    end

    let(:app)  { Fabricate(:app) }
    let(:user) { Fabricate(:user) }

    it 'redirects to app index page if there are no apps for the user' 


    it 'displays a friendly error when credentials are invalid' 

  end
end

