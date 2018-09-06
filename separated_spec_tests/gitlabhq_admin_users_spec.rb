require 'spec_helper'

describe "Admin::Users" do
  let!(:user) do
    create(:omniauth_user, provider: 'twitter', extern_uid: '123456')
  end

  let!(:current_user) { create(:admin) }

  before do
    sign_in(current_user)
  end

  describe "GET /admin/users" do
    before do
      visit admin_users_path
    end

    it "is ok" 


    it "has users list" 


    describe 'Two-factor Authentication filters' do
      it 'counts users who have enabled 2FA' 


      it 'filters by users who have enabled 2FA' 


      it 'counts users who have not enabled 2FA' 


      it 'filters by users who have not enabled 2FA' 

    end
  end

  describe "GET /admin/users/new" do
    before do
      visit new_admin_user_path
      fill_in "user_name", with: "Big Bang"
      fill_in "user_username", with: "bang"
      fill_in "user_email", with: "bigbang@mail.com"
    end

    it "creates new user" 


    it "applies defaults to user" 


    it "creates user with valid data" 


    it "calls send mail" 


    it "sends valid email to user with email & password" 

  end

  describe "GET /admin/users/:id" do
    it "has user info" 


    describe 'Impersonation' do
      let(:another_user) { create(:user) }

      before do
        visit admin_user_path(another_user)
      end

      context 'before impersonating' do
        it 'shows impersonate button for other users' 


        it 'does not show impersonate button for admin itself' 


        it 'does not show impersonate button for blocked user' 

      end

      context 'when impersonating' do
        before do
          click_link 'Impersonate'
        end

        it 'logs in as the user when impersonate is clicked' 


        it 'sees impersonation log out icon' 


        it 'logs out of impersonated user back to original user' 


        it 'is redirected back to the impersonated users page in the admin after stopping' 

      end

      context 'when impersonating a user with an expired password' do
        before do
          another_user.update(password_expires_at: Time.now - 5.minutes)
          click_link 'Impersonate'
        end

        it 'does not redirect to password change page' 


        it 'is redirected back to the impersonated users page in the admin after stopping' 

      end
    end

    describe 'Two-factor Authentication status' do
      it 'shows when enabled' 


      it 'shows when disabled' 


      def expect_two_factor_status(status)
        page.within('.two-factor-status') do
          expect(page).to have_content(status)
        end
      end
    end
  end

  describe "GET /admin/users/:id/edit" do
    before do
      visit admin_users_path
      click_link "edit_user_#{user.id}"
    end

    it "has user edit page" 


    describe "Update user" do
      before do
        fill_in "user_name", with: "Big Bang"
        fill_in "user_email", with: "bigbang@mail.com"
        fill_in "user_password", with: "AValidPassword1"
        fill_in "user_password_confirmation", with: "AValidPassword1"
        choose "user_access_level_admin"
        click_button "Save changes"
      end

      it "shows page with new data" 


      it "changes user entry" 

    end

    describe 'update username to non ascii char' do
      it do
        fill_in 'user_username', with: '\u3042\u3044'
        click_button('Save')

        page.within '#error_explanation' do
          expect(page).to have_content('Username')
        end

        expect(page).to have_selector(%(form[action="/admin/users/#{user.username}"]))
      end
    end
  end

  describe "GET /admin/users/:id/projects" do
    let(:group) { create(:group) }
    let!(:project) { create(:project, group: group) }

    before do
      group.add_developer(user)

      visit projects_admin_user_path(user)
    end

    it "lists group projects" 


    it 'allows navigation to the group details' 


    it 'shows the group access level' 


    it 'allows group membership to be revoked', :js do
      page.within(first('.group_member')) do
        accept_confirm { find('.btn-remove').click }
      end
      wait_for_requests

      expect(page).not_to have_selector('.group_member')
    end
  end

  describe 'show user attributes' do
    it do
      visit admin_users_path

      click_link user.name

      expect(page).to have_content 'Account'
      expect(page).to have_content 'Personal projects limit'
    end
  end

  describe 'remove users secondary email', :js do
    let!(:secondary_email) do
      create :email, email: 'secondary@example.com', user: user
    end

    it do
      visit admin_user_path(user.username)

      expect(page).to have_content("Secondary email: #{secondary_email.email}")

      accept_confirm { find("#remove_email_#{secondary_email.id}").click }

      expect(page).not_to have_content(secondary_email.email)
    end
  end

  describe 'show user keys' do
    let!(:key1) do
      create(:key, user: user, title: "ssh-rsa Key1", key: "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC4FIEBXGi4bPU8kzxMefudPIJ08/gNprdNTaO9BR/ndy3+58s2HCTw2xCHcsuBmq+TsAqgEidVq4skpqoTMB+Uot5Uzp9z4764rc48dZiI661izoREoKnuRQSsRqUTHg5wrLzwxlQbl1MVfRWQpqiz/5KjBC7yLEb9AbusjnWBk8wvC1bQPQ1uLAauEA7d836tgaIsym9BrLsMVnR4P1boWD3Xp1B1T/ImJwAGHvRmP/ycIqmKdSpMdJXwxcb40efWVj0Ibbe7ii9eeoLdHACqevUZi6fwfbymdow+FeqlkPoHyGg3Cu4vD/D8+8cRc7mE/zGCWcQ15Var83Tczour Key1")
    end

    let!(:key2) do
      create(:key, user: user, title: "ssh-rsa Key2", key: "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDQSTWXhJAX/He+nG78MiRRRn7m0Pb0XbcgTxE0etArgoFoh9WtvDf36HG6tOSg/0UUNcp0dICsNAmhBKdncp6cIyPaXJTURPRAGvhI0/VDk4bi27bRnccGbJ/hDaUxZMLhhrzY0r22mjVf8PF6dvv5QUIQVm1/LeaWYsHHvLgiIjwrXirUZPnFrZw6VLREoBKG8uWvfSXw1L5eapmstqfsME8099oi+vWLR8MgEysZQmD28M73fgW4zek6LDQzKQyJx9nB+hJkKUDvcuziZjGmRFlNgSA2mguERwL1OXonD8WYUrBDGKroIvBT39zS5d9tQDnidEJZ9Y8gv5ViYP7x Key2")
    end

    it do
      visit admin_users_path

      click_link user.name
      click_link 'SSH keys'

      expect(page).to have_content(key1.title)
      expect(page).to have_content(key2.title)

      click_link key2.title

      expect(page).to have_content(key2.title)
      expect(page).to have_content(key2.key)

      click_link 'Remove'

      expect(page).not_to have_content(key2.title)
    end
  end

  describe 'show user identities' do
    it 'shows user identities' 

  end

  describe 'update user identities' do
    before do
      allow(Gitlab::Auth::OAuth::Provider).to receive(:providers).and_return([:twitter, :twitter_updated])
    end

    it 'modifies twitter identity' 

  end

  describe 'remove user with identities' do
    it 'removes user with twitter identity' 

  end
end

