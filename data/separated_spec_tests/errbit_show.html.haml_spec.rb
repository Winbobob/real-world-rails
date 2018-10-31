describe 'users/show.html.haml', type: 'view' do
  let(:user) do
    stub_model(User, created_at: Time.zone.now, email: "test@example.com")
  end

  before do
    allow(Errbit::Config).to receive(:github_authentication).and_return(true)
    allow(controller).to receive(:current_user).and_return(stub_model(User))
    allow(view).to receive(:user).and_return(user)
  end

  context 'with GitHub authentication' do
    it 'shows github login' 


    it 'does not show github if blank' 

  end

  context "Linking GitHub account" do
    context 'viewing another user page' do
      it "doesn't show and github linking buttons if user is not current user" 

    end

    context 'viewing own user page' do
      before do
        allow(controller).to receive(:current_user).and_return(user)
      end

      it 'shows link github button when no login or token' 


      it 'shows unlink github button when login and token' 


      it "should confirm the 'resolve' link by default" 

    end
  end
end

