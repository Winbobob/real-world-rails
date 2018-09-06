describe 'users/index.html.haml', type: 'view' do
  let(:user) { stub_model(User) }
  before do
    allow(view).to receive(:current_user).and_return(user)
    allow(view).to receive(:users).and_return(
      Kaminari.paginate_array([user], total_count: 1).page(1)
    )
  end
  it 'should see users option' 

end

