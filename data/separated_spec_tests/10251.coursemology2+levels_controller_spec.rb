# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Course::LevelsController, type: :controller do
  let!(:instance) { Instance.default }

  with_tenant(:instance) do
    let!(:user) { create(:administrator) }
    let!(:normal_user) { create(:user) }
    let!(:course) { create(:course) }

    describe '#create' do
      context 'when user is allowed to edit levels' do
        before { sign_in(user) }

        it 'is expected to create new levels' 

      end

      context 'when user cannot change levels' do
        before { sign_in(normal_user) }

        it 'is expected to deny access' 

      end
    end
  end
end

