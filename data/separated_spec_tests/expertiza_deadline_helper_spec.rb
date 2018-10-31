describe DeadlineHelper do
  before(:each) do
    @deadline_type = create(:deadline_type)
    @deadline_right = create(:deadline_right)
    @topic_due_date = create(:topic_due_date, deadline_type: @deadline_type,
                                              submission_allowed_id: @deadline_right.id, review_allowed_id: @deadline_right.id,
                                              review_of_review_allowed_id: @deadline_right.id)
  end

  describe "#create_topic_deadline" do
    it "should fail because of invalid due_date" 


    it "new due_date object created" 


    it "due_at should be same for 0 offset" 


    it "due_at calculated correctly for positive offset" 


    it "due_at calculated correctly for negative offset" 


    it "offset converted to integer correctly" 

  end

  it "has a valid factory" 

end

