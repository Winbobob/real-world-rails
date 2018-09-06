# frozen_string_literal: true

require 'rails_helper'

describe AssignmentSuggestionsController do
  describe '#create' do
    let(:assignment) { create(:assignment) }
    let(:user) { create(:user) }

    before { allow(controller).to receive(:current_user).and_return(user) }
    it 'creates a record' 

  end

  describe '#destroy' do
    let(:assignment) { create(:assignment) }
    let(:assignment_suggestion) do
      create(:assignment_suggestion, user: owner, assignment: assignment)
    end
    let(:owner) { create(:user) }
    let(:nonowner) { create(:user, username: 'AnotherUser') }
    let(:admin) { create(:admin) }
    let(:subject) do
      delete :destroy, params: { assignment_id: assignment.id, id: assignment_suggestion.id }
    end

    context 'when the user is an admin' do
      before { allow(controller).to receive(:current_user).and_return(admin) }
      it 'destroys the suggestion' 

    end

    context 'when the user owns the suggestion' do
      before { allow(controller).to receive(:current_user).and_return(owner) }
      it 'destroys the suggestion' 

    end

    context 'when a non-admin user does not own the suggestion' do
      before { allow(controller).to receive(:current_user).and_return(nonowner) }
      it 'return a 401 not authorized' 

    end
  end
end

