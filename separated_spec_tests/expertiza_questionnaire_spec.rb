include InstructorInterfaceHelperSpec

question_type = %w[Criterion Scale Dropdown Checkbox TextArea TextField UploadFile SectionHeader TableHeader ColumnHeader]

describe "Questionnaire tests for instructor interface" do
  before(:each) do
    assignment_setup
  end
  describe "Instructor login" do
    it "with valid username and password" 


    it "with invalid username and password" 

  end

  def make_questionnaire private
    login_as("instructor6")
    visit '/questionnaires/new?model=ReviewQuestionnaire&private=' + (private ? '1' : '0')
    fill_in('questionnaire_name', with: 'Review 1')
    fill_in('questionnaire_min_question_score', with: '0')
    fill_in('questionnaire_max_question_score', with: '5')
    select(private ? 'yes' : 'no', from: 'questionnaire_private')
    click_button "Create"
  end

  describe "Create a public review questionnaire" do
    it "is able to create a public review questionnaire" 

  end

  describe "Create a private review questionnaire" do
    it "is able to create a private review questionnaire" 

  end

  def load_questionnaire
    login_as("instructor6")
    visit '/questionnaires/new?model=ReviewQuestionnaire&private=0'
    fill_in('questionnaire_name', with: 'Review n')
    fill_in('questionnaire_min_question_score', with: '0')
    fill_in('questionnaire_max_question_score', with: '5')
    select('no', from: 'questionnaire_private')
    click_button "Create"
  end

  def load_question question_type
    load_questionnaire
    fill_in('question_total_num', with: '1')
    select(question_type, from: 'question_type')
    click_button "Add"
  end

  describe "Create a review question" do
    question_type.each do |q_type|
      it "is able to create " + q_type + " question" 

    end
  end

  def edit_created_question
    first("textarea[placeholder='Edit question content here']").set "Question edit"
    click_button "Save review questionnaire"
    expect(page).to have_content('All questions has been successfully saved!')
    expect(page).to have_content('Question edit')
  end

  def check_deleted_question
    click_on('Remove')
    expect(page).to have_content('You have successfully deleted the question!')
  end

  def choose_check_type command_type
    if command_type == 'edit'
      edit_created_question
    else
      check_deleted_question
    end
  end

  describe "Edit and delete a question" do
    question_type.each do |q_type|
      %w[edit delete].each do |q_command|
        it "is able to " + q_command + " " + q_type + " question" 

      end
    end
  end

  describe "Edit a review advice" do
    it "is able to edit a public review advice" 

  end
end

