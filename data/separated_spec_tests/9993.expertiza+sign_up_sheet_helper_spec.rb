describe "SignUpSheetHelper" do
  describe "#check_topic_due_date_value" do
    before(:each) do
      @assignment = create(:assignment)
      @topic = create(:topic, assignment: @assignment)
      @deadline_type = create(:deadline_type)
      @deadline_right = create(:deadline_right)
      @assignment_due_date = create(:assignment_due_date,
                                    deadline_type: @deadline_type,
                                    assignment: @assignment,
                                    submission_allowed_id: @deadline_right.id,
                                    review_allowed_id: @deadline_right.id,
                                    review_of_review_allowed_id: @deadline_right.id)
    end
    it "The check_topic_due_date_value method should fail" 


    it "The check_topic_due_date_value method should return the assignment due date" 

  end

  describe "#get_suggested_topics" do
    before(:each) do
      @assignment = create(:assignment)
    end

    it "The get_suggested_topics method should fail" 


    it "The get_suggested_topics method should return the suggested topics" 

  end

  describe "#get_intelligent_topic_row" do
    before(:each) do
      @assignment = create(:assignment)
      @topic1 = create(:topic, topic_name: "Topic 1", assignment: @assignment)
      @topic2 = create(:topic, topic_name: "Topic 2", assignment: @assignment)
      @selected_topic1 = create(:signed_up_team, topic: @topic1, is_waitlisted: 0)
      @selected_topic2 = create(:signed_up_team, topic: @topic2, is_waitlisted: 0)
      @selected_topic3 = create(:signed_up_team, topic: @topic1, is_waitlisted: 1)
      @max_team_size = 1
    end

    it "The get_intelligent_topic_row method should render topic row with color yellow" 


    it "The get_intelligent_topic_row method should render topic row with color lightgray" 


    it "The get_intelligent_topic_row method should render topic row with no color" 


    it "The get_intelligent_topic_row method should render topic row with no selected topics" 

  end

  describe "#render_participant_info" do
    before(:each) do
      @assignment1 = create(:assignment, name: "final 1")
      @topic1 = create(:topic, assignment: @assignment1)
      @assignment2 = create(:assignment, name: "final 2")
      @topic2 = create(:topic, assignment: @assignment2)
      @participant1 = create(:participant, assignment: @assignment1)
    end

    it "The render_participant_info method should return an empty html" 


    it "The render_participant_info method should throw an exception" 

  end
end

