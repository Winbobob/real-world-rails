require 'spec_helper'

describe 'Work Package table relations', js: true do
  let(:user) { FactoryGirl.create :admin }

  let(:type) { FactoryGirl.create(:type) }
  let(:type2) { FactoryGirl.create(:type) }
  let(:project) { FactoryGirl.create(:project, types: [type, type2]) }

  let(:wp_table) { Pages::WorkPackagesTable.new(project) }
  let(:relations) { ::Components::WorkPackages::Relations.new(relations) }
  let(:columns) { ::Components::WorkPackages::Columns.new }
  let(:wp_timeline) { Pages::WorkPackagesTimeline.new(project) }

  let!(:wp_from) { FactoryGirl.create(:work_package, project: project, type: type2) }
  let!(:wp_to) { FactoryGirl.create(:work_package, project: project, type: type) }
  let!(:wp_to2) { FactoryGirl.create(:work_package, project: project, type: type) }

  let!(:relation) do
    FactoryGirl.create(:relation,
                       from: wp_from,
                       to: wp_to,
                       relation_type: Relation::TYPE_FOLLOWS)
  end
  let!(:relation2) do
    FactoryGirl.create(:relation,
                       from: wp_from,
                       to: wp_to2,
                       relation_type: Relation::TYPE_FOLLOWS)
  end
  let!(:query) do
    query              = FactoryGirl.build(:query, user: user, project: project)
    query.column_names = ['subject']
    query.filters.clear

    query.save!
    query
  end

  let(:type_column_id) { "relationsToType#{type.id}" }
  let(:type_column_follows) { 'relationsOfTypeFollows' }
  let(:relation_columns_allowed) { true }

  before do
    # There does not seem to appear a way to generate a valid token
    # for testing purposes
    allow(EnterpriseToken)
      .to receive(:allows_to?)
      .and_return(false)

    allow(EnterpriseToken)
      .to receive(:allows_to?)
      .with(:work_package_query_relation_columns)
      .and_return(relation_columns_allowed)

    login_as(user)
  end

  describe 'with relation columns allowed by the enterprise token' do
    it 'displays expandable relation columns' 

  end

  describe 'with relation columns disallowed by the enterprise token' do
    let(:relation_columns_allowed) { false }

    it 'has no relation columns available for selection' 

  end
end

