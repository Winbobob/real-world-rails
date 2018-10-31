# frozen_string_literal: true
require 'rails_helper'

RSpec.describe System::Admin::Instance::CoursesController, type: :controller do
  let(:instance) { Instance.default }

  with_tenant(:instance) do
    let(:instance_admin) { create(:instance_administrator).user }
    let(:normal_user) { create(:user) }

    describe '#index' do
      subject { get :index }

      context 'when an administrator visits the page' do
        before { sign_in(instance_admin) }

        it 'renders the template' 

      end

      context 'when a normal user visits the page' do
        before { sign_in(normal_user) }

        it 'raises an error' 

      end
    end

    describe '#destroy' do
      let!(:course_to_delete) { create(:course) }
      let!(:course_stub) do
        stub = create(:course)
        allow(stub).to receive(:destroy).and_return(false)
        stub
      end

      subject { delete :destroy, params: { id: course_to_delete } }

      context 'when the user is an administrator' do
        before { sign_in(instance_admin) }

        it 'destroys the course' 


        it { is_expected.to redirect_to(admin_instance_courses_path) }

        it 'sets the proper flash message' 


        context 'when the course cannot be destroyed' do
          before do
            controller.instance_variable_set(:@course, course_stub)
            subject
          end

          it { is_expected.to redirect_to(admin_instance_courses_path) }

          it 'sets an error flash message' 

        end
      end

      context 'when the user is a normal user' do
        before { sign_in(normal_user) }

        it 'raises an error' 

      end
    end
  end
end

