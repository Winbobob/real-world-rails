require 'spec_helper'
require 'parallel_tests/tasks'

describe ParallelTests::Tasks do
  describe ".parse_args" do
    it "should return the count" 


    it "should default to the prefix" 


    it "should return the count and pattern" 


    it "should return the count, pattern, and options" 


    it "should return the count, pattern, and options" 


    it "should return the count, pattern, test options, and pass-through options" 

  end

  describe ".rails_env" do
    it "should be test when nothing was set" 


    it "should be whatever was set" 

  end

  describe ".run_in_parallel" do
    let(:full_path){ File.expand_path("../../../bin/parallel_test", __FILE__) }

    it "has the executable" 


    it "runs command in parallel" 


    it "runs command with :count option" 


    it "runs without -n with blank :count option" 


    it "runs command with :non_parallel option" 


    it "runs aborts if the command fails" 

  end

  describe ".suppress_output", unless: Gem.win_platform? do
    def call(command, grep)
      # Explictly run as a parameter to /bin/sh to simulate how
      # the command will be run by parallel_test --exec
      # This also tests shell escaping of single quotes
      result = `/bin/sh -c '#{ParallelTests::Tasks.suppress_output(command, grep)}'`
      [result, $?.success?]
    end

    context "with pipefail supported" do
      before :all do
        if not system("/bin/bash", "-c", "set -o pipefail 2>/dev/null && test 1")
          skip "pipefail is not supported on your system"
        end
      end

      it "should hide offending lines" 


      it "should not hide other lines" 


      it "should fail if command fails and the pattern matches" 


      it "should fail if command fails and the pattern fails" 

    end

    context "without pipefail supported" do
      before do
        expect(ParallelTests::Tasks).to receive(:system).with('/bin/bash', '-c', 'set -o pipefail 2>/dev/null && test 1').and_return false
      end

      it "should not filter and succeed" 


      it "should not filter and fail" 

    end
  end

  describe ".suppress_schema_load_output" do
    before do
      allow(ParallelTests::Tasks).to receive(:suppress_output)
    end

    it 'should call suppress output with command' 

  end

  describe ".check_for_pending_migrations" do
    after do
      Rake.application.instance_variable_get('@tasks').delete("db:abort_if_pending_migrations")
      Rake.application.instance_variable_get('@tasks').delete("app:db:abort_if_pending_migrations")
    end

    it "should do nothing if pending migrations is no defined" 


    it "should run pending migrations is task is defined" 


    it "should run pending migrations is app task is defined" 


    it "should not execute the task twice" 

  end

  describe '.purge_before_load' do
    context 'Rails < 4.2.0' do
      before do
        stub_const('Rails', double(version: '3.2.1'))
      end

      it "should return nil for Rails < 4.2.0" 

    end

    context 'Rails > 4.2.0' do
      before do
        stub_const('Rails', double(version: '4.2.8'))
      end

      it "should return db:purge when defined" 


      it "should return app:db:purge when db:purge is not defined" 

    end
  end
end

