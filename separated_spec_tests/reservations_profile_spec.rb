# frozen_string_literal: true
require 'spec_helper'

describe 'User profile' do
  subject { page }

  context 'with password authentication' do
    around(:example) do |example|
      env_wrapper('CAS_AUTH' => nil) { example.run }
    end

    context 'as normal user' do
      before { login_as(@user, scope: :user) }

      context 'visiting own profile edit page' do
        before do
          visit '/users/' + @user.id.to_s
          click_link 'Edit Information'
        end

        it 'shows the correct fields' 


        context 'updating profile' do
          before { fill_in 'First name', with: 'Senor' }

          it 'updates with valid password' 


          it 'does not update with invalid password' 


          it 'does not update with blank password' 


          context 'changing password' do
            before do
              fill_in 'Password', with: 'newpassword'
              fill_in 'Current password', with: 'passw0rd'
            end

            it 'updates with valid confirmation' 


            it 'does not update with invalid confirmation' 

          end
        end
      end

      context 'trying to edit a different user' do
        before do
          visit '/users/' + @admin.id.to_s
        end

        it 'redirects to home page' 

      end
    end

    context 'as admin user' do
      before { login_as(@admin, scope: :user) }

      context 'visiting own profile edit page' do
        before do
          visit '/users/' + @admin.id.to_s
          click_link 'Edit Information'
        end

        it 'shows the correct fields' 


        context 'updating profile' do
          before { fill_in 'First name', with: 'Senor' }

          it 'updates with valid password' 


          it 'does not update with invalid password' 


          it 'does not update with blank password' 


          context 'changing password' do
            before do
              fill_in 'Password', with: 'newpassword'
              fill_in 'Current password', with: 'passw0rd'
            end

            it 'updates with valid confirmation' 


            it 'does not update with invalid confirmation' 

          end
        end
      end

      context 'trying to edit a different user' do
        before do
          visit '/users/' + @user.id.to_s
          click_link 'Edit Information'
        end

        it 'shows the correct fields' 


        it 'can update profile' 

      end
    end
  end

  context 'with CAS authentication' do
    around(:example) do |example|
      env_wrapper('CAS_AUTH' => '1') { example.run }
    end

    context 'as normal user' do
      before { login_as(@user, scope: :user) }

      context 'visiting own profile edit page' do
        before do
          visit '/users/' + @user.id.to_s
          click_link 'Edit Information'
        end

        it 'shows the correct fields' 


        it 'can update profile' 

      end

      context 'trying to edit a different user' do
        before do
          visit '/users/' + @admin.id.to_s
        end

        it 'redirects to home page' 

      end
    end

    context 'as admin user' do
      before { login_as(@admin, scope: :user) }

      context 'visiting own profile edit page' do
        before do
          visit '/users/' + @admin.id.to_s
          click_link 'Edit Information'
        end

        it 'shows the correct fields' 


        it 'can update profile' 

      end

      context 'trying to edit a different user' do
        before do
          visit '/users/' + @user.id.to_s
          click_link 'Edit Information'
        end

        it 'shows the correct fields' 


        it 'can update profile' 

      end
    end
  end
end

