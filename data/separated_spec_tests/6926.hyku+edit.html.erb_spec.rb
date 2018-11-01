RSpec.describe "labels/edit", type: :view do
  let(:site) { Site.create!(application_name: "MyString", institution_name: "My Inst Name") }

  before do
    assign(:site, site)
  end

  it "renders the edit site form" 

end

