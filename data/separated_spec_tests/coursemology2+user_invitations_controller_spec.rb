# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Course::UserInvitationsController, type: :controller do
  let(:instance) { Instance.default }
  with_tenant(:instance) do
    let(:user) { create(:user) }
    let(:course) { create(:course, :enrollable) }
    let(:erroneous_course) do
      create(:course, :enrollable).tap do |course|
        user = create(:user)
        course.course_users.build(user: user).save
        course.course_users.build(user: user)

        course.invitations.build(name: generate(:name), email: 'fdgsdf@no')
        course.save
      end
    end

    def replace_with_erroneous_course
      course = erroneous_course
      controller.define_singleton_method(:current_course) do
        course
      end
    end

    describe '#create' do
      before { sign_in(user) }
      let(:invite_params) do
        invitation = { name: generate(:name), email: generate(:email) }
        invitations = { generate(:nested_attribute_new_id) => invitation }
        { invitations_attributes: invitations }
      end

      subject { post :create, params: { course_id: course, course: invite_params } }

      context 'when a course manager visits the page' do
        let!(:course_lecturer) { create(:course_manager, course: course, user: user) }

        it { is_expected.to redirect_to(course_user_invitations_path(course)) }

        context 'when no users are manually specified for invitations' do
          subject { post :create, params: { course_id: course } }

          it 'redirects to the invitations path without an error' 

        end

        context 'when the invitations do not get created successfully' do
          before do
            stubbed_invitation_service = Course::UserInvitationService.new(user, course)
            stubbed_invitation_service.define_singleton_method(:invite) do |*|
              false
            end
            expect(controller).to receive(:invitation_service).
              and_return(stubbed_invitation_service)
          end

          it { is_expected.to render_template(:new) }
        end

        context 'when an invalid CSV is uploaded' do
          let(:invite_params) do
            { invitations_file: fixture_file_upload('course/invitation_invalid.csv') }
          end

          it { is_expected.to render_template(:new) }
          it 'sets the course errors property' 

        end
      end

      context 'when a student visits the page' do
        let!(:course_student) { create(:course_student, course: course, user: user) }
        it { expect { subject }.to raise_exception(CanCan::AccessDenied) }
      end

      context 'when a user is not registered in the course' do
        it { expect { subject }.to raise_exception(CanCan::AccessDenied) }
      end
    end

    describe '#propagate_errors' do
      subject do
        controller.define_singleton_method(:course_user_invitation_params) do
          { invitations_file: Struct.new(:tempfile).new(Tempfile.new('spec')) }
        end
        controller.send(:propagate_errors)
        controller
      end

      context 'when the uploaded file has an error' do
        it 'propagates the errors to the invitation file' 

      end
    end

    describe '#aggregate_errors' do
      let!(:course_lecturer) { create(:course_manager, course: course, user: user) }
      before { sign_in(user) }

      subject { post :create, params: { course_id: course, course: invite_params } }

      context 'when the CSV has invalid emails' do
        let(:invite_params) do
          { invitations_file: fixture_file_upload('course/invitation_invalid_email.csv') }
        end

        it 'propogates the course errors accurately' 

      end
    end

    describe '#resend_invitation' do
      before do
        create(:course_manager, course: course, user: user)
        sign_in(user)
      end
      let!(:invitation) { create(:course_user_invitation, course: course) }
      subject { post :resend_invitations, params: { course_id: course, user_invitation_id: invitation.id } }

      it 'loads the invitation' 


      context 'if the provided invitation has already been confirmed' do
        before { invitation.confirm!(confirmer: user) }
        it 'will not load the invitation' 

      end
    end

    describe '#resend_invitations' do
      before do
        create(:course_manager, course: course, user: user)
        sign_in(user)
      end
      let!(:pending_invitations) { create_list(:course_user_invitation, 3, course: course) }
      subject { post :resend_invitations, params: { course_id: course } }

      it 'loads the all unconfirmed invitations' 

    end

    describe '#toggle_registration' do
      before { sign_in(user) }
      subject do
        post :toggle_registration, params: { course_id: course, course: { registration_key: param } }
      end

      context 'when the course_lecturer visits the page' do
        let!(:course_lecturer) { create(:course_manager, course: course, user: user) }

        context 'when registration key is requested to be enabled' do
          let(:param) { 'checked' }

          it do
            is_expected.
              to redirect_to invite_course_users_path(course, anchor: 'registration_code')
          end

          context 'when course has registration key disabled' do
            it 'enables the course registration key' 

          end

          context 'when course has registration key enabled' do
            before do
              course.generate_registration_key
              course.save
            end

            it 'does not change the course registration key' 

          end
        end

        context 'when registration key is requested to be disabled' do
          let(:param) { '' }

          context 'when course has registration key enabled' do
            before do
              course.generate_registration_key
              course.save
            end

            it 'disables the course registration key' 

          end
        end
      end
    end
  end
end

