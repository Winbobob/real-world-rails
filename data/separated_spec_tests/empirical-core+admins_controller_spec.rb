require 'rails_helper'

describe AdminsController  do
  it { should use_before_action :admin! }
  it { should use_before_action :set_teacher }
  it { should use_before_action :admin_of_this_teacher! }
  it { should use_before_action :sign_in }

  let(:user) { create(:admin) }
  let!(:teacher) { create(:teacher_with_school) }
  let!(:schools_admins) { create(:schools_admins, school: teacher.reload.school, user: user) }

  before do
    allow(controller).to receive(:current_user) { user }
  end

  describe '#show' do
    before do
      allow(UserAdminSerializer).to receive(:new) { "some json" }
    end

    it 'should render the correct json' 

  end

  describe '#sign_in_classroom_manager' do
    it 'should redirect to teachers classrooms path' 

  end

  describe '#sign_in_progress_reports' do
    it 'should redirect to progress reports standards classrooms path' 

  end

  describe '#sign_in_accounts_path' do
    it 'should redirect to teaches my account path' 

  end
end

