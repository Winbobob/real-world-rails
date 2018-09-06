require 'spec_helper'
require 'rake'

describe 'gitlab:db namespace rake task' do
  before :all do
    Rake.application.rake_require 'active_record/railties/databases'
    Rake.application.rake_require 'tasks/seed_fu'
    Rake.application.rake_require 'tasks/gitlab/db'

    # empty task as env is already loaded
    Rake::Task.define_task :environment
  end

  before do
    # Stub out db tasks
    allow(Rake::Task['db:migrate']).to receive(:invoke).and_return(true)
    allow(Rake::Task['db:schema:load']).to receive(:invoke).and_return(true)
    allow(Rake::Task['db:seed_fu']).to receive(:invoke).and_return(true)
  end

  describe 'configure' do
    it 'invokes db:migrate when schema has already been loaded' 


    it 'invokes db:shema:load and db:seed_fu when schema is not loaded' 


    it 'does not invoke any other rake tasks during an error' 


    it 'does not invoke seed after a failed schema_load' 

  end

  def run_rake_task(task_name)
    Rake::Task[task_name].reenable
    Rake.application.invoke_task task_name
  end
end

