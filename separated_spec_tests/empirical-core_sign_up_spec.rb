require 'rails_helper'

describe 'Sign up', type: :request do

  def sign_up_succeeds
    expect(response.status).to eq(200)
  end

  def sign_up_fails
    expect(response.status).to_not eq(200)
  end

  describe 'Create New Teacher Account' do
    it 'requires unique email' 

  end

  describe 'Create New Student Account (from sign up)' do
    it 'requires unique username' 


    it 'does not require email' 

  end

  # FIXME: below no longer works since profile is now in React
  # describe 'Connect Student account to teacher account via class-code' do
  #   # TODO: should be moved to a feature spec? doing everything short of using capybara API.
  #   #       replace with session stubbing.
  #   it 'allows them to fill in a classcode' do
  #     create(:section)
  #     classroom = create(:classroom)
  #     post '/account', user: user_params(username: 'TestStudent', role: 'student')

  #     put '/profile', user: { classcode: classroom.code }
  #     follow_redirect!

  #     expect(response.body).to include(classroom.name)
  #   end
  # end

  describe 'Create New Student Account (from teacher interface)' do
    let(:classroom)                 { create(:classroom) }
    let(:teacher)                   { classroom.owner }
    let(:student)                   { build(:student) }

    let(:student_first_name)        { student.first_name }
    let(:student_last_name)         { student.last_name }

    let(:expected_student_email)    { "#{student_first_name}.#{student_last_name}@#{classroom.code}".downcase }
    let(:expected_student_password) { student_last_name.titleize }

    before(:each) do
      password = 'password'
      teacher.update(password: password)
      sign_in(teacher.email, teacher.password)
    end

    context "when the teacher enters the student's name correctly" do
      before do
        post teachers_classroom_students_path(classroom), user: {first_name: student_first_name, last_name: student_last_name}
      end

      it 'generates password' 


      it 'generates username' 


      it 'allows student to sign in' 


      it "creates an association between the student and the teacher's classroom" 


    end
  end
end

