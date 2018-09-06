require 'rails_helper'

feature 'Signing up' do
  scenario 'with all required fields present and valid' do
    sign_up('Moncef', 'moncef@foo.com', 'ohanatest', 'ohanatest')
    expect(page).to have_content 'activate your account'
    expect(page).to_not have_content('Admin')
    expect(current_path).to eq(new_user_session_path)
  end

  scenario 'with name missing' do
    sign_up('', 'moncef@foo.com', 'ohanatest', 'ohanatest')
    expect(page).to have_content "Name can't be blank"
  end

  scenario 'with email missing' do
    sign_up('Moncef', '', 'ohanatest', 'ohanatest')
    expect(page).to have_content "Email can't be blank"
  end

  scenario 'with password missing' do
    sign_up('Moncef', 'moncef@foo.com', '', 'ohanatest')
    expect(page).to have_content "Password can't be blank"
  end

  scenario 'with password confirmation missing' do
    sign_up('Moncef', 'moncef@foo.com', 'ohanatest', '')
    expect(page).to have_content "Password confirmation doesn't match Password"
  end

  scenario "when password and confirmation don't match" do
    sign_up('Moncef', 'moncef@foo.com', 'ohanatest', 'ohana')
    expect(page).to have_content "Password confirmation doesn't match Password"
  end

  scenario 'when password is too short' do
    sign_up('Moncef', 'moncef@foo.com', 'foo', 'foo')
    expect(page).to have_content 'Password is too short'
  end

  scenario 'with custom mailer' do
    reset_email
    sign_up('Moncef', 'moncef@foo.com', 'ohanatest', 'ohanatest')
    expect(first_email.body).to include('developer')
    expect(first_email.body).to include('documentation')
    expect(first_email.body).to include('http://codeforamerica.github.io/ohana-api-docs/')
  end

  context 'when signing up with existing email', email: true do
    before(:each) do
      sign_up('Moncef', 'moncef@foo.com', 'ohanatest', 'ohanatest')
      sign_up('Moncef', 'moncef@foo.com', 'ohanatest', 'ohanatest')
    end

    def portal_name
      I18n.t('titles.developer', brand: I18n.t('titles.brand'))
    end

    it 'does not reveal that the email has already been taken' 


    it 'redirects back to developer portal sign in page' 


    it 'sends an email to the user informing them of sign up' 


    it 'mentions the developer portal' 


    it 'links to the developer sign in page' 


    it 'links to the developer sign up page' 


    it 'links to the developer reset password page' 


    it 'mentions the developer portal in the email subject' 

  end

  describe 'duplicate email along with other validation errors' do
    shared_examples 'does not reveal existing email' do
      it 'does not display duplicate email error' 


      it 'does not send an email', email: true do
        expect(ActionMailer::Base.deliveries.size).to eq 1
      end
    end

    context 'when duplicate email and name is missing during sign up' do
      before(:each) do
        sign_up('Moncef', 'moncef@foo.com', 'ohanatest', 'ohanatest')
        sign_up('', 'moncef@foo.com', 'ohanatest', 'ohanatest')
      end

      it_behaves_like 'does not reveal existing email'
    end

    context 'when duplicate email and password is missing during sign up' do
      before(:each) do
        sign_up('Moncef', 'moncef@foo.com', 'ohanatest', 'ohanatest')
        sign_up('', 'moncef@foo.com', '', 'ohanatest')
      end

      it_behaves_like 'does not reveal existing email'
    end

    context 'when duplicate email and password_confirmation invalid during sign up' do
      before(:each) do
        sign_up('Moncef', 'moncef@foo.com', 'ohanatest', 'ohanatest')
        sign_up('Moncef', 'moncef@foo.com', 'ohanatest', '')
      end

      it_behaves_like 'does not reveal existing email'
    end

    context 'when duplicate email and password is too short during sign up' do
      before(:each) do
        sign_up('Moncef', 'moncef@foo.com', 'ohanatest', 'ohanatest')
        sign_up('Moncef', 'moncef@foo.com', 'foo', 'foo')
      end

      it_behaves_like 'does not reveal existing email'
    end
  end
end
