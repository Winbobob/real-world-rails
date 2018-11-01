require 'spec_helper'

describe Users::CreateService do
  describe '#execute' do
    let(:admin_user) { create(:admin) }

    context 'with an admin user' do
      let(:service) { described_class.new(admin_user, params) }

      context 'when required parameters are provided' do
        let(:params) do
          { name: 'John Doe', username: 'jduser', email: 'jd@example.com', password: 'mydummypass' }
        end

        it 'returns a persisted user' 


        it 'persists the given attributes' 


        context 'when the current_user is not persisted' do
          let(:admin_user) { build(:admin) }

          it 'persists the given attributes and sets created_by_id to nil' 

        end

        it 'user is not confirmed if skip_confirmation param is not present' 


        it 'logs the user creation' 


        it 'executes system hooks ' 


        it 'does not send a notification email' 

      end

      context 'when force_random_password parameter is true' do
        let(:params) do
          { name: 'John Doe', username: 'jduser', email: 'jd@example.com', password: 'mydummypass', force_random_password: true }
        end

        it 'generates random password' 

      end

      context 'when password_automatically_set parameter is true' do
        let(:params) do
          {
            name: 'John Doe',
            username: 'jduser',
            email: 'jd@example.com',
            password: 'mydummypass',
            password_automatically_set: true
          }
        end

        it 'persists the given attributes' 

      end

      context 'when skip_confirmation parameter is true' do
        let(:params) do
          { name: 'John Doe', username: 'jduser', email: 'jd@example.com', password: 'mydummypass', skip_confirmation: true }
        end

        it 'confirms the user' 

      end

      context 'when reset_password parameter is true' do
        let(:params) do
          { name: 'John Doe', username: 'jduser', email: 'jd@example.com', password: 'mydummypass', reset_password: true }
        end

        it 'resets password even if a password parameter is given' 


        it 'sends a notification email' 

      end
    end

    context 'with nil user' do
      let(:params) do
        { name: 'John Doe', username: 'jduser', email: 'jd@example.com', password: 'mydummypass', skip_confirmation: true }
      end
      let(:service) { described_class.new(nil, params) }

      it 'persists the given attributes' 

    end
  end
end

