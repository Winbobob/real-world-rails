require 'rails_helper'
require_dependency 'email_updater'

describe EmailUpdater do
  let(:old_email) { 'old.email@example.com' }
  let(:new_email) { 'new.email@example.com' }

  it "provides better error message when a staged user has the same email" 


  context 'as a regular user' do
    let(:user) { Fabricate(:user, email: old_email) }
    let(:updater) { EmailUpdater.new(user.guardian, user) }

    before do
      Jobs.expects(:enqueue).once.with(:critical_user_email, has_entries(type: :confirm_new_email, to_address: new_email))
      updater.change_to(new_email)
      @change_req = user.email_change_requests.first
    end

    it "starts the new confirmation process" 


    context 'confirming an invalid token' do
      it "produces an error" 

    end

    context 'confirming a valid token' do
      it "updates the user's email" 

    end

  end

  context 'as a staff user' do
    let(:user) { Fabricate(:moderator, email: old_email) }
    let(:updater) { EmailUpdater.new(user.guardian, user) }

    before do
      Jobs.expects(:enqueue).once.with(:critical_user_email, has_entries(type: :confirm_old_email, to_address: old_email))
      updater.change_to(new_email)
      @change_req = user.email_change_requests.first
    end

    it "starts the old confirmation process" 


    context 'confirming an invalid token' do
      it "produces an error" 

    end

    context 'confirming a valid token' do
      before do
        Jobs.expects(:enqueue).once.with(:critical_user_email, has_entries(type: :confirm_new_email, to_address: new_email))
        updater.confirm(@change_req.old_email_token.token)
        @change_req.reload
      end

      it "starts the new update process" 


      it "cannot be confirmed twice" 


      context "completing the new update process" do
        before do
          Jobs.expects(:enqueue).with(:critical_user_email, has_entries(type: :notify_old_email, to_address: old_email)).never
          updater.confirm(@change_req.new_email_token.token)
        end

        it "updates the user's email" 

      end
    end
  end

  context 'hide_email_address_taken is enabled' do
    before do
      SiteSetting.hide_email_address_taken = true
    end

    let(:user) { Fabricate(:user, email: old_email) }
    let(:existing) { Fabricate(:user, email: new_email) }
    let(:updater) { EmailUpdater.new(user.guardian, user) }

    it "doesn't error if user exists with new email" 


    it 'sends an email to the owner of the account with the new email' 

  end
end

