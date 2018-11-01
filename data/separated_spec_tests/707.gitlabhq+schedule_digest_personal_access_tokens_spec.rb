require 'spec_helper'
require Rails.root.join('db', 'post_migrate', '20180913142237_schedule_digest_personal_access_tokens.rb')

describe ScheduleDigestPersonalAccessTokens, :migration, :sidekiq do
  let(:personal_access_tokens) { table(:personal_access_tokens) }
  let(:users) { table(:users) }

  before do
    stub_const("#{described_class.name}::BATCH_SIZE", 4)

    users.create(id: 1, email: 'user@example.com', projects_limit: 10)

    personal_access_tokens.create!(id: 1, user_id: 1, name: 'pat-01', token: 'token-01')
    personal_access_tokens.create!(id: 2, user_id: 1, name: 'pat-02', token: 'token-02')
    personal_access_tokens.create!(id: 3, user_id: 1, name: 'pat-03', token_digest: 'token_digest')
    personal_access_tokens.create!(id: 4, user_id: 1, name: 'pat-04', token: 'token-04')
    personal_access_tokens.create!(id: 5, user_id: 1, name: 'pat-05', token: 'token-05')
    personal_access_tokens.create!(id: 6, user_id: 1, name: 'pat-06', token: 'token-06')
  end

  it 'correctly schedules background migrations' 


  it 'schedules background migrations' 

end

