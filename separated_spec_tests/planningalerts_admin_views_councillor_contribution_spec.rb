require "spec_helper"

feature "Admin views councillor contributions" do
  let(:authority) { create(:authority, full_name: "Casey City Council") }
  let(:contributor) { create(:contributor, name: "Felix Chaung", email: "example@gmail.com") }
  let(:councillor_contribution) do
    create(
      :councillor_contribution,
      contributor: contributor,
      authority: authority,
      created_at: Time.utc(2017, 8, 1, 11, 34, 5)
    )
  end

  before :each do
    create(
      :suggested_councillor,
      name: "Mila Gilic",
      email: "mgilic@casey.vic.gov.au",
      councillor_contribution: councillor_contribution
    )
    create(
      :suggested_councillor,
      name: "Susan Serey",
      email: "sserey@casey.vic.gov.au",
      councillor_contribution: councillor_contribution
    )
    create(
      :suggested_councillor,
      name: "Rosalie Crestani",
      email: "rcrestani@casey.vic.gov.au",
      councillor_contribution: councillor_contribution
    )

    sign_in_as_admin

    click_link "Councillor Contributions"
  end

  it "successfully on the index page" 


  it "successfully with suggested councillors on the show page with contributor information" 


  it "and marks one as reviewed" 


  context "when one has been reviewed" do
    before { councillor_contribution.update(reviewed: true) }

    it "marks it as 'not reviewd'" 


    it "and marks it as accepted" 


    context "and accepted" do
      before { councillor_contribution.update(accepted: true) }

      it "and marks one as not accepted" 


      it "marking it as not reviewed also marks it not accepted" 

    end
  end
end

