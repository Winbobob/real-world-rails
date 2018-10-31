require 'spec_helper'
require Rails.root.join('db', 'migrate', '20171012125712_migrate_user_authentication_token_to_personal_access_token.rb')

describe MigrateUserAuthenticationTokenToPersonalAccessToken, :migration do
  let(:users) { table(:users) }
  let(:personal_access_tokens) { table(:personal_access_tokens) }

  let!(:user) { users.create!(id: 1, email: 'user@example.com', authentication_token: 'user-token', admin: false) }
  let!(:admin) { users.create!(id: 2, email: 'admin@example.com', authentication_token: 'admin-token', admin: true) }

  it 'migrates private tokens to Personal Access Tokens' 

end

