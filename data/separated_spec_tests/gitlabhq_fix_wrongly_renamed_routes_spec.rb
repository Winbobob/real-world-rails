require 'spec_helper'
require Rails.root.join('db', 'post_migrate', '20170518231126_fix_wrongly_renamed_routes.rb')

describe FixWronglyRenamedRoutes, :migration do
  let(:subject) { described_class.new }
  let(:namespaces_table) { table(:namespaces) }
  let(:projects_table) { table(:projects) }
  let(:routes_table) { table(:routes) }
  let(:broken_namespace) do
    namespaces_table.create!(name: 'apiis', path: 'apiis').tap do |namespace|
      routes_table.create!(source_type: 'Namespace', source_id: namespace.id, name: 'api0is', path: 'api0is')
    end
  end
  let(:broken_namespace_route) { routes_table.where(source_type: 'Namespace', source_id: broken_namespace.id).first }

  describe '#wrongly_renamed' do
    it "includes routes that have names that don't match their namespace" 

  end

  describe "#paths_and_corrections" do
    it 'finds the wrong path and gets the correction from the namespace' 

  end

  describe '#routes_in_namespace_query' do
    it 'includes only the required routes' 

  end

  describe '#up' do
    it 'renames incorrectly named routes' 


    it "doesn't touch namespaces that look like something that should be renamed" 

  end
end

