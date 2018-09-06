require "spec_helper"

# Needed for mocking later, if it's not available
unless defined?(Rake)

  module Rake
  end

  unless defined?(Rake::Task)
    module Rake
      class Task
        def self.[](name)
        end
      end
    end
  end

end

describe EOL::Db do

  before(:all) { @rake_task_hash = {} }

  before do
    allow(Rake::Task).to receive(:[]) do |name|
      # For stubbing
      @rake_task_hash[name] ||= Object.new
    end
  end

  describe '.all_connections' do

    it 'gets connections from ActiveRecord::Base and LoggingModel' 


  end

  describe '.clear_temp' do

    # TODO - ensure it does NOT delete files that don't include "_test_"
    before do
      @sql_file_name = 'file_created_by_specs_test_whatever.sql'
      @yml_file_name = 'file_created_by_specs_test_whatever.yml'
      @txt_file_name = 'file_created_by_specs_test_whatever.txt'
      @non_yml_file_name = 'file_created_by_specs_yml.foo'
      @all_files = [@sql_file_name, @yml_file_name, @txt_file_name,
        @non_yml_file_name]

      @all_files.each do |file|
        FileUtils.touch(Rails.root.join("tmp", file))
      end
    end

    after do
      @all_files.each do |file|
        file = Rails.root.join("tmp", file)
        File.unlink(file) if File.exist?(file)
      end
    end

    subject do
      EOL::Db.clear_temp
    end

    it 'deletes sql files from tmp' 


    it 'deletes yml files from tmp' 


    it 'does NOT delete txt files' 


    it 'does NOT delete "yml.foo"' 


  end

  describe '.create' do

    before do
      allow(ActiveRecord::Base).to receive(:establish_connection) { true }
      allow(LoggingModel).to receive(:establish_connection) { true }
      allow(ActiveRecord::Base.connection).to receive(:create_database) { true }
      allow(LoggingModel.connection).to receive(:create_database) { true }
    end

    it 'creates the ActiveRecord::Base database' 


    it 'creates the LoggingModel database' 


  end

  describe '.drop' do

    let(:connection_1) { double(Object, drop_database: true, current_database: 'this') }
    let(:connection_2) { double(Object, drop_database: true, current_database: 'that') }

    before do
      allow(EOL::Db).to receive(:all_connections).and_return([connection_1, connection_2])
    end

    it 'does not run in production!' 


    it 'drops all databases' 


  end

  it '.recreate calls a bunch of other methods' 


  it '.rebuild calls a bunch of other methods' 


  it '.populate calls a bunch of other methods' 


end

