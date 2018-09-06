describe "client_slug confers authz rules" do
  include EnvVarSpecHelper

  before(:each) do
    @ncr_user     = create :user, client_slug: "ncr"
    @ncr_approver = create :user, client_slug: "ncr"
    @gsa_user     = create :user, client_slug: "gsa18f"
  end

  it "rejects requests for user with no client_slug" 


  it "rejects requests for user with different client_slug" 


  it "allows Admin role" 


  it "allows same client_slug to create" 


  it "rejects different client_slug from viewing existing proposal" 


  it "rejects same client_slug non-subscriber to view existing proposal" 


  it "rejects subscriber trying to add user with non-client_slug as observer" 


  scenario "load 18f new request page in beta view" do
    with_env_var("BETA_FEATURE_LIST_VIEW", "true") do
      user = @gsa_user
      login_as(@gsa_user)
      user.add_role(ROLE_BETA_USER)
      user.add_role(ROLE_BETA_ACTIVE)
      visit new_gsa18f_procurement_path
      expect(page).to have_content("Request details")
    end
  end

  scenario "load ncr new request page in beta view" do
    with_env_var("BETA_FEATURE_LIST_VIEW", "true") do
      user = @ncr_user
      login_as(@ncr_user)
      user.add_role(ROLE_BETA_USER)
      user.add_role(ROLE_BETA_ACTIVE)
      visit new_ncr_work_order_path
      expect(page).to have_content("Request details")
    end
  end

  private

  def submit_ba60_work_order(approver)
    fill_in "Project title", with: "blue shells"
    fill_in "Description", with: "desc content"
    choose "BA60"
    fill_in "Vendor", with: "Yoshi"
    fill_in "Amount", with: 123.45
    select approver.email_address, from: "Approving official's email address"
    fill_in "Building number", with: Ncr::BUILDING_NUMBERS[0]
    find('input[name="commit"]').click
  end

  def add_as_observer(user)
    select user.email_address, from: "observation_user_id"
    fill_in "observation_reason", with: "observe thy ways"
    click_on "Add an Observer"
  end

  def expect_to_not_find_amongst_select_tag_options(field_name, value)
    expect(field_labeled(field_name).first(:xpath, ".//option[text() = '#{value}']")).to_not be_present
  end
end

