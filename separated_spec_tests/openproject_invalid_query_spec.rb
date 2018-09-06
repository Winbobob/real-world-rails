require 'spec_helper'

describe 'Invalid query spec', js: true do
  let(:user) { FactoryGirl.create :admin }
  let(:project) { FactoryGirl.create :project }

  let(:wp_table) { ::Pages::WorkPackagesTable.new(project) }
  let(:filters) { ::Components::WorkPackages::Filters.new }

  let(:member) do
    FactoryGirl.create(:member,
                       user: user,
                       project: project,
                       roles: [FactoryGirl.create(:role)])
  end
  let(:status) do
    FactoryGirl.create(:status)
  end
  let(:status2) do
    FactoryGirl.create(:status)
  end

  let(:invalid_query) do
    query = FactoryGirl.create(:query,
                               project: project,
                               user: user)

    query.add_filter('assigned_to_id', '=', [99999])
    query.columns << 'cf_0815'
    query.group_by = 'cf_0815'
    query.sort_criteria = [['cf_0815', 'desc']]
    query.save(validate: false)

    query
  end

  let(:valid_query) do
    FactoryGirl.create(:query,
                       project: project,
                       user: user)
  end

  let(:work_package_assigned) do
    FactoryGirl.create(:work_package,
                       project: project,
                       status: status2,
                       assigned_to: user)
  end

  before do
    login_as(user)
    status
    status2
    member
    work_package_assigned
  end

  it 'should load a faulty query and also the drop down' 


  it 'should not load with faulty parameters but can be fixed' 

end

