require 'capybara_helper'

describe "handling undefined agents" do
  before do
    login_as(users(:bob))
    agent = agents(:bob_website_agent)
    agent.update_attribute(:type, 'Agents::UndefinedAgent')
  end

  it 'renders the error page' 


  it 'deletes all undefined agents' 

end

