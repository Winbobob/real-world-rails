def questionnaire_options(assignment, type, _round = 0)
  questionnaires = Questionnaire.where(['private = 0 or instructor_id = ?', assignment.instructor_id]).order('name')
  options = []
  questionnaires.select {|x| x.type == type }.each do |questionnaire|
    options << [questionnaire.name, questionnaire.id]
  end
  options
end

def get_questionnaire(finder_var = nil)
  if finder_var.nil?
    AssignmentQuestionnaire.find_by(assignment_id: @assignment.id)
  else
    AssignmentQuestionnaire.where(assignment_id: @assignment.id).where(questionnaire_id: get_selected_id(finder_var))
  end
end

def get_selected_id(finder_var)
  if finder_var == "ReviewQuestionnaire2"
    ReviewQuestionnaire.find_by(name: finder_var).id
  elsif finder_var == "AuthorFeedbackQuestionnaire2"
    AuthorFeedbackQuestionnaire.find_by(name: finder_var).id
  elsif finder_var == "TeammateReviewQuestionnaire2"
    TeammateReviewQuestionnaire.find_by(name: finder_var).id
  end
end

def fill_assignment_form
  fill_in 'assignment_form_assignment_name', with: 'edit assignment for test'
  select('Course 2', from: 'assignment_form_assignment_course_id')
  fill_in 'assignment_form_assignment_directory_path', with: 'testDirectory1'
  fill_in 'assignment_form_assignment_spec_location', with: 'testLocation1'
end

