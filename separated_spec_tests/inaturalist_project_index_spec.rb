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

end

