describe "peer review testing" do
  before(:each) do
    # create assignment and topic
    create(:assignment, name: "TestAssignment", directory_path: "TestAssignment")
    create_list(:participant, 3)
    create(:topic, topic_name: "TestTopic")
    create(:deadline_type, name: "submission")
    create(:deadline_type, name: "review")
    create(:deadline_type, name: "metareview")
    create(:deadline_type, name: "drop_topic")
    create(:deadline_type, name: "signup")
    create(:deadline_type, name: "team_formation")
    create(:deadline_right)
    create(:deadline_right, name: 'Late')
    create(:deadline_right, name: 'OK')
    create(:assignment_due_date, deadline_type: DeadlineType.where(name: "submission").first, due_at: DateTime.now.in_time_zone + 1.day)
  end

  def signup_topic
    user = User.find_by(name: "student2064")
    stub_current_user(user, user.role.name, user.role)
    visit '/student_task/list'
    visit '/sign_up_sheet/sign_up?id=1&topic_id=1' # signup topic
    visit '/student_task/list'
    click_link "TestAssignment"
    click_link "Your work"
  end

  def submit_to_topic
    signup_topic
    fill_in 'submission', with: "https://www.ncsu.edu"
    click_on 'Upload link'
    expect(page).to have_content "https://www.ncsu.edu"
  end

  it "is able to submit a single valid link" 


  it "is not able to select review with no submissions" 


  it "is not able to be assigned to review a topic only they have submitted on" 


  it "is not able to select topic for review only they have submitted to" 


  it "is able to select topic for review with valid submissions" 


  it "is able to be assigned random topic for review" 

end

