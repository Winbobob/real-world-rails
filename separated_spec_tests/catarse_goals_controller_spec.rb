# encoding:utf-8
# frozen_string_literal: true

require 'rails_helper'

RSpec.describe GoalsController, type: :controller do
  let(:user) { create(:user) }
  let(:current_user) { user }

  before do
    allow(controller).to receive(:current_user).and_return(current_user)
  end

  describe '#create' do
    let(:project) { create(:project, user_id: current_user.id) }
    let(:goal) { build(:goal, project: project) }

    context 'with valid attributes' do
      it 'creates a new goal' 

    end
  end
end