describe "assignment function" do
  before(:each) do
    create(:deadline_type, name: "submission")
    create(:deadline_type, name: "review")
    create(:deadline_type, name: "metareview")
    create(:deadline_type, name: "drop_topic")
    create(:deadline_type, name: "signup")
    create(:deadline_type, name: "team_formation")
    create(:deadline_right)
    create(:deadline_right, name: 'Late')
    create(:deadline_right, name: 'OK')
  end

  describe "creation page", js: true do
    before(:each) do
      (1..3).each do |i|
        create(:course, name: "Course #{i}")
      end
    end

    # Might as well test small flags for creation here
    it "is able to create a public assignment" 


    it "is able to create a private assignment" 


    it "is able to create with teams" 

    # instructor can check "has quiz" box and set the number of quiz questions
    it "is able to create with quiz" 


    it "is able to create with staggered deadline" 


    ## should be able to create with review visible to all reviewres
    it "is able to create with review visible to all reviewers" 


    it "is able to create public micro-task assignment" 

    it "is able to create calibrated public assignment" 

    it "is able show tab review strategy" 


    it "is able show tab due deadlines" 

    
    it "set the deadline for an assignment review" 


    it "is able show tab rubrics" 


    it "is able show attributes in rubrics" 


    it "sets attributes for review strategy auto selects" 

  end
  
  # instructor can set in which deadline can student reviewers take the quizzes
  describe "deadlines", js: true do
    before(:each) do
      @assignment = create(:assignment, name: 'public assignment for test')
      login_as("instructor6")
      visit "/assignments/#{@assignment.id}/edit"
      click_link 'Due date'
    end
    # instructor can set deadline for review and taking quiz
    it "set the deadline for an assignment review" 

  end
  # adding test for general tab
  describe "general tab", js: true do
    before(:each) do
      (1..3).each do |i|
        create(:course, name: "Course #{i}")
      end
      create(:assignment, name: 'edit assignment for test')

      assignment = Assignment.where(name: 'edit assignment for test').first
      login_as("instructor6")
      visit "/assignments/#{assignment.id}/edit"
      click_link 'General'
    end

    it "should edit assignment available to students" 


    it "should edit quiz number available to students" 


    it "should edit number of members per team " 


    ##### test reviews visible to all other reviewers ######
    it "should edit review visible to all other reviewers" 


    it "check if checking calibration shows the tab" 

  end

  describe "topics tab", js: true do
    before(:each) do
      (1..3).each do |i|
        create(:course, name: "Course #{i}")
      end
      assignment = create(:assignment, name: 'public assignment for test')
      login_as("instructor6")
      visit "/assignments/#{assignment.id}/edit"
      click_link 'Topics'
    end

    it "can edit topics properties - Check" 


    it "can edit topics properties - unCheck" 


    it "Add new topic" 


    it "Delete existing topic", js: true do
      click_link 'Due date'
      fill_in 'assignment_form_assignment_rounds_of_reviews', with: '1'
      click_button 'set_rounds'
      fill_in 'datetimepicker_submission_round_1', with: (Time.now.in_time_zone + 1.day).strftime("%Y/%m/%d %H:%M")
      fill_in 'datetimepicker_review_round_1', with: (Time.now.in_time_zone + 10.days).strftime("%Y/%m/%d %H:%M")
      click_button 'submit_btn'
      assignment = Assignment.where(name: 'public assignment for test').first
      create(:topic, assignment_id: assignment.id)
      visit "/assignments/#{assignment.id}/edit"
      click_link 'Topics'
      all(:xpath, '//img[@title="Delete Topic"]')[0].click
      click_button 'OK'

      topics_exist = SignUpTopic.where(assignment_id: assignment.id).count
      expect(topics_exist).to be_eql 0
    end
  end

  # Begin rubric tab
  describe "rubrics tab", js: true do
    before(:each) do
      @assignment = create(:assignment)
      create_list(:participant, 3)
      # Create an assignment due date
      create :assignment_due_date, due_at: (DateTime.now.in_time_zone - 1)
      @review_deadline_type = create(:deadline_type, name: "review")
      create :assignment_due_date, due_at: (DateTime.now.in_time_zone + 1), deadline_type: @review_deadline_type
      create(:assignment_node)
      create(:question)
      create(:questionnaire)
      create(:assignment_questionnaire)
      (1..3).each do |i|
        create(:questionnaire, name: "ReviewQuestionnaire#{i}")
        create(:questionnaire, name: "AuthorFeedbackQuestionnaire#{i}", type: 'AuthorFeedbackQuestionnaire')
        create(:questionnaire, name: "TeammateReviewQuestionnaire#{i}", type: 'TeammateReviewQuestionnaire')
      end
      login_as("instructor6")
      visit "/assignments/#{@assignment.id}/edit"
      click_link 'Rubrics'
    end

    # First row of rubric
    describe "Edit review rubric" do
      it "updates review questionnaire" 


      it "should update scored question dropdown" 


      # Second row of rubric
      it "updates author feedback questionnaire" 


      ##
      # Third row of rubric
      it "updates teammate review questionnaire" 

    end
  end

  # Begin review strategy tab
  describe "review strategy tab", js: true do
    before(:each) do
      create(:assignment, name: 'public assignment for test')
      @assignment_id = Assignment.where(name: 'public assignment for test').first.id
    end

    it "auto selects" 


    # instructor assign reviews will happen only one time, so the data will not be store in DB.
    it "sets number of reviews by each student" 

  end

  # Begin participant testing
  describe "participants", js: true do
    before(:each) do
      create(:course)
      create(:assignment, name: 'participants Assignment')
      create(:assignment_node)
    end

    it "check to see if participants can be added" 


    it "should display newly created assignment" 

  end
  # Begin Due Date tab
  describe "Due dates tab", js: true do
    before(:each) do
      @assignment = create(:assignment, name: 'public assignment for test')
      login_as("instructor6")
      visit "/assignments/#{@assignment.id}/edit"
      click_link 'Due date'
    end

    xit "Able to create a new penalty policy" do # This case doesn't work in expertiza yet, i.e. not able to create new late policy.
      find_link('New late policy').click
      fill_in 'late_policy_policy_name', with: 'testlatepolicy'
      fill_in 'policy_penalty_per_unit', with: 'testlatepolicypenalty'
      fill_in 'late_policy_max_penalty', with: 2
      click_button 'Create'
    end

    # able to set deadlines for a single round of reviews
    it "set the deadline for an assignment review" 

  end

  it "check to find if the assignment can be added to a course", js: true do
    create(:assignment, course: nil, name: 'Test Assignment')
    create(:course, name: 'Test Course')

    course_id = Course.where(name: 'test Course')[0].id

    assignment_id = Assignment.where(name: 'Test Assignment')[0].id

    login_as('instructor6')
    visit "/assignments/associate_assignment_with_course?id=#{assignment_id}"

    choose "course_id_#{course_id}"
    click_button 'Save'

    assignment_row = Assignment.where(name: 'Test Assignment')[0]
    expect(assignment_row).to have_attributes(
      course_id: course_id
    )
  end
end

