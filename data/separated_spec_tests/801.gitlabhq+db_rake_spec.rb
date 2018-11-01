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


    it 'invokes db:shema:load and db:seed_fu when there is only a single table present' 


    it 'does not invoke any other rake tasks during an error' 


    it 'does not invoke seed after a failed schema_load' 


    context 'SKIP_POST_DEPLOYMENT_MIGRATIONS environment variable set' do
      let(:rails_paths) { { 'db' => ['db'], 'db/migrate' => ['db/migrate'] } }

      before do
        allow(ENV).to receive(:[]).and_call_original
        allow(ENV).to receive(:[]).with('SKIP_POST_DEPLOYMENT_MIGRATIONS').and_return true

        # Our environment has already been loaded, so we need to pretend like post_migrations were not
        allow(Rails.application.config).to receive(:paths).and_return(rails_paths)
        allow(ActiveRecord::Migrator).to receive(:migrations_paths).and_return(rails_paths['db/migrate'].dup)
      end

      it 'adds post deployment migrations before schema load if the schema is not already loaded' 


      it 'ignores post deployment migrations  when schema has already been loaded' 

    end
  end

  def run_rake_task(task_name)
    Rake::Task[task_name].reenable
    Rake.application.invoke_task task_name
  end
end

