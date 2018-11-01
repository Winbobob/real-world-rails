require 'rails_helper'
require_dependency 'active_record/connection_adapters/postgresql_fallback_adapter'

describe ActiveRecord::ConnectionHandling do
  let(:replica_host) { "1.1.1.1" }
  let(:replica_port) { 6432 }

  let(:config) do
    ActiveRecord::Base.connection_config.merge(
      adapter: "postgresql_fallback",
      replica_host: replica_host,
      replica_port: replica_port
    )
  end

  let(:multisite_db) { "database_2" }

  let(:multisite_config) do
    {
      host: 'localhost1',
      port: 5432,
      replica_host: replica_host,
      replica_port: replica_port
    }
  end

  let(:postgresql_fallback_handler) { PostgreSQLFallbackHandler.instance }

  before do
    # TODO: tgxworld will rewrite it without stubs
    skip("Skip causes our build to be unstable")
    @threads = Thread.list
    postgresql_fallback_handler.initialized = true

    ['default', multisite_db].each do |db|
      postgresql_fallback_handler.master_up(db)
    end
  end

  after do
    Sidekiq.unpause!
    postgresql_fallback_handler.setup!
    ActiveRecord::Base.unstub(:postgresql_connection)
    (Thread.list - @threads).each(&:kill)
    ActiveRecord::Base.connection_pool.disconnect!
    ActiveRecord::Base.establish_connection
  end

  describe "#postgresql_fallback_connection" do
    it 'should return a PostgreSQL adapter' 


    context 'when master server is down' do
      before do
        @replica_connection = mock('replica_connection')
      end

      after do
        pg_readonly_mode_key = Discourse::PG_READONLY_MODE_KEY

        with_multisite_db(multisite_db) do
          Discourse.disable_readonly_mode(pg_readonly_mode_key)
        end

        Discourse.disable_readonly_mode(pg_readonly_mode_key)
        ActiveRecord::Base.establish_connection(ActiveRecord::Base.configurations[Rails.env])
      end

      it 'should failover to a replica server' 

    end

    context 'when both master and replica server is down' do
      it 'should raise the right error' 

    end
  end

  describe '.verify_replica' do
    describe 'when database is not in recovery' do
      it 'should raise the right error' 

    end
  end

  def with_multisite_db(dbname)
    begin
      RailsMultisite::ConnectionManagement.expects(:current_db).returns(dbname).at_least_once
      yield
    ensure
      RailsMultisite::ConnectionManagement.unstub(:current_db)
    end
  end
end

