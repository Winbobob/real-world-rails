require 'spec_helper'

describe 'Sign up', js: true do

  let(:identity) { build(:identity) }

  def fill_in_sign_up_form
    visit root_path
    click_on I18n.t('header.signup')

    within('form#new_identity') do
      fill_in 'email', with: identity.email
      fill_in 'password', with: identity.password
      fill_in 'password_confirmation', with: identity.password_confirmation
      click_on I18n.t('header.signup')
    end
  end

  def email_activation_link
    mail = ActionMailer::Base.deliveries.last
    expect(mail).to be_present
    expect(mail.to).to eq([identity.email])
    expect(mail.subject).to eq(I18n.t 'token_mailer.activation.subject')

    path = "/activations/#{Token::Activation.last.token}/edit"
    link = "#{ENV['URL_SCHEMA']}://#{ENV['URL_HOST']}#{path}"

    expect(mail.body.to_s).to have_link(link)

    path
  end

  it 'allows a user to sign up and activate the account' 


  it 'allows a user to sign up and activate the account in a different browser' 


  it 'allows user to resend confirmation email' 


end

