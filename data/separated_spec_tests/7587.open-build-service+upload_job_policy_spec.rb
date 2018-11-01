require 'rails_helper'

RSpec.describe Cloud::User::UploadJobPolicy do
  let(:uploader) { create(:confirmed_user) }
  let(:user) { create(:confirmed_user) }
  let(:admin_user) { create(:admin_user) }
  let(:staff_user) { create(:staff_user) }
  let(:upload_job) { create(:upload_job, user: uploader) }

  subject { Cloud::User::UploadJobPolicy }

  shared_examples_for 'a upload job policy' do
    it 'allows admin users to see any log' 


    it 'allows staff users to see any log' 


    it 'allows users to see their own logs' 


    it 'does not allow users to see logs of other user' 

  end

  permissions :show? do
    it_behaves_like 'a upload job policy'
  end

  permissions :destroy? do
    it_behaves_like 'a upload job policy'
  end
end

