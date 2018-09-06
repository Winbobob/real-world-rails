feature "Sort proposals on index page" do
  include ProposalTableSpecHelper

  it "allows other table headers to be clicked to sort" 


  it "allows the user to click on a title again to change order" 


  it "does not allow clicks in one table to affect the order of the other" 


  context "18F procurements" do
    scenario "can be sorted by urgency" do
      user = create(:user, client_slug: "gsa18f")
      procurements = create_list(:gsa18f_procurement, 3)
      add_user_as_observer(procurements, user)
      procurements[0].update(urgency: 20)
      procurements[1].update(urgency: 30)
      procurements[2].update(urgency: 10)

      login_as(user)
      visit proposals_path

      expect_order(pending_proposals_table, procurements.reverse.map { |p| p.proposal })
      save_and_open_page
      within(pending_proposals_section) { click_on "Urgency" }

      expect_order(
        pending_proposals_table,
        [procurements[2].proposal, procurements[0].proposal, procurements[1].proposal]
      )
    end

    scenario "can be sorted by purchase type" do
      user = create(:user, client_slug: "gsa18f")
      software_procurement = create(:gsa18f_procurement, purchase_type: "Software")
      office_supply_procurement = create(:gsa18f_procurement, purchase_type: "Office Supply/Miscellaneous")
      hardware_procurement = create(:gsa18f_procurement, purchase_type: "Hardware")
      add_user_as_observer(
        [software_procurement, office_supply_procurement, hardware_procurement],
        user
      )

      login_as(user)
      visit proposals_path

      expect_order(
        pending_proposals_table,
        [hardware_procurement.proposal, office_supply_procurement.proposal, software_procurement.proposal]
      )

      within(pending_proposals_section) { click_on "Purchase" }

      expect_order(
        pending_proposals_table,
        [software_procurement.proposal, office_supply_procurement.proposal, hardware_procurement.proposal]
      )
    end

    def add_user_as_observer(procurements, user)
      procurements.each do |procurement|
        procurement.update(proposal: create(:proposal, observer: user))
      end
    end
  end
end

