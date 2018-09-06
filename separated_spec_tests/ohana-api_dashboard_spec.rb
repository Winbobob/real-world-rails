require 'rails_helper'

feature 'Admin Home page' do
  context 'when not signed in' do
    before :each do
      visit '/admin'
    end

    it 'sets the current path to the admin sign in page' 


    it 'includes a link to the sign up page' 


    it 'does not include a link to the Home page in the navigation' 


    it 'does not include a link to Your locations in the navigation' 


    it 'uses the admin layout' 

  end

  context 'when signed in' do
    before :each do
      login_admin
      visit '/admin'
    end

    it 'greets the admin by their name' 


    it 'includes a link to organizations in the body' 


    it 'includes a link to locations in the body' 


    it 'includes a link to services in the body' 


    it 'includes a link to programs in the body' 


    it 'does not include a link to the sign up page in the navigation' 


    it 'does not include a link to the sign in page in the navigation' 


    it 'includes a link to sign out in the navigation' 


    it 'includes a link to the Edit Account page in the navigation' 


    it 'displays the name of the logged in admin in the navigation' 


    it 'includes a link to locations in the navigation' 


    it 'includes a link to organizations in the navigation' 


    it 'includes a link to services in the navigation' 


    it 'does not display a link to add a new organization' 


    it 'does not display a link to add a new location' 


    it 'does not display a link to add a new program' 


    it 'does not display a link to download CSV' 

  end

  context 'when signed in as super admin and no orgs exist' do
    before :each do
      login_super_admin
      visit '/admin'
    end

    it 'displays a link to add a new organization' 


    it 'does not display a link to add a new location' 


    it 'does not display a link to add a new program' 

  end

  context 'when signed in as super admin and orgs exist' do
    before :each do
      create(:organization)
      login_super_admin
      visit '/admin'
    end

    it 'displays a link to add a new location' 


    it 'displays a link to add a new program' 


    it 'displays link to download all tables as CSV files' 

  end

  describe 'Ohana API version' do
    let(:version) { File.read('VERSION').chomp }
    let(:prefix) { 'https://github.com/codeforamerica/ohana-api/blob/master/' }

    context 'super admin' do
      it 'displays Ohana API version number' 

    end

    context 'regular admin' do
      it 'does not display Ohana API version number' 

    end
  end
end

