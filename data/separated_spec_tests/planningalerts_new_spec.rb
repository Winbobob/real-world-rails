require 'spec_helper'

describe "councillor_contributions/new" do
  it "displays the full name of the assigned authority" 


  context "with an invalid councillor" do
    before do
      invalid_councillor = build(
        :suggested_councillor,
        name: nil,
        email: nil
      )
      invalid_councillor.validate

      assign(:authority, create(:authority))
      assign(
        :councillor_contribution,
        build(:councillor_contribution, suggested_councillors: [invalid_councillor], authority: @authority)
      )
    end

    it "shows error messages" 

  end
end

