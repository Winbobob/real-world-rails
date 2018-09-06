require "spec_helper"

feature "Admin edits councillor contribution" do
  before do
    create(
      :suggested_councillor,
      id: 1,
      name: "Mila Gilic",
      councillor_contribution: create(:councillor_contribution, id: 1)
    )
  end

  it "successfully" 

end

