require 'rails_helper'

describe ProjectMembershipEnrollerService do
  let(:user) { create(:user, email: 'foo@bar.com') }
  let(:current_team) { create(:team) }
  let(:project) { create(:project) }
  let(:service) { described_class.new(user, current_team, project) }

  subject { service.enroll }

  describe '.call' do
    context 'when the user is found' do
      context 'when the user is already member of the team' do
        before do
          project.users << user
        end

        it 'returns false' 


        it 'tells that the user is already enrolled to the project' 

      end

      context 'when the user is not member of the team' do
        before do
          allow(user).to receive(:teams).and_return([])
        end

        it 'returns true' 


        it 'tells that the user was added to the project' 

      end
    end

    context 'when the user is not found' do
      let(:user) { nil }

      it 'returns false' 


      it 'tells that the user is not found' 

    end
  end
end

