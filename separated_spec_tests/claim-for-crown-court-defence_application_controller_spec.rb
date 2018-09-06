require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
  let(:super_admin) { create(:super_admin) }
  let(:advocate) { create(:external_user, :advocate) }
  let(:advocate_admin) { create(:external_user, :admin) }
  let(:case_worker) { create(:case_worker) }
  let(:case_worker_admin) { create(:case_worker, :admin) }

  describe '#after_sign_in_path_for' do
    context 'given a super admin' do
      before { sign_in super_admin.user }

      it 'returns super admins root url' 

    end

    context 'given an advocate' do
      before { sign_in advocate.user }

      it 'returns advocates root url ' 

    end

    context 'given a case worker' do
      before { sign_in case_worker.user }

      it 'returns case workers root url ' 

    end

    context 'given an admin advocate' do
      before { sign_in advocate_admin.user }

      it 'returns advocates admin root url ' 

    end

    context 'given an admin case worker' do
      before { sign_in case_worker_admin.user }

      it 'returns case workers root url ' 

    end

    context 'given a user with a different role' do
      before { user = build(:user); sign_in user }

      it 'raises error' 

    end
  end

  describe '#after_sign_out_path_for' do
    before do
      sign_in user
      sign_out user
    end

    context 'given a super admin' do
      let(:user) { super_admin.user }

      it 'returns super admins root url' 

    end

    context 'given an advocate' do
      let(:user) { advocate.user }

      it 'returns advocates root url ' 

    end

    context 'given a case worker' do
      let(:user) { case_worker.user }

      it 'returns case workers root url ' 

    end

    context 'given an admin advocate' do
      let(:user) { advocate_admin.user }

      it 'returns advocates admin root url ' 

    end

    context 'given an admin case worker' do
      let(:user) { case_worker_admin.user }

      it 'returns case workers root url ' 

    end
  end

  describe '#signed_in_user_profile_path' do
    context 'given a super admin' do
      before { sign_in super_admin.user }
      it 'returns super admins user_profile_path' 

    end

    context 'given an advocate' do
      before { sign_in advocate.user }
      it 'returns advocate user profile path' 

    end
    
    context 'given a case_worker' do
      before { sign_in case_worker.user }
      it 'returns caseworker Profile path' 

    end

    context 'given a user with a different role' do
      before { user = build(:user); sign_in user }

      it 'raises error' 

    end


  end

  context 'Exceptions handling' do
    controller do
      skip_load_and_authorize_resource
      def record_not_found; raise ActiveRecord::RecordNotFound; end
      def another_exception; raise Exception; end
    end

    before do
      allow(Rails).to receive(:env).and_return('production'.inquiry)
      request.env['HTTPS'] = 'on'
    end

    context 'ActiveRecord::RecordNotFound' do
      it 'should not report the exception, and redirect to the 404 error page' 

    end

    context 'Other exceptions' do
      it 'should report the exception, and redirect to the 500 error page' 

    end
  end

  context 'force_ssl when in production' do
    controller do
      def test_endpoint; end
    end

    before do
      allow(Rails).to receive(:env).and_return('production'.inquiry)
    end

    it 'should redirect to https' 

  end
end

