# frozen_string_literal: true
require 'rails_helper'

RSpec.feature 'Course: VirtualClassrooms' do
  describe 'Pagination' do
    subject { page }

    let!(:instance) { create(:instance, :with_virtual_classroom_component_enabled) }

    with_tenant(:instance) do
      let(:course) { create(:course, :with_virtual_classroom_component_enabled) }
      let(:user) { create(:course_manager, course: course).user }
      let!(:virtual_classrooms) do
        create_list(:course_virtual_classroom, 30, course: course)
      end

      before do
        login_as(user, scope: :user)
      end

      it 'lists each virtual_classroom' 


      context 'after clicked second page' do
        before { visit course_virtual_classrooms_path(course, page: '2') }

        it 'lists each virtual_classroom' 

      end
    end
  end
end

