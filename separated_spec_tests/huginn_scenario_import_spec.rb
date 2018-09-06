require 'rails_helper'

describe ScenarioImportsController do
  let(:user) { users(:bob) }

  before do
    login_as(user)
  end

  it 'renders the import form' 


  it 'requires a URL or file uplaod' 


  it 'imports a scenario that does not exist yet' 


  it 'asks to accept conflicts when the scenario was modified' 


  it 'imports a scenario which requires a service' 

end

