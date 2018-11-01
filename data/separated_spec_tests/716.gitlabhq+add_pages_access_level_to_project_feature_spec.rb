require 'spec_helper'
require Rails.root.join('db', 'migrate', '20180423204600_add_pages_access_level_to_project_feature.rb')

describe AddPagesAccessLevelToProjectFeature, :migration do
  let(:namespaces) { table(:namespaces) }
  let(:projects) { table(:projects) }
  let(:features) { table(:project_features) }
  let!(:namespace) { namespaces.create(name: 'gitlab', path: 'gitlab') }
  let!(:first_project) { projects.create(name: 'gitlab1', path: 'gitlab1', namespace_id: namespace.id) }
  let!(:first_project_features) { features.create(project_id: first_project.id) }
  let!(:second_project) { projects.create(name: 'gitlab2', path: 'gitlab2', namespace_id: namespace.id) }
  let!(:second_project_features) { features.create(project_id: second_project.id) }

  it 'correctly migrate pages for old projects to be public' 


  it 'after migration pages are enabled as default' 

end

