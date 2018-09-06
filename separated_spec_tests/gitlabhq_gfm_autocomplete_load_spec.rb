require 'spec_helper'

describe 'GFM autocomplete loading', :js do
  let(:project) { create(:project) }

  before do
    sign_in(create(:admin))

    visit project_path(project)
  end

  it 'does not load on project#show' 


  it 'loads on new issue page' 

end

