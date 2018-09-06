require 'spec_helper'
require Rails.root.join('db', 'migrate', '20171106151218_issues_moved_to_id_foreign_key.rb')

# The schema version has to be far enough in advance to have the
# only_mirror_protected_branches column in the projects table to create a
# project via FactoryBot.
describe IssuesMovedToIdForeignKey, :migration, schema: 20171114150259 do
  let!(:issue_first) { create(:issue, moved_to_id: issue_second.id) } # rubocop:disable RSpec/FactoriesInMigrationSpecs
  let!(:issue_second) { create(:issue, moved_to_id: issue_third.id) } # rubocop:disable RSpec/FactoriesInMigrationSpecs
  let!(:issue_third) { create(:issue) } # rubocop:disable RSpec/FactoriesInMigrationSpecs

  subject { described_class.new }

  it 'removes the orphaned moved_to_id' 

end

