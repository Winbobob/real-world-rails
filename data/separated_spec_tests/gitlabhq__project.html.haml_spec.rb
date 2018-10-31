require 'spec_helper'

describe 'shared/projects/_project.html.haml' do
  let(:project) { create(:project) }

  before do
    allow(view).to receive(:current_application_settings).and_return(Gitlab::CurrentSettings.current_application_settings)
    allow(view).to receive(:can?) { true }
  end

  it 'should render creator avatar if project has a creator' 


  it 'should render a generic avatar if project does not have a creator' 

end

