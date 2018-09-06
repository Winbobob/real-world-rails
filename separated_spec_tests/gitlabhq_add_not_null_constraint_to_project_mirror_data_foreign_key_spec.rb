require 'spec_helper'
require Rails.root.join('db', 'migrate', '20180508100222_add_not_null_constraint_to_project_mirror_data_foreign_key.rb')

describe AddNotNullConstraintToProjectMirrorDataForeignKey, :migration do
  let(:namespaces) { table(:namespaces) }
  let(:projects) { table(:projects) }
  let(:import_state) { table(:project_mirror_data) }

  before do
    import_state.create!(id: 1, project_id: nil, status: :started)
  end

  it 'removes every import state without an associated project_id' 

end

