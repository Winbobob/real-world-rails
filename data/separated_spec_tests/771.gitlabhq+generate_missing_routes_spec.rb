require 'spec_helper'
require Rails.root.join('db', 'migrate', '20180702134423_generate_missing_routes.rb')

describe GenerateMissingRoutes, :migration do
  describe '#up' do
    let(:namespaces) { table(:namespaces) }
    let(:projects) { table(:projects) }
    let(:routes) { table(:routes) }

    it 'creates routes for projects without a route' 


    it 'creates routes for namespaces without a route' 


    it 'does not create routes for namespaces that already have a route' 


    it 'does not create routes for projects that already have a route' 

  end
end

