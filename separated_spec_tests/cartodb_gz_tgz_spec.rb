# encoding: utf-8
require_relative '../../../../spec/rspec_configuration'
require_relative '../../../../spec/spec_helper'
require_relative '../../lib/importer/runner'
require_relative '../../lib/importer/job'
require_relative '../../lib/importer/downloader'
require_relative '../factories/pg_connection'
require_relative '../doubles/log'
require_relative '../doubles/user'
require_relative 'acceptance_helpers'
require_relative 'cdb_importer_context'
require_relative '../../../../spec/rspec_configuration'
require_relative 'no_stats_context'

describe 'gz and tgz regression tests' do
  include AcceptanceHelpers
  include_context "cdb_importer schema"
  include_context "no stats"

  before(:all) do
    @user = create_user
    @user.save
  end

  after(:all) do
    @user.destroy
  end

  it 'returns ok with supported gzip file' 


  it 'returns ok with supported tgz file' 


  it 'process one of the two files inside TGZ' 


  it 'returns error if csv is invalid with supported gzip file' 

end

