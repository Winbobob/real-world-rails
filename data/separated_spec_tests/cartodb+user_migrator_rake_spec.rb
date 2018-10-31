require 'spec_helper_min'
require 'rake'
require 'factories/carto_visualizations'

describe 'user_migrator.rake' do
  include Carto::Factories::Visualizations

  before(:all) do
    Rake.application.rake_require "tasks/user_migrator"
    Rake::Task.define_task(:environment)
  end

  describe '#cartodb:user_migrator:cleanup:organization' do
    it 'does not remove organization assets from storage' 


    it 'does not remove user assets from storage' 

  end
end

