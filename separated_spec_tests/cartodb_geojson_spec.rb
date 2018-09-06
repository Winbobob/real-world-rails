# encoding: utf-8
require_relative '../../../../spec/rspec_configuration'
require_relative '../../../../spec/spec_helper'
require 'rspec/core'
require 'rspec/expectations'
require 'rspec/mocks'

require_relative '../../lib/importer/runner'
require_relative '../../lib/importer/job'
require_relative '../../lib/importer/downloader'
require_relative '../../../../spec/rspec_configuration'
require_relative '../factories/pg_connection'
require_relative '../doubles/log'
require_relative '../doubles/user'
require_relative 'acceptance_helpers'
require_relative 'no_stats_context'



describe 'geojson regression tests' do
  include AcceptanceHelpers
  include_context "no stats"

  before(:all) do
    @user = create_user
    @user.save
  end

  after(:all) do
    @user.destroy
  end

  it 'imports a file exported from CartoDB' 


  it 'imports a file from a url with params' 


  it "raises if GeoJSON isn't valid" 


end


