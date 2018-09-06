require 'spec_helper_min'
require 'rake'
require_relative '../../../app/models/visualization/member'
require_relative '../../../app/models/visualization/overlays'

describe 'cartodb:fix_unique_overlays' do
  before(:each) do
    Rake.application.rake_require "tasks/fix_unique_overlays"
    Rake::Task.define_task(:environment)

    member = Visualization::Member.new
    @visualization = member
  end

  it 'deletes duplicate overlays of unique type' 

end

