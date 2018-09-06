include InstructorInterfaceHelperSpec

def create_assignment_due_date
  set_deadline_type
  set_deadline_right
  create :assignment_due_date, due_at: (DateTime.now.in_time_zone + 1.day)
  @review_deadline_type = create(:deadline_type, name: "review")
  create :assignment_due_date, due_at: (DateTime.now.in_time_zone + 1.day), deadline_type: @review_deadline_type
end

def create_default_test_data num_qs
  @instructor = create(:instructor)
  @student = create(:student)
  @assignment = create :assignment, require_quiz: true, instructor: @instructor, course: nil, num_quiz_questions: num_qs
  create_assignment_due_date
  @team = create :assignment_team, assignment: @assignment
  @participant = create :participant, assignment: @assignment, user: @student
  create :team_user, team: @team, user: @student
  create :review_response_map, assignment: @assignment, reviewee: @team
end

def login_and_create_quiz
  login_as @student.name
  click_link @assignment.name
  click_link 'Your work'
  click_link 'Create a quiz'
end

def fill_in_choices
  fill_in 'new_choices_1_MultipleChoiceRadio_1_txt', with: 'Test Quiz 1'
  fill_in 'new_choices_1_MultipleChoiceRadio_2_txt', with: 'Test Quiz 2'
  fill_in 'new_choices_1_MultipleChoiceRadio_3_txt', with: 'Test Quiz 3'
  fill_in 'new_choices_1_MultipleChoiceRadio_4_txt', with: 'Test Quiz 4'
end

def create_choices
  [
    create(:quiz_question_choice, question: @question, txt: 'Answer 1', iscorrect: 1),
    create(:quiz_question_choice, question: @question, txt: 'Answer 2'),
    create(:quiz_question_choice, question: @question, txt: 'Answer 3'),
    create(:quiz_question_choice, question: @question, txt: 'Answer 4')
  ]
end

def fill_in_quiz
  fill_in 'questionnaire_name', with: 'Quiz for test'
  fill_in 'text_area', with: 'Test Question 1'
  page.choose('question_type_1_type_multiplechoiceradio')
  fill_in_choices
  page.choose('new_choices_1_MultipleChoiceRadio_1_iscorrect_1')
  click_on 'Create Quiz'
end

describe 'Student can create quizzes and edit them', js: true do
  before(:each) do
    create_default_test_data 1
  end

  it 'should be able to create quiz' 


  it 'should be able to view quiz after create one' 


  it 'should be able to edit quiz after create one' 


  it 'should have error message if the name of the quiz is missing' 


  it 'should have error message if The question text is missing for one or more questions' 


  it 'should have error message if the choices are missing for one or more questions' 


  it 'should have error message if the correct answer(s) have not been provided' 

end

describe 'multiple quiz question test', js: true do
  before(:each) do
    create_default_test_data 3
  end

  it 'number of questions set matches number of quiz questions avaliable' 

end

describe 'appropriate quiz taking times', js: true do
  before(:each) do
    @instructor = create(:instructor)
    @assignment = create :assignment, require_quiz: true, instructor: @instructor, course: nil, num_quiz_questions: 1, review_topic_threshold: 1
    create_assignment_due_date
    @student1 = create(:student)
    @participant1 = create :participant, assignment: @assignment, user: @student1
    @team1 = create :assignment_team, assignment: @assignment
    create :team_user, team: @team1, user: @student1
    create :review_response_map, assignment: @assignment, reviewee: @team1
    @questionnaire = create :quiz_questionnaire, instructor_id: @team1.id
    choices = create_choices
    @question = create :quiz_question, questionnaire: @questionnaire, txt: 'Question 1', quiz_question_choices: choices
    @student2 = create(:student)
    # Create participant mapping
    @participant2 = create :participant, assignment: @assignment, user: @student2
    # Create a team linked to the calibrated assignment
    @team2 = create :assignment_team, assignment: @assignment
  end

  # [S3] - Students may not take quizzes on a phase that does not allow them to do so. When on a stage that does allow
  # for quizzes, they may take quizzes on work that they have reviewed.
  it 'should not be able to take quiz before doing review' 


  it 'should be able to take quiz after doing review' 

end

def create_student1
  @student1 = create(:student)
  @participant1 = create :participant, assignment: @assignment, user: @student1
end

def create_student2
  @student2 = create(:student)
  @participant2 = create :participant, assignment: @assignment, user: @student2
end

def make_team
  @team1 = create :assignment_team, assignment: @assignment
  create :team_user, team: @team1, user: @student1
  create :review_response_map, assignment: @assignment, reviewee: @team1
end

def setup_questionnaire
  @questionnaire = create :quiz_questionnaire, instructor_id: @team1.id
  choices = create_choices
  @question = create :quiz_question, questionnaire: @questionnaire, txt: 'Question 1', quiz_question_choices: choices
end

def setup_responses
  @response_map = create :quiz_response_map, quiz_questionnaire: @questionnaire, reviewer: @participant2, reviewee_id: @team1.id
  @response = create :quiz_response, response_map: @response_map
  create :answer, question: @question, response_id: @response.id, answer: 1
end

def init_instructor_tests
  @instructor = create(:instructor)
  @assignment = create :assignment, require_quiz: true, instructor: @instructor, course: nil, num_quiz_questions: 1
  create_assignment_due_date
  create_student1
  make_team
  setup_questionnaire
  create_student2
  setup_responses
end

# Tests regarding the instructor's ability to interact with quizzes.
describe 'Instructor', js: true do
  # Setup for testing by creating the following
  #   An instructor
  #   An assignment with a 1 question quiz and a valid deadline
  #   A student, with a valid team in the assignment, that has created a quiz
  #   A second student, also in the assignment, that has completed the quiz.
  before :each do
    init_instructor_tests
  end
  # Verify that an instructor can see all quiz questions,
  # answers, and scores on the review questions page.
  it 'can view quiz questions and scores' 

end

# Tests student reviewers can take the quizzes on the work they have reviewed/they need to review
describe 'Student reviewers can not take the quizzes before request artifact', js: true do
  before :each do
    @instructor = create(:instructor)
    @assignment = create :assignment, require_quiz: true, instructor: @instructor, course: nil, num_quiz_questions: 1
    create_assignment_due_date
    create_student1
    make_team
    setup_questionnaire
    create_student2
  end

  it 'can not take quiz' 

end

describe 'Student reviewers can take the quizzes', js: true do
  before :each do
    @instructor = create(:instructor)
    @assignment = create :assignment, require_quiz: true, instructor: @instructor, course: nil, num_quiz_questions: 1
    create_assignment_due_date
    create_student1
    make_team
    setup_questionnaire
    create_student2
    @response_map = create :quiz_response_map, quiz_questionnaire: @questionnaire, reviewer: @participant2, reviewee_id: @team1.id
  end

  it 'can take quiz' 

end

describe 'Student reviewers can view the quizzes they take', js: true do
  before :each do
    init_instructor_tests
  end

  it 'can view quiz' 

end

