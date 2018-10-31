# frozen_string_literal: true

require 'rails_helper'

describe AlertsController do
  describe '#create' do
    let(:course) { create(:course) }
    let!(:user) { create(:user) }
    let(:target_user) { create(:admin, email: 'email@email.com') }
    let!(:courses_users) do
      create(:courses_user, course_id: course.id, user_id: user.id)
    end

    let(:alert_params) do
      { message: 'hello?', target_user_id: target_user.id, course_id: course.id }
    end

    before do
      allow(controller).to receive(:current_user).and_return(user)
      allow(controller).to receive(:user_signed_in?).and_return(true)
      controller.instance_variable_set(:@course, course)
    end

    it 'should create Need Help alert and send email' 


    it 'renders a 500 if alert creation fails' 


    context 'when no target user is provided' do
      let(:alert_params) do
        { message: 'hello?', course_id: course.id }
      end
      it 'still works' 

    end

    context 'when the help button feature is disabled' do
      before do
        allow(Features).to receive(:enable_get_help_button?).and_return(false)
      end

      it 'raises a 400' 

    end
  end

  describe '#resolve' do
    let(:alert) { create(:alert) }
    let(:admin) { create(:admin) }

    before do
      allow(controller).to receive(:current_user).and_return(admin)
    end

    it 'should update Alert resolved column to true' 


    it 'should not update Alert unless its resolvable' 

  end
end

