require 'spec_helper'
require Rails.root.join('db', 'migrate', '20180413022611_create_missing_namespace_for_internal_users.rb')

describe CreateMissingNamespaceForInternalUsers, :migration do
  let(:users) { table(:users) }
  let(:namespaces) { table(:namespaces) }
  let(:routes) { table(:routes) }

  internal_user_types = [:ghost]
  internal_user_types << :support_bot if ActiveRecord::Base.connection.column_exists?(:users, :support_bot)

  internal_user_types.each do |attr|
    context "for #{attr} user" do
      let(:internal_user) do
        users.create!(email: 'test@example.com', projects_limit: 100, username: 'test', attr => true)
      end

      it 'creates the missing namespace' 


      it 'sets notification email' 

    end
  end
end

