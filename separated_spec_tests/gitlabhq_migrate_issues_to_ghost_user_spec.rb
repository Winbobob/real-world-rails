require 'spec_helper'
require Rails.root.join('db', 'migrate', '20170825104051_migrate_issues_to_ghost_user.rb')

describe MigrateIssuesToGhostUser, :migration do
  describe '#up' do
    let(:projects) { table(:projects) }
    let(:issues) { table(:issues) }
    let(:users) { table(:users) }

    before do
      project = projects.create!(name: 'gitlab', namespace_id: 1)
      user = users.create(email: 'test@example.com')
      issues.create(title: 'Issue 1', author_id: nil, project_id: project.id)
      issues.create(title: 'Issue 2', author_id: user.id, project_id: project.id)
    end

    context 'when ghost user exists' do
      let!(:ghost) { users.create(ghost: true, email: 'ghost@example.com') }

      it 'does not create a new user' 


      it 'migrates issues where author = nil to the ghost user' 


      it 'does not change issues authored by an existing user' 

    end

    context 'when ghost user does not exist' do
      it 'creates a new user' 


      it 'migrates issues where author = nil to the ghost user' 


      it 'does not change issues authored by an existing user' 

    end
  end
end
