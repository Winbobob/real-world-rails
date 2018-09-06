require 'spec_helper'

describe 'Projects > Show > User sees a deletion failure message' do
  let(:project) { create(:project, :empty_repo, pending_delete: true) }

  before do
    sign_in(project.owner)
  end

  it 'shows error message if deletion for project fails' 

end

