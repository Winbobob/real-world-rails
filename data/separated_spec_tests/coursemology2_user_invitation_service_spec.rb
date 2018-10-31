# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Course::UserInvitationService, type: :service do
  let(:instance) { create(:instance) }
  with_tenant(:instance) do
    def temp_csv_from_attributes(records, roles = [])
      Tempfile.new(File.basename(__FILE__, '.*')).tap do |file|
        file.write(CSV.generate do |csv|
          csv << [:name, :email, :role]
          records.zip(roles).each do |user, role|
            csv << (role.blank? ? [user.name, user.email] : [user.name, user.email, role, false])
          end
        end)
        file.rewind
      end
    end

    let(:course) { create(:course) }
    let(:user) { create(:user) }
    let(:stubbed_user_invitation_service) do
      Course::UserInvitationService.new(user, course).tap do |result|
        result.define_singleton_method(:invite_users) do |users|
          users
        end
      end
    end
    subject { Course::UserInvitationService.new(user, course) }

    let(:existing_roles) { Course::UserInvitation.roles.keys.sample(3) }
    let(:existing_users) do
      (1..3).map do
        create(:instance_user).user
      end
    end
    let(:existing_user_attributes) do
      existing_users.each_with_index.map do |user, id|
        { name: user.name, email: user.email, phantom: false,
          role: Course::UserInvitation.roles[existing_roles[id]] }
      end
    end
    let(:new_roles) { Course::UserInvitation.roles.keys.sample(3) }
    let(:new_users) do
      (1..3).map do
        build(:user)
      end
    end
    let(:new_user_attributes) do
      new_users.each_with_index.map do |user, id|
        { name: user.name, email: user.email, phantom: false,
          role: Course::UserInvitation.roles[new_roles[id]] }
      end
    end
    let(:invalid_user_attributes) do
      []
    end
    let(:users) { existing_users + new_users }
    let(:roles) { existing_roles + new_roles }
    let(:user_attributes) { existing_user_attributes + new_user_attributes + invalid_user_attributes }
    let(:user_form_attributes) do
      user_attributes.map do |hash|
        [generate(:nested_attribute_new_id), {
          name: hash[:name],
          email: hash[:email],
          role: hash[:role],
          phantom: hash[:phantom]
        }]
      end.to_h
    end

    describe '#invite' do
      def verify_existing_user(user)
        created_course_user = course.course_users.find do |course_user|
          course_user&.user&.email == user.email
        end
        expect(created_course_user).not_to be_nil
        expect(created_course_user.name).to eq(user.name)
      end

      def verify_users
        existing_users.each(&method(:verify_existing_user))
      end

      def invite
        subject.invite(user_form_attributes)
      end

      context 'when a list of invitation form attributes are provided' do
        it 'registers everyone' 


        with_active_job_queue_adapter(:test) do
          it 'sends an email to everyone' 

        end
      end

      context 'when a CSV file with a header is uploaded' do
        it 'accepts a CSV file with a header' 


        with_active_job_queue_adapter(:test) do
          it 'sends an email to everyone' 

        end
      end

      context 'when the user is already in the course or already invited' do
        let(:users_in_course) { [existing_users.sample] }
        let(:users_invited) { [new_users.sample] }
        before do
          users_in_course.each { |user| create(:course_student, course: course, user: user) }
          users_invited.each { |user| create(:course_user_invitation, course: course, email: user.email) }
        end

        it 'succeeds' 


        with_active_job_queue_adapter(:test) do
          it 'does not send notification to the exiting users' 

        end
      end

      context 'when duplicate users are specified' do
        before do
          new_users.push(new_users.last)
        end

        it 'fails' 


        it 'does not send any notifications' 


        it 'sets the proper errors' 

      end

      context 'when an invalid email is specified' do
        let(:invalid_user_attributes) do
          [{ name: build(:user).name, email: 'xxnot an email', role: :student }]
        end

        it 'fails' 


        it 'does not send any notifications' 


        it 'sets the proper errors' 

      end
    end

    describe '#resend_invitation' do
      let(:previous_sent_time) { 1.day.ago }
      let(:pending_invitations) do
        create_list(:course_user_invitation, 3, course: course, sent_at: previous_sent_time)
      end

      with_active_job_queue_adapter(:test) do
        it 'sends an email to everyone' 

      end

      it 'updates the sent_at field in each invitation' 


      it 'returns true if there are no errors' 

    end

    describe '#parse_from_file' do
      subject { stubbed_user_invitation_service }
      let(:temp_csv) { temp_csv_from_attributes(users, roles) }
      after { temp_csv.close! }

      it 'accepts a file with name/header' 


      it 'calls #invite_users with appropriate user attributes' 


      context 'when the provided file is invalid' do
        it 'raises an exception' 

      end

      context 'when the provided file is encoded with UTF-8 with byte order marks' do
        let(:csv_file) { file_fixture('course/invitation_with_utf_bom.csv') }

        it 'removes the unnecessary characters' 

      end

      context 'when the provided file has no roles' do
        let(:temp_csv_without_role) { temp_csv_from_attributes(users) }
        after { temp_csv_without_role.close! }

        it 'defaults the role to student' 

      end

      context 'when the provided file has whitespace in the fields' do
        let(:csv_file) { file_fixture('course/invitation_whitespace.csv') }

        it 'strips the attributes of whitespace' 

      end

      context 'when the csv file has slightly invalid role and/or phantom specifications' do
        subject do
          stubbed_user_invitation_service.
            send(:parse_from_file, file_fixture('course/invitation_fuzzy_roles_and_phantom.csv'))
        end

        it 'defaults blank role column to student' 


        it 'defaults blank phantom to false' 


        it 'parses roles correctly anyway' 


        it 'parses phantom columns correctly anyway' 

      end

      context 'when the provided csv file has blanks' do
        subject do
          stubbed_user_invitation_service.
            send(:parse_from_file, file_fixture('course/invitation_empty.csv'))
        end

        it 'does not raise an exception' 


        it 'ignores blank entries and invites users with both name and emails or emails only' 

      end

      context 'when the provided csv file has no header' do
        subject do
          stubbed_user_invitation_service.
            send(:parse_from_file, file_fixture('course/invitation_no_header.csv'))
        end

        it 'does not raise an exception' 


        it 'invites all users including the first row' 

      end
    end

    describe '#parse_from_form' do
      subject { stubbed_user_invitation_service }

      it 'accepts a list of invitation form attributes' 


      it 'calls #invite_users with appropriate user attributes' 


      context 'when the name is blank' do
        let(:attributes_without_name) do
          user_form_attributes.map do |k, v|
            [k, v.except(:name)]
          end.to_h
        end

        it 'sets the email as the name' 

      end
    end

    describe '#invite_users' do
      context 'when users already exist in the current instance' do
        it 'immediately adds users' 


        context 'when provided emails are capitalised' do
          let(:modified_existing_users) do
            existing_users.each { |user| user.email = user.email.upcase }
          end

          it 'adds the correct users' 

        end
      end

      context 'when users do not exist in the current instance' do
        it 'sends the invitations' 

      end

      context 'when no roles are specified' do
        let(:all_users) { existing_users + new_users }

        it 'defaults to :student for roles' 

      end
    end

    describe '#augment_user_objects' do
      context 'when the user exists in the instance' do
        it 'adds the User object' 

      end

      context 'when the user does not exist in the instance' do
        it 'sets the user as nil' 

      end
    end

    describe '#find_existing_users' do
      it 'returns a hash' 


      context 'when the user already exists' do
        let(:user) { create(:user, emails_count: 2) }
        let(:user_non_primary_email) { user.emails.find { |email| email.email != user.email } }

        it "associates a user's email address" 

      end

      context 'when the user does not exist' do
        let!(:user) { create(:user) }

        it 'does not define the key' 

      end
    end

    describe '#invite_new_users' do
      let(:invitation_params) do
        new_user_attributes
      end

      it 'adds an invitation to the user' 

    end
  end
end

