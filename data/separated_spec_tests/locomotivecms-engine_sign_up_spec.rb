describe 'User signs up' do

  it 'with valid email and password'  do
    sign_up_with 'John Doe', 'john@doe.net', 'password'
    expect(page).to have_content('My sites')
    expect(page).to have_content('You have signed up successfully.')
  end

  it 'with invalid email' 


  it 'with blank password' 


  it 'with not matching passwords' 


  context 'registration disabled' do

    before { allow(Locomotive.config).to receive(:enable_registration).and_return(false) }

    it 'login screen does not show link to create account' 

  end

end

