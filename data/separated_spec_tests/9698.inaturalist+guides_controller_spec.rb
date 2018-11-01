require File.dirname(__FILE__) + '/../spec_helper'

describe GuidesController, "show" do
  describe "published guide" do
    let(:g) { make_published_guide }
    it "should be visible to signed out visitors" 

  end
  describe "draft guide" do
    let(:g) { Guide.make! }
    before do
      expect(g).not_to be_published
    end
    it "should not be viewable by signed out visitors" 

    it "should not be viewable by any signed in visitor" 

    it "should be viewable by guide editor if the guide is a draft" 

  end
end

describe GuidesController, "index" do
  it "should filter by place" 

end

describe GuidesController, "update" do
  let(:user) { User.make! }
  let(:guide) { make_published_guide(user: user) }
  before do
    sign_in user
  end
  it "should publish the guide based on the publish param" 

  it "should unpublish the guide" 

  it "should change the title" 

  it "should allow assignment of nested guide users" 

end

describe GuidesController, "import_taxa" do
  describe "from names" do
    before do
      @guide = Guide.make!
      sign_in @guide.user
    end
    it "should add guide taxa" 

  end
end

describe GuidesController, "import_tags_from_csv" do
  let(:guide) { make_published_guide }
  let(:taxon_names) { guide.guide_taxa.sort_by(&:name).map(&:name) }
  let(:work_path) { File.join(Dir::tmpdir, "import_tags_from_csv-#{Time.now.to_i}.csv") }
  before do
    sign_in guide.user
  end
  
  it "should add plain tags when no predicate listed" 

  
  it "should add tags with predicates" 


  it "should add tags with namespaces and predicates" 


  it "should add multiple tags per cell separated by pipes" 


  it "should not add tags for blanks" 


  it "should leave existing tags intact" 


  it "should fail gracefully without a file" 

end

describe GuidesController, "import_tags_from_csv_template" do
  let(:guide) { make_published_guide }
  before do
    sign_in guide.user
  end
  it "should include columns for predicates of all tags in the guide" 

  it "should include rows for all taxa in the guide" 

end

