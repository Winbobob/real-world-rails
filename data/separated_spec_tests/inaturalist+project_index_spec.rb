require "spec_helper"

describe "Project Index" do
  let(:project) { Project.make! }
  it "as_indexed_json should return a hash" 


  # We don't index icon at all if there's no icon, not sure how this ever worked
  # it "indexes icons with absolute URLs" do
  #   p = Project.make!
  #   json = p.as_indexed_json
  #   expect( json[:icon] ).to include Site.default.url
  # end

  it "should index as spam if project is spam" 

  
  it "should index as spam if project owned by a spammer" 


  describe "associated_place_ids" do
    let(:project) { Project.make! }
    let(:country) { Place.make!( admin_level: Place::COUNTRY_LEVEL ) }
    let(:state) { Place.make!( admin_level: Place::STATE_LEVEL, parent: country ) }
    it "should include the project's place_id" 

    it "should include the project place ancestors" 

    it "should include places from the project's rules" 

    it "should include ancestor places from the project's rules" 

    describe "for umbrella projects" do
      let(:umbrella) {
        u = Project.make!( project_type: "umbrella" )
        u.project_observation_rules.create!( operator: "in_project?", operand: project )
        u
      }
      it "should include a sub-project's place_id" 

      it "should include a sub-project's place ancestors" 

      it "should include places from a sub-project's rules" 

      it "should include ancestor places from a sub-project's rules" 

    end
  end
end

