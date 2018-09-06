require 'spec_helper'
require 'email_spec'

describe Emails::Profile do
  include EmailSpec::Matchers
  include_context 'gitlab email notification'

  shared_examples 'a new user email' do
    it 'is sent to the new user with the correct subject and body' 

  end

  describe 'for new users, the email' do
    let(:example_site_path) { root_path }
    let(:new_user) { create(:user, email: new_user_address, created_by_id: 1) }
    let(:token) { 'kETLwRaayvigPq_x3SNM' }

    subject { Notify.new_user_email(new_user.id, token) }

    it_behaves_like 'an email sent from GitLab'
    it_behaves_like 'a new user email'
    it_behaves_like 'it should not have Gmail Actions links'
    it_behaves_like 'a user cannot unsubscribe through footer link'

    it 'contains the password text' 


    it 'includes a link for user to set password' 


    it 'explains the reset link expiration' 

  end

  describe 'for users that signed up, the email' do
    let(:example_site_path) { root_path }
    let(:new_user) { create(:user, email: new_user_address, password: "securePassword") }

    subject { Notify.new_user_email(new_user.id) }

    it_behaves_like 'an email sent from GitLab'
    it_behaves_like 'a new user email'
    it_behaves_like 'it should not have Gmail Actions links'
    it_behaves_like 'a user cannot unsubscribe through footer link'

    it 'does not contain the new user\'s password' 

  end

  describe 'user added ssh key' do
    let(:key) { create(:personal_key) }

    subject { Notify.new_ssh_key_email(key.id) }

    it_behaves_like 'an email sent from GitLab'
    it_behaves_like 'it should not have Gmail Actions links'
    it_behaves_like 'a user cannot unsubscribe through footer link'

    it 'is sent to the new user' 


    it 'has the correct subject' 


    it 'contains the new ssh key title' 


    it 'includes a link to ssh keys page' 


    context 'with SSH key that does not exist' do
      it { expect { Notify.new_ssh_key_email('foo') }.not_to raise_error }
    end
  end

  describe 'user added gpg key' do
    let(:gpg_key) { create(:gpg_key) }

    subject { Notify.new_gpg_key_email(gpg_key.id) }

    it_behaves_like 'an email sent from GitLab'
    it_behaves_like 'it should not have Gmail Actions links'
    it_behaves_like 'a user cannot unsubscribe through footer link'

    it 'is sent to the new user' 


    it 'has the correct subject' 


    it 'contains the new gpg key title' 


    it 'includes a link to gpg keys page' 


    context 'with GPG key that does not exist' do
      it { expect { Notify.new_gpg_key_email('foo') }.not_to raise_error }
    end
  end
end

