# frozen_string_literal: true

require 'rails_helper'

describe UsersController do
  describe '#enroll' do
    let(:course) { create(:course) }
    let(:request_params) do
      { course_id: course.slug, passcode: course.passcode, titleterm: 'foobar' }
    end
    let(:user) { create(:user) }
    let(:admin) { create(:admin) }
    let(:super_admin) { create(:super_admin) }
    let(:another_user) { create(:user, username: 'StudentUser') }

    before do
      allow_any_instance_of(WikiCourseEdits).to receive(:update_course)
      allow_any_instance_of(WikiCourseEdits).to receive(:remove_assignment)
      allow_any_instance_of(WikiCourseEdits).to receive(:update_assignments)
      allow(controller).to receive(:current_user).and_return(user)
      course.campaigns << Campaign.first
      stub_add_user_to_channel_success
    end

    subject { response.status }

    # Users who are not part of the course enroll via SelfEnrollmentController
    context 'POST, when the user is not part of the course' do
      let(:post_params) do
        { id: course.slug,
          user: { user_id: user.id, role: CoursesUsers::Roles::STUDENT_ROLE } }
      end
      before { post 'enroll', params: post_params }
      it 'does not create a CoursesUsers' 

      it 'returns a 401' 

    end

    context 'POST with student role, when enroller is instructor' do
      before do
        create(:courses_user, user_id: user.id,
                              course_id: course.id,
                              role: CoursesUsers::Roles::INSTRUCTOR_ROLE)
      end

      context 'and the enrollee is the same user' do
        let(:post_params) do
          { id: course.slug,
            user: { user_id: user.id, role: CoursesUsers::Roles::STUDENT_ROLE } }
        end
        before do
          post 'enroll', params: post_params
        end
        it 'returns a 404' 

        it 'does not enroll the user' 

      end

      context 'and the enrollee is not in the course yet' do
        let(:post_params) do
          { id: course.slug,
            user: { username: another_user.username, role: CoursesUsers::Roles::STUDENT_ROLE } }
        end
        before do
          expect_any_instance_of(WikiCourseEdits).to receive(:enroll_in_course)
          post 'enroll', params: post_params
        end
        it 'returns a 200' 

        it 'enrolls the user' 

      end
    end

    context 'POST with student role, when the user is an admin' do
      before do
        allow(controller).to receive(:current_user).and_return(admin)
        stub_oauth_edit
      end

      let(:post_params) do
        { id: course.slug,
          user: { user_id: admin.id, role: CoursesUsers::Roles::STUDENT_ROLE }.as_json }
      end
      before do
        post 'enroll', params: post_params
      end
      it 'returns a 200' 

      it 'enrolls the user' 

    end

    context 'POST with Wiki Ed staff role, when the user is an admin' do
      before do
        allow(controller).to receive(:current_user).and_return(admin)
      end

      let(:post_params) do
        { id: course.slug,
          user: { user_id: admin.id, role: CoursesUsers::Roles::WIKI_ED_STAFF_ROLE } }
      end
      before do
        post 'enroll', params: post_params
      end
      it 'returns a 200' 

      it 'enrolls the user' 

    end

    context 'POST with instructor role, when the user is is allowed' do
      let(:staff) { create(:user, username: 'Staffer', email: 'staffer@wikiedu.org') }
      before do
        allow(controller).to receive(:current_user).and_return(admin)
        create(:setting, key: 'special_users', value: { classroom_program_manager: staff.username })
      end

      let(:post_params) do
        { id: course.slug,
          user: { user_id: admin.id, role: CoursesUsers::Roles::INSTRUCTOR_ROLE } }
      end
      before do
        allow(NewInstructorEnrollmentMailer).to receive(:send_staff_alert).and_call_original
        post 'enroll', params: post_params
      end
      it 'returns a 200' 

      it 'sends an email alert' 

    end

    context 'DELETE' do
      let(:delete_params) do
        { id: course.slug,
          user: { user_id: user.id, role: CoursesUsers::Roles::STUDENT_ROLE } }
      end
      before do
        create(:courses_user, user_id: user.id,
                              course_id: course.id,
                              role: CoursesUsers::Roles::STUDENT_ROLE)
        article = create(:article)
        create(:assignment,
               course_id: course.id,
               user_id: user.id,
               article_id: article.id)
        delete 'enroll', params: delete_params
      end
      it 'destroys the courses user' 

      it 'succeeds' 

    end
  end

  describe '#update_locale' do
    let(:user) { create(:user, locale: 'fr') }

    before do
      allow(controller).to receive(:current_user).and_return(user)
    end

    it 'returns a 422 if locale is invalid' 


    it 'updates user locale and returns a 200 if locale is valid' 

  end

  describe '#index' do
    render_views

    context 'when user is NOT admin' do
      let(:user) { create(:user) }

      before { allow(controller).to receive(:current_user).and_return(user) }

      it 'should not authorize' 

    end

    context 'when user IS admin' do
      let(:admin) { create(:admin, email: 'admin@email.com') }

      before do
        allow(controller).to receive(:current_user).and_return(admin)
      end

      let!(:instructor) do
        create(:user, email: 'instructor@school.edu',
                      real_name: 'Sare Goss', username: 'saregoss',
                      permissions: User::Permissions::INSTRUCTOR)
      end

      it 'should list instructors by default' 


      let(:search_user) { create(:user, email: 'findme@example.com', real_name: 'Joe Bloggs') }

      it 'should accept email param and return associated user' 


      it 'should accept real name param and return associated user' 

    end
  end
end

