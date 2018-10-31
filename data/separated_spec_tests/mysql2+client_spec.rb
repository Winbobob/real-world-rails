require 'spec_helper'

RSpec.describe Mysql2::Client do
  context "using defaults file" do
    let(:cnf_file) { File.expand_path('../../my.cnf', __FILE__) }

    it "should not raise an exception for valid defaults group" 


    it "should not raise an exception without default group" 

  end

  it "should raise a Mysql::Error::ConnectionError upon connection failure" 


  it "should raise an exception on create for invalid encodings" 


  it "should raise an exception on non-string encodings" 


  it "should not raise an exception on create for a valid encoding" 


  Klient = Class.new(Mysql2::Client) do
    attr_reader :connect_args
    def connect(*args)
      @connect_args ||= []
      @connect_args << args
    end
  end

  it "should accept connect flags and pass them to #connect" 


  it "should parse flags array" 


  it "should parse flags string" 


  it "should default flags to (REMEMBER_OPTIONS, LONG_PASSWORD, LONG_FLAG, TRANSACTIONS, PROTOCOL_41, SECURE_CONNECTION)" 


  it "should execute init command" 


  it "should send init_command after reconnect" 


  it "should have a global default_query_options hash" 


  it "should be able to connect via SSL options" 


  def run_gc
    if defined?(Rubinius)
      GC.run(true)
    else
      GC.start
    end
    sleep(0.5)
  end

  it "should terminate connections when calling close" 


  it "should not leave dangling connections after garbage collection" 


  context "#set_server_option" do
    let(:client) do
      new_client.tap do |client|
        client.set_server_option(Mysql2::Client::OPTION_MULTI_STATEMENTS_ON)
      end
    end

    it 'returns true when multi_statements is enable' 


    it 'returns true when multi_statements is disable' 


    it 'returns false when multi_statements is neither OPTION_MULTI_STATEMENTS_OFF or OPTION_MULTI_STATEMENTS_ON' 


    it 'enables multiple-statement' 


    it 'disables multiple-statement' 

  end

  context "#automatic_close" do
    it "is enabled by default" 


    if RUBY_PLATFORM =~ /mingw|mswin/
      it "cannot be disabled" 

    else
      it "can be configured" 


      it "can be assigned" 


      it "should not close connections when running in a child process" 

    end
  end

  it "should be able to connect to database with numeric-only name" 


  it "should respond to #close" 


  it "should be able to close properly" 


  context "#closed?" do
    it "should return false when connected" 


    it "should return true after close" 

  end

  it "should not try to query closed mysql connection" 


  it "should respond to #query" 


  it "should respond to #warning_count" 


  context "#warning_count" do
    context "when no warnings" do
      it "should 0" 

    end
    context "when has a warnings" do
      it "should > 0" 

    end
  end

  it "should respond to #query_info" 


  context "#query_info" do
    context "when no info present" do
      it "should 0" 

    end
    context "when has some info" do
      it "should retrieve it" 

    end
  end

  context ":local_infile" do
    before(:all) do
      new_client(local_infile: true) do |client|
        local = client.query "SHOW VARIABLES LIKE 'local_infile'"
        local_enabled = local.any? { |x| x['Value'] == 'ON' }
        skip("DON'T WORRY, THIS TEST PASSES - but LOCAL INFILE is not enabled in your MySQL daemon.") unless local_enabled

        client.query %[
          CREATE TABLE IF NOT EXISTS infileTest (
            id MEDIUMINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
            foo VARCHAR(10),
            bar MEDIUMTEXT
          )
        ]
      end
    end

    after(:all) do
      new_client do |client|
        client.query "DROP TABLE IF EXISTS infileTest"
      end
    end

    it "should raise an error when local_infile is disabled" 


    it "should raise an error when a non-existent file is loaded" 


    it "should LOAD DATA LOCAL INFILE" 

  end

  it "should expect connect_timeout to be a positive integer" 


  it "should expect read_timeout to be a positive integer" 


  it "should expect write_timeout to be a positive integer" 


  it "should allow nil read_timeout" 


  it "should set default program_name in connect_attrs" 


  it "should set custom connect_attrs" 


  context "#query" do
    it "should let you query again if iterating is finished when streaming" 


    it "should not let you query again if iterating is not finished when streaming" 


    it "should only accept strings as the query parameter" 


    it "should not retain query options set on a query for subsequent queries, but should retain it in the result" 


    it "should allow changing query options for subsequent queries" 


    it "should return results as a hash by default" 


    it "should be able to return results as an array" 


    it "should be able to return results with symbolized keys" 


    it "should require an open connection" 


    it "should detect closed connection on query read error" 


    if RUBY_PLATFORM !~ /mingw|mswin/
      it "should not allow another query to be sent without fetching a result first" 


      it "should describe the thread holding the active query" 


      it "should timeout if we wait longer than :read_timeout" 


      # XXX this test is not deterministic (because Unix signal handling is not)
      # and may fail on a loaded system
      it "should run signal handlers while waiting for a response" 


      it "#socket should return a Fixnum (file descriptor from C)" 


      it "#socket should require an open connection" 


      it 'should be impervious to connection-corrupting timeouts in #execute' 


      context 'when a non-standard exception class is raised' do
        it "should close the connection when an exception is raised" 


        it "should handle Timeouts without leaving the connection hanging if reconnect is true" 


        it "should handle Timeouts without leaving the connection hanging if reconnect is set to true after construction" 

      end

      it "threaded queries should be supported" 


      it "evented async queries should be supported" 

    end

    context "Multiple results sets" do
      before(:each) do
        @multi_client = new_client(flags: Mysql2::Client::MULTI_STATEMENTS)
      end

      it "should raise an exception when one of multiple statements fails" 


      it "returns multiple result sets" 


      it "does not interfere with other statements" 


      it "will raise on query if there are outstanding results to read" 


      it "#abandon_results! should work" 


      it "#more_results? should work" 


      it "#more_results? should work with stored procedures" 

    end
  end

  it "should respond to #socket" 


  if RUBY_PLATFORM =~ /mingw|mswin/
    it "#socket should raise as it's not supported" 

  end

  it "should respond to escape" 


  context "escape" do
    it "should return a new SQL-escape version of the passed string" 


    it "should return the passed string if nothing was escaped" 


    it "should not overflow the thread stack" 


    it "should not overflow the process stack" 


    it "should carry over the original string's encoding" 

  end

  it "should respond to #escape" 


  context "#escape" do
    it "should return a new SQL-escape version of the passed string" 


    it "should return the passed string if nothing was escaped" 


    it "should not overflow the thread stack" 


    it "should not overflow the process stack" 


    it "should require an open connection" 


    context 'when mysql encoding is not utf8' do
      let(:client) { new_client(encoding: "ujis") }

      it 'should return a internal encoding string if Encoding.default_internal is set' 

    end
  end

  it "should respond to #info" 


  it "#info should return a hash containing the client version ID and String" 


  context "strings returned by #info" do
    it "should be tagged as ascii" 

  end

  context "strings returned by .info" do
    it "should be tagged as ascii" 

  end

  it "should respond to #server_info" 


  it "#server_info should return a hash containing the client version ID and String" 


  it "#server_info should require an open connection" 


  context "strings returned by #server_info" do
    it "should default to the connection's encoding if Encoding.default_internal is nil" 


    it "should use Encoding.default_internal" 

  end

  it "should raise a Mysql2::Error::ConnectionError exception upon connection failure due to invalid credentials" 


  context 'write operations api' do
    before(:each) do
      @client.query "USE test"
      @client.query "CREATE TABLE IF NOT EXISTS lastIdTest (`id` BIGINT NOT NULL AUTO_INCREMENT, blah INT(11), PRIMARY KEY (`id`))"
    end

    after(:each) do
      @client.query "DROP TABLE lastIdTest"
    end

    it "should respond to #last_id" 


    it "#last_id should return a Fixnum, the from the last INSERT/UPDATE" 


    it "should respond to #last_id" 


    it "#last_id should return a Fixnum, the from the last INSERT/UPDATE" 


    it "#last_id should handle BIGINT auto-increment ids above 32 bits" 

  end

  it "should respond to #thread_id" 


  it "#thread_id should be a Fixnum" 


  it "should respond to #ping" 


  context "select_db" do
    before(:each) do
      2.times do |i|
        @client.query("CREATE DATABASE test_selectdb_#{i}")
        @client.query("USE test_selectdb_#{i}")
        @client.query("CREATE TABLE test#{i} (`id` int NOT NULL PRIMARY KEY)")
      end
    end

    after(:each) do
      2.times do |i|
        @client.query("DROP DATABASE test_selectdb_#{i}")
      end
    end

    it "should respond to #select_db" 


    it "should switch databases" 


    it "should raise a Mysql2::Error when the database doesn't exist" 


    it "should return the database switched to" 

  end

  it "#thread_id should return a boolean" 


  it "should be able to connect using plaintext password" 


  it "should respond to #encoding" 

end

