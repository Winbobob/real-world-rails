require "spec_helper"

feature "Contributing new councillors for an authority" do
  let(:authority) { create(:authority, full_name: "Casey City Council") }

  context "when the feature flag is off" do
    it "isn't available" 

  end

  context "when the feature flag is on" do
    around do |test|
      with_modified_env CONTRIBUTE_COUNCILLORS_ENABLED: "true" do
        test.run
      end
    end

    context "with three councillors" do
      before do
        visit new_authority_councillor_contribution_path(authority.short_name_encoded)

        within "fieldset" do
          fill_in "Full name", with: "Mila Gilic"
          fill_in "Email", with: "mgilic@casey.vic.gov.au"
        end

        click_button "Add another councillor"

        within(page.all("fieldset")[1]) do
          fill_in "Full name", with: "Susan Serey"
          fill_in "Email", with: "ssurey@casey.vic.gov.au"
        end

        click_button "Add another councillor"

        within(page.all("fieldset")[2]) do
          fill_in "Full name", with: "Rosalie Crestani"
          fill_in "Email", with: "rcrestani@casey.vic.gov.au"
        end

        click_button "Submit 3 new councillors"
      end

      context "and skipping source information" do
        before do
          click_button "Submit"
        end

        it "successfully" 

      end

      context ", providing source information" do
        before do
          fill_in "Let us know where you found this information", with: "https//caseycitycouncil.nsw.gov.au"

          click_button "Submit"
        end

        context "and providing contributor details" do
          before do
            fill_in "Your name", with: "Jane Contributes"
            fill_in "Your email", with: "jane@contributor.com"

            click_button "Submit"
          end

          it "successfully" 

        end

        context "and skiping contributor details" do
          before do
            click_button "I'd rather not say"
          end

          it "successfully" 

        end
      end
    end

    context "when a person submits one councillor with all blank attributes" do
      before :each do
        visit new_authority_councillor_contribution_path(authority.short_name_encoded)

        within ".councillor-contribution-councillors fieldset" do
          fill_in "Full name", with: ""
          fill_in "Email", with: ""
        end

        click_button "Submit"
      end

      it "does not go to the contributor information page" 

    end

    context "with three councillors and one blank councillor" do
      before :each do
        visit new_authority_councillor_contribution_path(authority.short_name_encoded)

        within "fieldset" do
          fill_in "Full name", with: "Mila Gilic"
          fill_in "Email", with: "mgilic@casey.vic.gov.au"
        end

        click_button "Add another councillor"

        within(page.all("fieldset")[1]) do
          fill_in "Full name", with: "Rosalie Crestani"
          fill_in "Email", with: "rcrestani@casey.vic.gov.au"
        end

        click_button "Add another councillor"

        within(page.all("fieldset")[2]) do
          fill_in "Full name", with: "Rosalie Crestani"
          fill_in "Email", with: "rcrestani@casey.vic.gov.au"
        end

        click_button "Add another councillor"

        click_button "Submit 4 new councillors"

        fill_in "Let us know where you found this information", with: "https//caseycitycouncil.nsw.gov.au"

        click_button "Submit"
      end

      # TODO: This really should return the blank councillor as invalid.
      #       but the person then needs a way to remove it if they added the
      #       extra councillor by accident and they don't want to submit it.
      #       Remove this once the two in exchange for the two pending tests below.
      it "successfully" 


      it "displays an error message" 


      it "does not go to the contributor information page" 

    end

    it "successfully with councillors being edited after they're first added" 


    it "admin receives notification email for councillor contribution" 

  end
end

