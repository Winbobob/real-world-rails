require 'rails_helper'

describe CoteacherClassroomInvitationsController, type: :controller do
  let(:teacher) { create(:teacher_with_a_couple_classrooms_with_one_student_each) }
  let(:invite_one) { create(:coteacher_classroom_invitation, classroom_id: teacher.classrooms_i_own.first.id) }
  let!(:pending_invitation) { invite_one.invitation }
  let(:invite_two) { create(:coteacher_classroom_invitation, classroom_id: teacher.classrooms_i_own.second.id, invitation_id: pending_invitation.id) }
  let(:invited_teacher) { User.find_by_email(pending_invitation.invitee_email) }
  let(:unaffiliated_teacher) { create(:teacher) }

  describe '#accept_pending_coteacher_invitations' do
    context 'user is signed in' do
      before do
        session[:user_id] = invited_teacher.id
      end

      context 'get' do
        it 'should accept one invitation' 


        it 'should accept multiple invitations' 

      end

      context 'post' do
        it 'should accept one invitation' 


        it 'should accept multiple invitations' 

      end
    end

    context 'user is not signed in' do
      it 'should redirect to the login page' 

    end

    context 'user does not have access' do
      it 'should redirect to the login page' 

    end
  end

  describe '#reject_pending_coteacher_invitations' do
    context 'user is signed in' do
      before do
        session[:user_id] = invited_teacher.id
      end

      context 'get' do
        it 'should reject one invitation' 


        it 'should reject multiple invitations' 

      end

      context 'post' do
        it 'should reject one invitation' 


        it 'should reject multiple invitations' 

      end
    end

    context 'user is not signed in' do
      it 'should redirect to the login page' 

    end

    context 'user does not have access' do
      it 'should redirect to the login page' 

    end
  end
end

