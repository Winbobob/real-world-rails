# encoding: utf-8

require_relative '../../../rspec_configuration'
require 'ostruct'
require 'uuidtools'
require_relative '../../../../app/controllers/carto/api/data_import_presenter'
require_relative '../../../spec_helper'

module CartoDB; end

describe Carto::Api::DataImportPresenter do
  before(:all) do
    @user = create_user
    @user.max_layers = 4
  end

  before(:each) do
    @data_import = OpenStruct.new(
      user: @user,
      state: 'success',
      success: true,
      created_at: Time.now,
      updated_at: Time.now,
      id: UUIDTools::UUID.timestamp_create.to_s,
      stats: '{}',
      type_guessing: false,
      quoted_fields_guessing: false,
      content_guessing: false,
      create_visualization: false,
      user_defined_limits: '{}',
      original_url: '',
      service_name: '',
      rejected_layers: 'manolo,escobar',
      runner_warnings: '{"max_tables_per_import":10}'
    )
  end

  after(:all) do
    @user.destroy
  end

  describe '#display_name' do

    it 'extracts data_source file name' 


    it 'extracts service_item_id file name' 


    it 'extracts categories for Twitter searches' 


    it 'extracts filenames with special characters' 


    it 'extracts malformed urls from service_item_id' 


    it 'extracts id if neither service_item_id nor data_source given without throwing errors' 


    it 'extracts id if empty service_item_id and data_source are given without throwing errors' 


    it 'gets warnings' 


    it 'shows if import is raster' 

  end
end

