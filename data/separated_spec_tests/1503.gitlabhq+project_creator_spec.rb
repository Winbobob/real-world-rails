require 'spec_helper'

describe Gitlab::GoogleCodeImport::ProjectCreator do
  let(:user) { create(:user) }
  let(:repo) do
    Gitlab::GoogleCodeImport::Repository.new(
      "name" => 'vim',
      "summary" => 'VI Improved',
      "repositoryUrls" => ["https://vim.googlecode.com/git/"]
    )
  end
  let(:namespace) { create(:group) }

  before do
    namespace.add_owner(user)
  end

  it 'creates project' 

end

