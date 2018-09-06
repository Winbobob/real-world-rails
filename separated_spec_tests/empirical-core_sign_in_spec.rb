require 'rails_helper'

describe 'Sign in', type: :request do
  before do
    User.create(email: 'student@quill.org',
                name: 'John Smith',
                username: 'student1',
                password: '12345',
                password_confirmation: '12345',
                role: 'student')
  end

  describe 'POST /session' do
    it 'creates with valid attributes' 


    it 'does not create with invalid attributes' 

  end
end

