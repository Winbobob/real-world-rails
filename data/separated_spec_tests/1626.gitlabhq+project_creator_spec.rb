require 'spec_helper'

describe Gitlab::BitbucketImport::ProjectCreator do
  let(:user) { create(:user) }

  let(:repo) do
    double(name: 'Vim',
           slug: 'vim',
           description: 'Test repo',
           is_private: true,
           owner: "asd",
           full_name: 'Vim repo',
           visibility_level: Gitlab::VisibilityLevel::PRIVATE,
           clone_url: 'http://bitbucket.org/asd/vim.git',
           has_wiki?: false)
  end

  let(:namespace) { create(:group) }
  let(:token) { "asdasd12345" }
  let(:secret) { "sekrettt" }
  let(:access_params) { { bitbucket_access_token: token, bitbucket_access_token_secret: secret } }

  before do
    namespace.add_owner(user)
  end

  it 'creates project' 

end

