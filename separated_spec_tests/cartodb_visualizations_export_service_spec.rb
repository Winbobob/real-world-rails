# encoding: utf-8

require_relative '../../spec_helper'
require 'helpers/unique_names_helper'
require 'visualization/vizjson'

describe Carto::VisualizationsExportService do
  include UniqueNamesHelper
  before(:all) do
    @user = FactoryGirl.create(:valid_user, private_tables_enabled: true)
  end

  after(:all) do
    @user.destroy
  end

  before(:each) do
    bypass_named_maps
    ::User.any_instance
      .stubs(:has_feature_flag?)
      .returns(false)
    ::User.any_instance
      .stubs(:has_feature_flag?)
      .with(Carto::VisualizationsExportService::FEATURE_FLAG_NAME)
      .returns(true)
  end

  after(:each) do
    Carto::VisualizationBackup.delete_all
  end

  it "Calls data export upon visualization deletion" 


  it "Exports data to DB" 


  it "Purges old backup entries when told to do so" 


  it "Deletes backup after successfully restoring" 


  it "Imports data from DB" 


  it "Doesn't imports when versioning changes except if forced" 


  private

  def create_vis(user, attributes = {})
    attrs = {
      user_id:                  user.id,
      name:                     attributes.fetch(:name, unique_name('viz')),
      map_id:                   attributes.fetch(:map_id, ::Map.create(user_id: user.id).id),
      description:              attributes.fetch(:description, 'bogus'),
      type:                     attributes.fetch(:type, 'derived'),
      privacy:                  attributes.fetch(:privacy, 'public')
    }

    vis = CartoDB::Visualization::Member.new(attrs)
    vis.store

    vis
  end
end

