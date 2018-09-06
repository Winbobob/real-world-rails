include InstructorInterfaceHelperSpec

def create_course_questionnaire survey_name
  visit '/questionnaires/new?model=Course+SurveyQuestionnaire&private=0'
  fill_in 'questionnaire_name', with: survey_name
  find('input[name="commit"]').click
end

def deploy_course_survey(start_date, end_date, survey_name)
  login_as('instructor6')
  expect(page).to have_content('Manage content')
  create_course_questionnaire survey_name
  survey = Questionnaire.where(name: survey_name)
  instructor = User.where(name: 'instructor6').first
  course = Course.where(instructor_id: instructor.id).first
  visit '/survey_deployment/new?id=' + course.id.to_s + '&type=CourseSurveyDeployment'
  expect(page).to have_content('New Survey Deployment')
  fill_in 'survey_deployment_start_date', with: start_date
  fill_in 'survey_deployment_end_date', with: end_date
  select survey.name, from: "survey_deployment_questionnaire_id"
  find('input[name="commit"]').click
end

describe "Course Survey questionnaire tests for instructor interface" do
  before(:each) do
    course_setup
    @previous_day = (Time.now.getlocal - 1 * 86_400).strftime("%Y-%m-%d %H:%M:%S")
    @next_day = (Time.now.getlocal + 1 * 86_400).strftime("%Y-%m-%d %H:%M:%S")
    @next_to_next_day = (Time.now.getlocal + 2 * 86_400).strftime("%Y-%m-%d %H:%M:%S")
  end

  it "is able to create a Course survey" 


  it "is able to deploy a course survey with valid dates" 


  it "is not able to deploy a course survey with invalid dates" 


  it "is able to add and edit questions to a course survey" 


  it "is able to delete question from a course survey" 


end


