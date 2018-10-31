# frozen_string_literal: true

require 'rails_helper'

describe UserProfilesController do
  describe '#show' do
    render_views

    context 'when user not found' do
      it 'redirects to the home page' 

    end

    context 'when current_user is same user' do
      let(:user) { create(:user, email: 'fake_email@gmail.com') }

      it 'shows the email id' 

    end

    context 'when current_user is admin' do
      let(:user) { create(:user, email: 'fake_email@gmail.com') }
      let(:admin) { create(:admin) }

      it 'shows the email id' 

    end

    context 'when current_user is not the same user nor an admin' do
      let(:user) { create(:user, email: 'fake_email@gmail.com') }
      let(:unauthorised_user) { create(:user, username: 'unauthorized') }

      it 'does not shows the email id' 

    end

    context 'when user is an instructor' do
      let(:course) { create(:course) }
      let(:user) { create(:user) }
      let!(:courses_user) do
        create(:courses_user, course_id: course.id,
                              user_id: user.id,
                              role: CoursesUsers::Roles::INSTRUCTOR_ROLE)
      end

      it 'displays the profile navbar' 

    end

    context 'when user is a student' do
      let(:course) { create(:course) }
      let(:user) { create(:user) }
      let!(:courses_user) do
        create(:courses_user, course_id: course.id,
                              user_id: user.id,
                              role: CoursesUsers::Roles::STUDENT_ROLE)
      end

      it 'displays the profile navbar' 

    end

    context 'when user has participated in zero courses' do
      let(:course) { create(:course) }
      let(:user) { create(:user) }

      it 'does not display the profile navbar' 

    end
  end

  describe '#update' do
    context 'user profile is of the current user' do
      let(:user) { create(:user) }
      let(:profile) { create(:user_profile, user_id: user.id) }

      before do
        allow(controller).to receive(:current_user).and_return(user)
      end

      it 'updates the bio' 


      it 'updates the location' 


      it 'updates the Institution' 


      it 'updates the Image' 

    end

    context 'user profile is not of the current user' do
      let(:user) { create(:user) }
      let(:profile) { create(:user_profile, user_id: user.id) }

      it 'doesn\'t update the bio' 


      it ' doesn\'t update the location' 


      it 'doesn\'t update the Institution' 


      it 'doesn\'t update the Image' 

    end
  end
end

