require 'spec_helper'

describe 'Projects > Settings > User changes default branch' do
  let(:user) { create(:user) }
  let(:project) { create(:project, :repository, namespace: user.namespace) }

  before do
    sign_in(user)
    visit edit_project_path(project)
  end

  it 'allows to change the default branch' 

end

