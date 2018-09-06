describe "Airbrake expection errors" do
  before(:each) do
    create(:assignment, name: "TestAssignment", directory_path: 'test_assignment')
    create_list(:participant, 3)
    create(:assignment_node)
    create(:deadline_type, name: "submission")
    create(:deadline_type, name: "review")
    create(:deadline_type, name: "metareview")
    create(:deadline_type, name: "drop_topic")
    create(:deadline_type, name: "signup")
    create(:deadline_type, name: "team_formation")
    create(:deadline_right)
    create(:deadline_right, name: 'Late')
    create(:deadline_right, name: 'OK')
    create(:assignment_due_date, due_at: (DateTime.now.in_time_zone.in_time_zone + 1))
    create(:assignment_due_date, deadline_type: DeadlineType.where(name: 'review').first, due_at: (DateTime.now.in_time_zone.in_time_zone + 5))
    create(:topic)
    create(:topic, topic_name: "TestReview")
    create(:team_user, user: User.where(role_id: 2).first)
    create(:team_user, user: User.where(role_id: 2).second)
    create(:assignment_team)
    create(:team_user, user: User.where(role_id: 2).third, team: AssignmentTeam.second)
    create(:signed_up_team)
    create(:signed_up_team, team_id: 2, topic: SignUpTopic.second)
    create(:assignment_questionnaire)
    create(:question)
  end

  # Airbrake-1806782678925052472
  it "can list sign_up_topics by using 'id' (participant_id) as parameter" 


  # Airbrake-1780737855340413304
  it "will redirect to submitted_content#view page if trying to save quiz but w/o questions" 


  # Airbrake-1800240536513675372
  it "can delete topics in staggered deadline assignment", js: true do
    assignment = Assignment.first
    assignment.update_attributes(staggered_deadline: true)
    login_as 'instructor6'
    visit "/assignments/#{assignment.id}/edit"
    check("assignment_form_assignment_staggered_deadline")
    click_button 'Save'

    find_link('Topics').click
    # Delete first topic
    first("img[title='Delete Topic']").click
    # page.execute_script 'window.confirm = function () { return true }'
    click_button 'OK'
    find_link('Topics').click
    expect(page).to have_content('TestReview')
    expect(page).not_to have_content('Hello world!')
  end

  # Airbrake-1608029321738848168
  it "will not show error when instructor did not login and try to access assignment editting page" 


  # Airbrake-1817691804353957801
  it 'will not raise error when saving questionnaire w/o question' 

end

describe "airbrake-1517247902792549741" do
  it "cannot access to '/tree_display/list' if not login" 


  it "can access to '/tree_display/list' after login as an admin/instructor/TA", js: true do
    create(:instructor)
    login_as 'instructor6'
    visit '/tree_display/list'
    expect(page).to have_current_path('/tree_display/list')
    expect(page).to have_content('Manage content')
    expect(page).to have_content('Courses')
    expect(page).to have_content('Assignments')
    expect(page).to have_content('Questionnaires')
    expect(page).not_to have_content('Welcome!')
    expect(page).not_to have_content('User Name')
    expect(page).not_to have_content('Password')
  end

  it "can access to '/student_task/list' after login as a student" 

end

describe "airbrake-1804043391875943089" do
  it "can access team creation page even if the session[:team_type] is nil" 

end

