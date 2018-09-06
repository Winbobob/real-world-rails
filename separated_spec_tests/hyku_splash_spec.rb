RSpec.describe "The splash page", multitenant: true do
  before do
    Capybara.default_host = "http://#{Account.admin_host}"
  end

  it "shows the page, displaying the Hyku version" 

end

