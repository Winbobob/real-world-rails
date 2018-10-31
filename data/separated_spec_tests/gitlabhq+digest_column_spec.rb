# frozen_string_literal: true

require 'spec_helper'

describe Gitlab::BackgroundMigration::DigestColumn, :migration, schema: 20180913142237 do
  let(:personal_access_tokens) { table(:personal_access_tokens) }
  let(:users) { table(:users) }

  subject { described_class.new }

  describe '#perform' do
    context 'token is not yet hashed' do
      before do
        users.create(id: 1, email: 'user@example.com', projects_limit: 10)
        personal_access_tokens.create!(id: 1, user_id: 1, name: 'pat-01', token: 'token-01')
      end

      it 'saves token digest' 


      it 'erases token' 

    end

    context 'token is already hashed' do
      before do
        users.create(id: 1, email: 'user@example.com', projects_limit: 10)
        personal_access_tokens.create!(id: 1, user_id: 1, name: 'pat-01', token_digest: 'token-digest-01')
      end

      it 'does not change existing token digest' 


      it 'leaves token empty' 

    end
  end
end

