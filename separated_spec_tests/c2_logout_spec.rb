# This is both a feature and a controller spec and the controller spec doesn't test the route
describe "Logging out" do
  context 'a user is signed in' do
    before do
      login_as(create(:user))
    end

    it 'allows logout via the header button' 

  end
end

