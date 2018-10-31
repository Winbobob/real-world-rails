require "spec_helper"

module Capistrano
  describe Configuration do
    let(:config) { Configuration.new }
    let(:servers) { stub }

    describe ".new" do
      it "accepts initial hash" 

    end

    describe ".env" do
      it "is a global accessor to a single instance" 

    end

    describe ".reset!" do
      it "blows away the existing `env` and creates a new one" 

    end

    describe "roles" do
      context "adding a role" do
        subject { config.role(:app, %w{server1 server2}) }

        before do
          Configuration::Servers.expects(:new).returns(servers)
          servers.expects(:add_role).with(:app, %w{server1 server2}, {})
        end

        it "adds the role" 

      end
    end

    describe "setting and fetching" do
      subject { config.fetch(:key, :default) }

      context "set" do
        it "sets by value" 


        it "sets by block" 


        it "raises an exception when given both a value and block" 

      end

      context "set_if_empty" do
        it "sets by value when none is present" 


        it "sets by block when none is present" 


        it "does not overwrite existing values" 

      end

      context "value is not set" do
        it "returns the default value" 

      end

      context "value is a proc" do
        subject { config.fetch(:key, proc { :proc }) }
        it "calls the proc" 

      end

      context "value is a lambda" do
        subject { config.fetch(:key, -> { :lambda }) }
        it "calls the lambda" 

      end

      context "value inside proc inside a proc" do
        subject { config.fetch(:key, proc { proc { "some value" } }) }
        it "calls all procs and lambdas" 

      end

      context "value inside lambda inside a lambda" do
        subject { config.fetch(:key, -> { -> { "some value" } }) }
        it "calls all procs and lambdas" 

      end

      context "value inside lambda inside a proc" do
        subject { config.fetch(:key, proc { -> { "some value" } }) }
        it "calls all procs and lambdas" 

      end

      context "value inside proc inside a lambda" do
        subject { config.fetch(:key, -> { proc { "some value" } }) }
        it "calls all procs and lambdas" 

      end

      context "lambda with parameters" do
        subject { config.fetch(:key, ->(c) { c }).call(42) }
        it "is returned as a lambda" 

      end

      context "block is passed to fetch" do
        subject { config.fetch(:key, :default) { raise "we need this!" } }

        it "returns the block value" 

      end

      context "validations" do
        before do
          config.validate :key do |_, value|
            raise Capistrano::ValidationError unless value.length > 3
          end
        end

        it "validates string without error" 


        it "validates block without error" 


        it "validates lambda without error" 


        it "raises an exception on invalid string" 


        it "raises an exception on invalid string provided by block" 


        it "raises an exception on invalid string provided by lambda" 

      end

      context "appending" do
        subject { config.append(:linked_dirs, "vendor/bundle", "tmp") }

        it "returns appended value" 


        context "on non-array variable" do
          before { config.set(:linked_dirs, "string") }
          subject { config.append(:linked_dirs, "vendor/bundle") }

          it "returns appended value" 

        end
      end

      context "removing" do
        before :each do
          config.set(:linked_dirs, ["vendor/bundle", "tmp"])
        end

        subject { config.remove(:linked_dirs, "vendor/bundle") }

        it "returns without removed value" 


        context "on non-array variable" do
          before { config.set(:linked_dirs, "string") }

          context "when removing same value" do
            subject { config.remove(:linked_dirs, "string") }

            it "returns without removed value" 

          end

          context "when removing different value" do
            subject { config.remove(:linked_dirs, "othervalue") }

            it "returns without removed value" 

          end
        end
      end
    end

    describe "keys" do
      subject { config.keys }

      before do
        config.set(:key1, :value1)
        config.set(:key2, :value2)
      end

      it "returns all set keys" 

    end

    describe "deleting" do
      before do
        config.set(:key, :value)
      end

      it "deletes the value" 

    end

    describe "asking" do
      let(:question) { stub }
      let(:options) { {} }

      before do
        Configuration::Question.expects(:new).with(:branch, :default, options)
                               .returns(question)
      end

      it "prompts for the value when fetching" 

    end

    describe "setting the backend" do
      it "by default, is SSHKit" 


      it "can be set to another class" 


      describe "ssh_options for Netssh" do
        it "merges them with the :ssh_options variable" 

      end
    end

    describe "dry_run?" do
      it "returns false when using default backend" 


      it "returns true when using printer backend" 

    end

    describe "custom filtering" do
      it "accepts a custom filter object" 


      it "accepts a custom filter as a block" 


      it "raises an error if passed a block and an object" 


      it "raises an error if the filter lacks a filter method" 


      it "calls the filter method of a custom filter" 

    end
  end
end

