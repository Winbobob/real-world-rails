require 'spec_helper'

describe Projects::WikisController do
  let(:project) { create(:project_empty_repo, :public) }
  let(:user) { create(:user) }

  describe 'POST #preview_markdown' do
    it 'renders json in a correct format' 

  end
end

