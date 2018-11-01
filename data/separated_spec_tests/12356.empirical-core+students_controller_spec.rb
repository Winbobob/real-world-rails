require 'rails_helper'

describe Teachers::StudentsController, type: :controller do
  describe 'creating a student' do
    let(:classroom) { create(:classroom) }
    let(:teacher) { classroom.owner }

    before do
      session[:user_id] = teacher.id # sign in, is there a better way to do this in test?
    end

    it 'kicks off a background job' 

  end
end

