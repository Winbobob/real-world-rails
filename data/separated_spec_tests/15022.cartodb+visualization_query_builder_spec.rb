# encoding: utf-8

require_relative '../../spec_helper'
require 'helpers/unique_names_helper'

describe Carto::VisualizationQueryBuilder do
  include UniqueNamesHelper
  include Rack::Test::Methods
  include Warden::Test::Helpers
  include Carto::Factories::Visualizations
  include_context 'visualization creation helpers'
  include_context 'users helper'

  def preload_activerecord_metadata
    # Loads the model structures into memory, to avoid counting those as queries
    @vqb.build.first.user_table.name
  end

  before(:each) do
    @vqb = Carto::VisualizationQueryBuilder.new.with_user_id(@user1.id)

    DBQueryMatchers.configure do |config|
      config.ignores = []
      config.ignores << /SHOW client_min_messages/
      config.ignores << /SET client_min_messages TO 'panic'/
      config.ignores << /SET standard_conforming_strings = on/
      config.ignores << /SET client_min_messages TO 'notice'/
      config.ignores << /SHOW TIME ZONE/
      config.ignores << /SELECT a.attname, format_type(a.atttypid, a.atttypmod), d.adsrc, a.attnotnull/
      config.ignores << /SHOW search_path/
      config.ignores << /LEFT JOIN pg_namespace n ON n.oid = c.relnamespace/
      config.ignores << /INNER JOIN pg_depend dep ON attr.attrelid = dep.refobjid AND attr.attnum = dep.refobjsubid/
      config.ignores << /WHERE a.attrelid = '".*"'::regclass/
    end
  end

  it 'searches for all visualizations' 


  it 'searches for all visualizations for a user' 


  it 'can prefetch user' 


  it 'can prefetch table' 


  it 'searches for shared visualizations' 


  describe 'sharing with organization' do
    include_context 'organization with users helper'
    it 'lists all visualizations shared with the org' 


    it 'lists all visualizations shared with a group' 


    it 'lists visualizations once when they are shared with user and org' 

  end

  it 'orders using different criteria' 


  it 'filters remote tables with syncs' 


  it 'filters raster tables' 


  it 'will not accept nil id or name' 


  describe '#with_published' do
    it 'is implied by public search, so querying public filters public, unpublished' 


    it 'selects public v2' 


    it 'selects nil version maps' 


    it 'selects public v3 datasets' 


    it 'does not select private v2 maps' 


    it 'selects v3 mapcapped mapcapped' 

  end
end

