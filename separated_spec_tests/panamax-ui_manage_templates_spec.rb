require 'spec_helper'

describe 'managing a template' do
  context 'as a user' do
    context 'from a running application' do
      it 'allows template creation' 


      context 'when user does not have a github access token' do
        before do
          user = User.new(github_access_token_present: false)
          allow(User).to receive(:find).and_return(user)
          allow(user).to receive(:update_attributes).and_return(true)
        end

        it 'allows the user to request and enter a token' 

      end

      context 'when user does not have an email' do
        before do
          user = User.new(github_access_token_present: true, email: '', github_username: 'bar')
          allow(User).to receive(:find).and_return(user)
          allow(user).to receive(:update_attributes).and_return(true)
        end

        it 'allows the user to request and enter a token' 

      end

      context 'when user does not have a github username' do
        before do
          user = User.new(github_access_token_present: true, email: 'foo', github_username: '')
          allow(User).to receive(:find).and_return(user)
          allow(user).to receive(:update_attributes).and_return(true)
        end

        it 'allows the user to request and enter a token' 

      end
    end
  end
end

