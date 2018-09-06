require 'spec_helper'

describe 'Projects > Show > Collaboration links' do
  let(:project) { create(:project, :repository) }
  let(:user) { create(:user) }

  before do
    project.add_developer(user)
    sign_in(user)
  end

  it 'shows all the expected links' 


  it 'hides the links when the project is archived' 

end

