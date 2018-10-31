require 'spec_helper'

describe Gitlab::GitlabImport::ProjectCreator do
  let(:user) { create(:user) }
  let(:repo) do
    {
      name: 'vim',
      path: 'vim',
      visibility_level: Gitlab::VisibilityLevel::PRIVATE,
      path_with_namespace: 'asd/vim',
      http_url_to_repo: "https://gitlab.com/asd/vim.git",
      owner: { name: "john" }
    }.with_indifferent_access
  end
  let(:namespace) { create(:group) }
  let(:token) { "asdffg" }
  let(:access_params) { { gitlab_access_token: token } }

  before do
    namespace.add_owner(user)
  end

  it 'creates project' 

end

