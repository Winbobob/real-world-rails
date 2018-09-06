describe 'users/edit.html.haml', type: 'view' do
  let(:user) { stub_model(User, name: 'shingara') }
  before do
    allow(view).to receive(:current_user).and_return(user)
    allow(view).to receive(:user).and_return(user)
  end
  it 'should have per_page option' 


  it 'should have time_zone option' 

end

