describe "Staggered deadline test" do
  before(:each) do
    # assignment and topic
    create(:assignment, name: "Assignment1665", directory_path: "Assignment1665", rounds_of_reviews: 2, staggered_deadline: true)
    create_list(:participant, 3)
    create(:topic, topic_name: "Topic_1")
    create(:topic, topic_name: "Topic_2")

    # rubric
    create(:questionnaire, name: "TestQuestionnaire1")
    create(:questionnaire, name: "TestQuestionnaire2")
    create(:question, txt: "Question1", questionnaire: ReviewQuestionnaire.where(name: 'TestQuestionnaire1').first, type: "Criterion")
    create(:question, txt: "Question2", questionnaire: ReviewQuestionnaire.where(name: 'TestQuestionnaire2').first, type: "Criterion")
    create(:assignment_questionnaire, questionnaire: ReviewQuestionnaire.where(name: 'TestQuestionnaire1').first, used_in_round: 1)
    create(:assignment_questionnaire, questionnaire: ReviewQuestionnaire.where(name: 'TestQuestionnaire2').first, used_in_round: 2)

    # deadline type
    create(:deadline_type, name: "submission")
    create(:deadline_type, name: "review")
    create(:deadline_type, name: "metareview")
    create(:deadline_type, name: "drop_topic")
    create(:deadline_type, name: "signup")
    create(:deadline_type, name: "team_formation")
    create(:deadline_right)
    create(:deadline_right, name: 'Late')
    create(:deadline_right, name: 'OK')

    # assignment deadline
    assignment_due('submission', DateTime.now.in_time_zone + 10, 1, 1)
    assignment_due('review', DateTime.now.in_time_zone + 20, 1)
    assignment_due('submission', DateTime.now.in_time_zone + 30, 2)
    assignment_due('review', DateTime.now.in_time_zone + 40, 2)

    # topic deadline
    topic_due('submission', DateTime.now.in_time_zone + 10, 1, 1, 1)
    topic_due('review', DateTime.now.in_time_zone + 20, 1, 1)
    topic_due('submission', DateTime.now.in_time_zone + 30, 1, 2, 1)
    topic_due('review', DateTime.now.in_time_zone + 40, 1, 2)
    topic_due('submission', DateTime.now.in_time_zone + 10, 2, 1, 1)
    topic_due('review', DateTime.now.in_time_zone + 20, 2, 1)
    topic_due('submission', DateTime.now.in_time_zone + 30, 2, 2, 1)
    topic_due('review', DateTime.now.in_time_zone + 40, 2, 2)
  end

  # create assignment deadline
  # by default the review_allow_id is 3 (OK), however, for submission the review_allowed_id should be 1 (No).
  def assignment_due(type, time, round, review_allowed_id = 3)
    create(:assignment_due_date,
           deadline_type: DeadlineType.where(name: type).first,
           due_at: time,
           round: round,
           review_allowed_id: review_allowed_id)
  end

  # create topic deadline
  def topic_due(type, time, id, round, review_allowed_id = 3)
    create(:topic_due_date,
           due_at: time,
           deadline_type: DeadlineType.where(name: type).first,
           topic: SignUpTopic.where(id: id).first,
           round: round,
           review_allowed_id: review_allowed_id)
  end

  # impersonate student to submit work
  def submit_topic(name, topic, work)
    user = User.find_by(name: name)
    stub_current_user(user, user.role.name, user.role)
    visit '/student_task/list'
    visit topic # signup topic
    visit '/student_task/list'
    click_link "Assignment1665"
    click_link "Your work"
    fill_in 'submission', with: work
    click_on 'Upload link'
    expect(page).to have_content work
  end

  # change topic staggered deadline
  def change_due(topic, type, round, time)
    topic_due = TopicDueDate.where(parent_id: topic, deadline_type_id: type, round: round, type: "TopicDueDate").first
    topic_due.due_at = time
    topic_due.save
  end

  it "test1: in round 1, student2064 in review stage could do review" 


  it "test2: in round 2, both students should be in review stage to review each other" 


  it "test3: in round 2, both students after review deadline should not do review" 

end

