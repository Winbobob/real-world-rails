# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Course::Controller, type: :controller do
  controller(Course::Controller) do
    def show
      render body: ''
    end

    def publicly_accessible?
      true
    end
  end

  let(:instance) { Instance.default }
  with_tenant(:instance) do
    let(:admin) { create(:administrator) }
    let(:user) { admin }
    let(:course) { create(:course, :published) }
    before { sign_in(user) if user }

    describe '#current_course' do
      it 'returns the current course' 

    end

    describe '#current_course_user' do
      context 'when there is no user logged in' do
        let(:user) { nil }
        subject { get :show, params: { id: course.id } }
        it 'raises an error' 

      end

      context 'when the user is logged in' do
        context 'when the user is not registered in the course' do
          it 'returns nil' 

        end

        context 'when the user is registered in the course' do
          let!(:course_user) { create(:course_user, course: course, user: user) }
          it 'returns the correct user' 

        end
      end
    end

    describe '#current_component_host' do
      it 'returns the component host of current course' 

    end

    describe '#sidebar_items' do
      before { controller.instance_variable_set(:@course, course) }

      it 'orders the sidebar items by ascending weight' 


      it 'orders sidebar items with the same weight by ascending key' 


      context 'when no type is specified' do
        it 'returns all sidebar items' 

      end

      context 'when a type is specified' do
        it 'returns only that type' 

      end
    end
  end
end

