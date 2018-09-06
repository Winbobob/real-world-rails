# frozen_string_literal: true
require 'spec_helper'

describe 'Authentication' do
  subject { page }

  shared_examples_for 'valid registration' do
    it { is_expected.to have_content 'Successfully created user.' }
    it { is_expected.to have_content 'John Smith' }
    it { is_expected.to have_link 'Log Out' }
  end

  shared_examples_for 'registration error' do
    it { is_expected.to have_content('New User') }
    it { is_expected.to have_content('Please review the problems below:') }
  end

  shared_examples_for 'login error' do
    it { is_expected.to have_content('Sign In') }
    it { is_expected.to have_content('Invalid email') }
    it { is_expected.to have_content('or password.') }
  end

  describe 'using CAS' do
    # set the environment variable
    around(:example) do |example|
      env_wrapper('CAS_AUTH' => '1', 'USE_LDAP' => nil) { example.run }
    end

    # Not sure how to check new sign_in since we're not actually using the
    # Devise log in function so we don't go through the post-login method.
    # That said, we can stub session[:new_username] to test the functionality
    # of the UsersController#new method
    context 'where user does not exist' do
      before do
        @new_user = FactoryGirl.build(:user)
        inject_session new_username: @new_user.username
        visit 'users/new'
      end

      it 'should display the form properly' 

    end

    context 'where user does exist' do
      # not sure how to deal with testing logging in since it's using CAS
      pending 'should work properly'
    end
  end

  describe 'using password' do
    # set the environment variable
    around(:example) do |example|
      env_wrapper('CAS_AUTH' => nil) { example.run }
    end

    context 'testing login and logout helpers' do
      before { sign_in_as_user(@checkout_person) }
      it 'signs in the right user' 


      it 'can also sign out' 

    end

    context 'with new user' do
      context 'can register' do
        before do
          visit '/'
          click_link 'Sign In', match: :first
          click_link 'Register'
        end

        it 'displays registration form' 


        context 'with valid registration' do
          before do
            fill_in_registration
            click_button 'Create User'
          end

          it_behaves_like 'valid registration'
        end

        context 'with invalid registration' do
          before do
            fill_in_registration
          end

          context 'with mismatched passwords' do
            before do
              fill_in 'user_password_confirmation', with: 'password'
              click_button 'Create User'
            end

            it_behaves_like 'registration error'
          end

          context 'with missing password' do
            before do
              fill_in 'user_password', with: ''
              click_button 'Create User'
            end

            it_behaves_like 'registration error'
          end

          context 'with short password' do
            before do
              fill_in 'user_password', with: '1234'
              fill_in 'user_password_confirmation', with: '1234'
              click_button 'Create User'
            end

            it_behaves_like 'registration error'
          end

          context 'with missing email' do
            before do
              fill_in 'user_email', with: ''
              click_button 'Create User'
            end

            it_behaves_like 'registration error'
          end

          context 'with missing first name' do
            before do
              fill_in 'user_first_name', with: ''
              click_button 'Create User'
            end

            it_behaves_like 'registration error'
          end

          context 'with missing last name' do
            before do
              fill_in 'user_last_name', with: ''
              click_button 'Create User'
            end

            it_behaves_like 'registration error'
          end

          context 'with missing affiliation' do
            before do
              fill_in 'user_affiliation', with: ''
              click_button 'Create User'
            end

            it_behaves_like 'registration error'
          end

          context 'with existing user' do
            before do
              @user = FactoryGirl.create(:user)
              fill_in 'user_email', with: @user.email
              click_button 'Create User'
            end

            it_behaves_like 'registration error'
          end
        end
      end
    end

    context 'login with existing user' do
      before(:each) do
        visit '/'
        click_link 'Sign In', match: :first
        fill_in_login
      end

      it 'can log in with valid information' 


      context 'with invalid password' do
        before do
          fill_in 'Password', with: 'wrongpassword'
          click_button 'Sign in'
        end

        it_behaves_like 'login error'
      end

      context 'with missing password' do
        before do
          fill_in 'Password', with: ''
          click_button 'Sign in'
        end

        it_behaves_like 'login error'
      end

      context 'with invalid email' do
        before do
          fill_in 'Email', with: 'wrongemail@example.com'
          click_button 'Sign in'
        end

        it_behaves_like 'login error'
      end

      context 'with missing email' do
        before do
          fill_in 'Email', with: ''
          click_button 'Sign in'
        end

        it_behaves_like 'login error'
      end
    end

    context 'resetting the password' do
      before(:each) do
        visit '/'
        click_link 'Sign In', match: :first
        click_link 'Forgot your password?'
      end

      it 'responds with and error for non-existant login' 


      it 'responds correctly with valid login' 

    end
  end
end

