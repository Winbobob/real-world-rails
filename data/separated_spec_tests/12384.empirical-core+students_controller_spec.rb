require 'rails_helper'

describe StudentsController do
  it { should use_before_filter :authorize! }

  let(:user) { create(:user) }

  before do
    allow(controller).to receive(:current_user) { user }
  end

  describe '#index' do
    let!(:classroom) { create(:classroom) }

    it 'should set the current user and js file' 


    it 'should find the classroom and set flash' 

  end

  describe '#account_settings' do
    it 'should set the current user and js file' 

  end

  describe '#student_demo' do
    context 'when maya angelou exists' do
      let!(:maya) { create(:user, email: 'maya_angelou_demo@quill.org') }

      it 'should sign in maya and redirect to profile' 

    end

    context 'when maya angelou does not exist' do
      it 'should destroy recreate the demo and redirect to student demo' 

    end
  end

  describe '#make_teacher' do
    context 'when params role student' do
      it 'should update the role and email' 

    end

    context 'when params role not student' do
      it 'should set the role as student if given' 

    end
  end
end

