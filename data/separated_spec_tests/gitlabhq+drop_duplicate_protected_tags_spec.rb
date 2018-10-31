require 'spec_helper'
require Rails.root.join('db', 'migrate', '20180711103851_drop_duplicate_protected_tags.rb')

describe DropDuplicateProtectedTags, :migration do
  let(:namespaces) { table(:namespaces) }
  let(:projects) { table(:projects) }
  let(:protected_tags) { table(:protected_tags) }

  before do
    stub_const("#{described_class}::BATCH_SIZE", 2)

    namespaces.create(id: 1, name: 'gitlab-org', path: 'gitlab-org')
    projects.create!(id: 1, namespace_id: 1, name: 'gitlab1', path: 'gitlab1')
    projects.create!(id: 2, namespace_id: 1, name: 'gitlab2', path: 'gitlab2')
  end

  it 'removes duplicated protected tags' 


  it 'does not remove unique protected tags' 

end

