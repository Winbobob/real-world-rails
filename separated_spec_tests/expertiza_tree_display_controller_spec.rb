describe TreeDisplayController do
  # Airbrake-1517247902792549741
  describe "#list" do
    it "should not redirect to tree_display#list if current user is an instructor" 


    it "should redirect to student_task#list if current user is a student" 


    it "should redirect to login page if current user is nil" 

  end

  describe "#confirm_notifications_access" do
    it "should verify usertype" 

  end

  describe "#ta_for_current_mappings?" do
    it "should return true if current user is a TA for current course" 

  end

  describe "#populate_rows" do
    let(:dbl) { double }
    before { expect(dbl).to receive(:populate_rows).with(Hash, String) }
    it "passes when the arguments match" 

  end

  describe "#populate_1_row" do
    let(:dbl) { double }
    before { expect(dbl).to receive(:populate_1_row).with(Node) }
    it "passes when the arguments match" 

  end

  describe "#drill" do
    it "redirect to list action" 

  end

  describe "GET #folder_node_ng_getter" do
    before(:each) do
      @treefolder = TreeFolder.new
      @treefolder.parent_id = nil
      @treefolder.name = "Courses"
      @treefolder.child_type = "CourseNode"
      @treefolder.save
      @foldernode = FolderNode.new
      @foldernode.parent_id = nil
      @foldernode.type = "FolderNode"
    end
    it "populates a list of FolderNodes when there is a match" 

    it "populates an empty list when there is no match" 

  end
  it { is_expected.to respond_to(:folder_node_ng_getter) }
  it { is_expected.to respond_to(:children_node_ng) }
  it { is_expected.to respond_to(:children_node_2_ng) }

  describe "GET #session_last_open_tab" do
    it "returns HTTP status 200" 

  end

  describe "POST #children_node_ng" do
    before(:each) do
      @treefolder = TreeFolder.new
      @treefolder.parent_id = nil
      @treefolder.name = "Courses"
      @treefolder.child_type = "CourseNode"
      @treefolder.save
      @foldernode = FolderNode.new
      @foldernode.parent_id = nil
      @foldernode.type = "FolderNode"
      @foldernode.node_object_id = 1
      @foldernode.save
      @course = create(:course)
      create(:assignment)
      create(:assignment_node)
      create(:course_node)
      @instructor = User.where(role_id: 1).first
    end

    it "returns a list of course objects(private) as json" 


    it "returns an empty list when there are no private or public courses" 


    it "returns a list of course objects(public) as json" 

  end

  describe "POST #children_node_ng for TA" do
    before(:each) do
      @treefolder = TreeFolder.new
      @treefolder.parent_id = nil
      @treefolder.name = "Courses"
      @treefolder.child_type = "CourseNode"
      @treefolder.save!

      @treefolder = TreeFolder.new
      @treefolder.parent_id = nil
      @treefolder.name = "Assignments"
      @treefolder.child_type = "AssignmentNode"
      @treefolder.save!

      @foldernode = FolderNode.new
      @foldernode.parent_id = nil
      @foldernode.type = "FolderNode"
      @foldernode.node_object_id = 1
      @foldernode.save!

      @foldernode = FolderNode.new
      @foldernode.parent_id = nil
      @foldernode.type = "FolderNode"
      @foldernode.node_object_id = 2
      @foldernode.save!

      # create a new course
      @course1 = create(:course)
      # make sure the course is not private
      @course1.private = false
      @course1.save

      @assignment_node1 = create(:assignment_node)
      create(:course_node)

      # make a teaching assistant
      user_ta = build(:teaching_assistant)
      @role = user_ta.role
      @ta = User.new(user_ta.attributes)
      @ta.save!
    end

    it "returns empty array if the logged in user is not ta" 


    it "returns a list of course objects ta is supposed to ta in as json" 


    it "returns an empty list when there are no mapping between ta and course" 


    it "returns only the course he is ta of when ta is a student of another course at the same time" 


    it "returns only the course he is ta of when ta is a student of same course at the same time" 


    it "returns only the assignments which belongs to the course he is ta of" 


    it "returns empty assignments list if none of the assignments belong to course he is ta of" 

  end
end

