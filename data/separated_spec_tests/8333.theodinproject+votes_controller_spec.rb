require 'rails_helper'

RSpec.describe VotesController do
  let(:user) { double('User') }
  let(:other_user) { double('Other User') }
  let(:project) { double('Project', user: other_user) }

  let(:project_id) { '1' }
  let(:params) {
    {
      lesson_id: '1',
      project_id: project_id
    }
  }

  describe '#create' do
    context 'when user is signed in' do
      context "user votes another user's project" do
        before do
          allow(controller).to receive(:user_signed_in?).and_return(true)
          allow(Project).to receive(:find).with(project_id).and_return(project)
          allow(controller).to receive(:current_user).and_return(user)
          allow(project).to receive(:upvote_for).with(user)
        end

        it 'creates a new user vote for the project' 

      end

      context 'user tries to vote his/her own project' do
        before do
          allow(controller).to receive(:user_signed_in?).and_return(true)
          allow(Project).to receive(:find).with(project_id).and_return(project)
          allow(controller).to receive(:current_user).and_return(other_user)
        end

        it 'returns a status of bad request' 

      end
    end

    context 'when user is not signed in' do
      before do
        allow(controller).to receive(:user_signed_in?).and_return(false)
        allow(Project).to receive(:find).with(project_id).and_return(project)
      end

      it 'returns a status of unauthorized' 

    end
  end

  describe '#destroy' do
    context 'when user is signed in' do
      before do
        allow(controller).to receive(:user_signed_in?).and_return(true)
        allow(Project).to receive(:find).with(project_id).and_return(project)
        allow(controller).to receive(:current_user).and_return(user)
        allow(project).to receive(:remove_vote_for).with(user)
      end

      it 'removes the users vote for the project' 

    end

    context 'when user is not signed in' do
      before do
        allow(controller).to receive(:user_signed_in?).and_return(false)
        allow(Project).to receive(:find).with(project_id).and_return(project)
      end

      it 'returns a status of unauthorized' 

    end
  end
end

