require 'spec_helper'

describe 'GPG signed commits', :js do
  let(:project) { create(:project, :repository) }

  it 'changes from unverified to verified when the user changes his email to match the gpg key' 


  it 'changes from unverified to verified when the user adds the missing gpg key' 


  context 'shows popover badges' do
    let(:user_1) do
      create :user, email: GpgHelpers::User1.emails.first, username: 'nannie.bernhard', name: 'Nannie Bernhard'
    end

    let(:user_1_key) do
      Sidekiq::Testing.inline! do
        create :gpg_key, key: GpgHelpers::User1.public_key, user: user_1
      end
    end

    let(:user_2) do
      create(:user, email: GpgHelpers::User2.emails.first, username: 'bette.cartwright', name: 'Bette Cartwright').tap do |user|
        # secondary, unverified email
        create :email, user: user, email: GpgHelpers::User2.emails.last
      end
    end

    let(:user_2_key) do
      Sidekiq::Testing.inline! do
        create :gpg_key, key: GpgHelpers::User2.public_key, user: user_2
      end
    end

    before do
      user = create :user
      project.add_master(user)

      sign_in(user)
    end

    it 'unverified signature' 


    it 'unverified signature: user email does not match the committer email, but is the same user' 


    it 'unverified signature: user email does not match the committer email' 


    it 'verified and the gpg user has a gitlab profile' 


    it "verified and the gpg user's profile doesn't exist anymore" 

  end
end

