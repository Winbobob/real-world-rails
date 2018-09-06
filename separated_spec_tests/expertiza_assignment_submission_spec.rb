describe "assignment submisstion test" do
  before(:each) do
    # create assignment and topic
    create(:assignment, name: "Assignment1684", directory_path: "Assignment1684")
    create_list(:participant, 3)
    create(:topic, topic_name: "Topic")
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
    click_link "Assignment1684"
    click_link "Your work"
  end

  it "is able to submit a single valid link" 


  it "should not submit invalid link" 


  it "is able to submit multiple valid links" 


  it "should not submit duplicated link" 


  it "submit empty link" 


  it "is able to submit single valid file" 


  it "is able to submit multiple valid files" 


  it "is able to update already uploaded file" 

end

