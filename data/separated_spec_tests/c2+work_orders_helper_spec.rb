describe Ncr::WorkOrdersHelper do
  describe '#scoped_approver_options' do
    # TODO: Fix this brittle test
    #
    # it "includes existing users" do
    #   expect(helper.scoped_approver_options.size).to eq(0)
    #   users = create_list(:user, 2, client_slug: "ncr")
    #
    #   expect(helper.scoped_approver_options).to match_array(users)
    # end

    it "does not include inactive users" 


    # TODO: Fix this brittle test
    #
    # it "sorts the results" do
    #   a_user = create(:user, email_address: "b@example.com", client_slug: "ncr")
    #   b_user = create(:user, email_address: "c@example.com", client_slug: "ncr")
    #   c_user = create(:user, email_address: "a@example.com", client_slug: "ncr")
    #   d_user = create(:user, email_address: "d@example.com", client_slug: "gsa18f")
    #   expect(helper.scoped_approver_options).to match_array([
    #                                                           a_user,
    #                                                           b_user,
    #                                                           c_user
    #                                                         ])
    #   expect(helper.scoped_approver_options).not_to include(
    #     d_user
    #   )
    # end
  end

  describe '#building_options' do
    it "includes an initial list" 


    it "includes custom results" 


    it "removes duplicates from custom" 


    it "removes duplicates when combining custom and initial list" 


    it "sorts the results" 

  end
end

