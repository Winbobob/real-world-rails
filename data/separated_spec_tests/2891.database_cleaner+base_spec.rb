require 'active_record'
require 'database_cleaner/active_record/base'
require 'database_cleaner/shared_strategy'

class FakeModel
  def self.connection
    :fake_connection
  end
end

RSpec.describe DatabaseCleaner::ActiveRecord do
  it { is_expected.to respond_to(:available_strategies) }

  describe "config_file_location" do
    after do
      # prevent global state leakage
      DatabaseCleaner::ActiveRecord.config_file_location=nil
      DatabaseCleaner.app_root = nil
    end

    it "should default to \#{DatabaseCleaner.app_root}/config/database.yml" 

  end
end

module DatabaseCleaner
  module ActiveRecord
    class ExampleStrategy
      include DatabaseCleaner::ActiveRecord::Base
    end

    RSpec.describe ExampleStrategy do
      let(:config_location) { '/path/to/config/database.yml' }

      around do |example|
        DatabaseCleaner::ActiveRecord.config_file_location = config_location
        example.run
        DatabaseCleaner::ActiveRecord.config_file_location = nil
      end

      it_should_behave_like "a generic strategy"

      describe "db" do
        it "should store my desired db" 


        it "should default to :default" 

      end

      describe "db=" do
        let(:config_location) { "spec/support/example.database.yml" }

        it "should process erb in the config" 


        context 'when config file differs from established ActiveRecord configuration' do
          before do
            allow(::ActiveRecord::Base).to receive(:configurations).and_return({ "my_db" => { "database" => "two"} })
          end

          it 'uses the ActiveRecord configuration' 

        end

        context 'when config file agrees with ActiveRecord configuration' do
          before do
            allow(::ActiveRecord::Base).to receive(:configurations).and_return({ "my_db" => { "database" => "one"} })
          end

          it 'uses the config file' 

        end

        context 'when ::ActiveRecord::Base.configurations nil' do
          before do
            allow(::ActiveRecord::Base).to receive(:configurations).and_return(nil)
          end

          it 'uses the config file' 

        end

        context 'when ::ActiveRecord::Base.configurations empty' do
          before do
            allow(::ActiveRecord::Base).to receive(:configurations).and_return({})
          end

          it 'uses the config file' 

        end

        context 'when config file is not available' do
          before do
            allow(File).to receive(:file?).with(config_location).and_return(false)
          end

          it "should skip config" 

        end

        it "skips the file when the model is set" 


        it "skips the file when the db is set to :default" 

      end

      describe "connection_class" do
        it "should default to ActiveRecord::Base" 


        context "with database models" do
          context "connection_hash is set" do
            it "reuses the model's connection" 

          end

          context "connection_hash is not set" do
            it "reuses the model's connection" 

          end
        end

        context "when connection_hash is set" do
          let(:hash) { {} }
          before { subject.connection_hash = hash }

          it "establishes a connection with it" 

        end
      end
    end
  end
end

