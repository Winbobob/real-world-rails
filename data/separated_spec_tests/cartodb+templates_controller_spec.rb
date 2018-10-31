# encoding: utf-8

require_relative '../../../spec_helper'
require_relative '../../../../app/controllers/carto/api/templates_controller'

describe Carto::Api::TemplatesController do
  include_context 'organization with users helper'
  include Rack::Test::Methods
  include Warden::Test::Helpers

  before(:each) do
    ::User.any_instance.stubs(:has_feature_flag?).returns(false)
    ::User.any_instance.stubs(:has_feature_flag?).with('templated_workflows').returns(true)
    Carto::User.any_instance.stubs(:has_feature_flag?).with('templated_workflows').returns(true)
    Carto::User.any_instance.stubs(:has_feature_flag?).with('disabled_cartodb_logo').returns(false)

    bypass_named_maps
    @table = create_table(privacy: UserTable::PRIVACY_PRIVATE, name: 'table1', user_id: @org_user_owner.id)
    @other_table = create_table(privacy: UserTable::PRIVACY_PRIVATE, name: 'table2', user_id: @org_user_owner.id)

    @template_1_data = {
      title: 'title1',
      description: 'description 1',
      code: '{ /* 1 */ }',
      min_supported_version: '1.2.3',
      max_supported_version: '2.0.0',
      source_visualization_id: @table.table_visualization.id,
      organization_id: @org_user_owner.organization.id,
      required_tables: [ "#{@org_user_owner.database_schema}.#{@table.name}" ]
    }

    @template_2_data = {
      title: 'title2',
      description: 'description 2',
      code: '{ /* 2 */ }',
      min_supported_version: '4.5.6',
      max_supported_version: '99.0.0',
      source_visualization_id: @other_table.table_visualization.id,
      organization_id: @org_user_owner.organization.id,
      required_tables: [ "#{@org_user_owner.database_schema}.#{@other_table.name}" ]
    }

    @template_3_data = {
      title: 'title3',
      description: 'description 3',
      code: '{ /* 3 */ }',
      min_supported_version: '7.8.9',
      max_supported_version: '666.0.0',
      source_visualization_id: @table.table_visualization.id,
      organization_id: @org_user_owner.organization.id,
      required_tables: [ "#{@org_user_owner.database_schema}.#{@table.name}" ]
    }

    @template = Carto::Template.new({
      title: @template_1_data[:title],
      code: @template_1_data[:code],
      description: @template_1_data[:description],
      min_supported_version: @template_1_data[:min_supported_version],
      max_supported_version: @template_1_data[:max_supported_version],
      source_visualization_id: @template_1_data[:source_visualization_id],
      organization_id: @template_1_data[:organization_id],
      required_tables: @template_1_data[:required_tables]
      })
    @template.save

    @another_template_from_user = Carto::Template.new({
      title: @template_2_data[:title],
      code: @template_2_data[:code],
      description: @template_2_data[:description],
      min_supported_version: @template_2_data[:min_supported_version],
      max_supported_version: @template_2_data[:max_supported_version],
      source_visualization_id: @template_2_data[:source_visualization_id],
      organization_id: @template_2_data[:organization_id],
      required_tables: @template_2_data[:required_tables]
      })
    @another_template_from_user.save

    login(@org_user_owner)
  end

  after(:each) do
    Carto::Template.all.each { |template| template.delete }
    delete_user_data(@org_user_owner)
  end

  it 'tests index action' 


  it 'tests show action' 


  it 'tests create action' 


  it 'tests update action' 


  it 'tests destroy action' 


  it 'tests related_tables_by_xxx actions' 


end

