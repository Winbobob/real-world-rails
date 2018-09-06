require "spec_helper"

describe Capistrano::DSL do
  let(:dsl) { Class.new.extend Capistrano::DSL }

  before do
    Capistrano::Configuration.reset!
  end

  describe "setting and fetching hosts" do
    describe "when defining a host using the `server` syntax" do
      before do
        dsl.server "example1.com", roles: %w{web}, active: true
        dsl.server "example2.com", roles: %w{web}
        dsl.server "example3.com", roles: %w{app web}, active: true
        dsl.server "example4.com", roles: %w{app}, primary: true
        dsl.server "example5.com", roles: %w{db}, no_release: true, active: true
      end

      describe "fetching all servers" do
        subject { dsl.roles(:all) }

        it "returns all servers" 

      end

      describe "fetching all release servers" do
        context "with no additional options" do
          subject { dsl.release_roles(:all) }

          it "returns all release servers" 

        end

        context "with property filter options" do
          subject { dsl.release_roles(:all, filter: :active) }

          it "returns all release servers that match the property filter" 

        end
      end

      describe "fetching servers by multiple roles" do
        it "does not confuse the last role with options" 

      end

      describe "fetching servers by role" do
        subject { dsl.roles(:app) }

        it "returns the servers" 

      end

      describe "fetching servers by an array of roles" do
        subject { dsl.roles([:app]) }

        it "returns the servers" 

      end

      describe "fetching filtered servers by role" do
        subject { dsl.roles(:app, filter: :active) }

        it "returns the servers" 

      end

      describe "fetching selected servers by role" do
        subject { dsl.roles(:app, select: :active) }

        it "returns the servers" 

      end

      describe "fetching the primary server by role" do
        context "when inferring primary status based on order" do
          subject { dsl.primary(:web) }
          it "returns the servers" 

        end

        context "when the attribute `primary` is explicitly set" do
          subject { dsl.primary(:app) }
          it "returns the servers" 

        end
      end

      describe "setting an internal host filter" do
        subject { dsl.roles(:app) }
        it "is ignored" 

      end

      describe "setting an internal role filter" do
        subject { dsl.roles(:app) }
        it "ignores it" 

      end

      describe "setting an internal host and role filter" do
        subject { dsl.roles(:app) }
        it "ignores it" 

      end

      describe "setting an internal regexp host filter" do
        subject { dsl.roles(:all) }
        it "is ignored" 

      end

      describe "setting an internal hosts filter" do
        subject { dsl.roles(:app) }
        it "is ignored" 

      end

      describe "setting an internal roles filter" do
        subject { dsl.roles(:app) }
        it "ignores it" 

      end

      describe "setting an internal hosts and roles filter" do
        subject { dsl.roles(:app) }
        it "ignores it" 

      end

      describe "setting an internal regexp hosts filter" do
        subject { dsl.roles(:all) }
        it "is ignored" 

      end
    end

    describe "when defining role with reserved name" do
      it "fails with ArgumentError" 

    end

    describe "when defining hosts using the `role` syntax" do
      before do
        dsl.role :web, %w{example1.com example2.com example3.com}
        dsl.role :web, %w{example1.com}, active: true
        dsl.role :app, %w{example3.com example4.com}
        dsl.role :app, %w{example3.com}, active: true
        dsl.role :app, %w{example4.com}, primary: true
        dsl.role :db, %w{example5.com}, no_release: true
      end

      describe "fetching all servers" do
        subject { dsl.roles(:all) }

        it "returns all servers" 

      end

      describe "fetching all release servers" do
        context "with no additional options" do
          subject { dsl.release_roles(:all) }

          it "returns all release servers" 

        end

        context "with filter options" do
          subject { dsl.release_roles(:all, filter: :active) }

          it "returns all release servers that match the filter" 

        end
      end

      describe "fetching servers by role" do
        subject { dsl.roles(:app) }

        it "returns the servers" 

      end

      describe "fetching servers by an array of roles" do
        subject { dsl.roles([:app]) }

        it "returns the servers" 

      end

      describe "fetching filtered servers by role" do
        subject { dsl.roles(:app, filter: :active) }

        it "returns the servers" 

      end

      describe "fetching selected servers by role" do
        subject { dsl.roles(:app, select: :active) }

        it "returns the servers" 

      end

      describe "fetching the primary server by role" do
        context "when inferring primary status based on order" do
          subject { dsl.primary(:web) }
          it "returns the servers" 

        end

        context "when the attribute `primary` is explicity set" do
          subject { dsl.primary(:app) }
          it "returns the servers" 

        end
      end
    end

    describe "when defining a host using a combination of the `server` and `role` syntax" do
      before do
        dsl.server "db@example1.com:1234", roles: %w{db}, active: true
        dsl.server "root@example1.com:1234", roles: %w{web}, active: true
        dsl.server "example1.com:5678", roles: %w{web}, active: true
        dsl.role :app, %w{deployer@example1.com:1234}
        dsl.role :app, %w{example1.com:5678}
      end

      describe "fetching all servers" do
        it "creates one server per hostname, ignoring user combinations" 

      end

      describe "fetching servers for a role" do
        it "roles defined using the `server` syntax are included" 


        it "roles defined using the `role` syntax are included" 

      end
    end

    describe "when setting user and port" do
      subject { dsl.roles(:all).map { |server| "#{server.user}@#{server.hostname}:#{server.port}" }.first }

      describe "using the :user property" do
        it "takes precedence over in the host string" 

      end

      describe "using the :port property" do
        it "takes precedence over in the host string" 

      end
    end
  end

  describe "setting and fetching variables" do
    before do
      dsl.set :scm, :git
    end

    context "without a default" do
      context "when the variables is defined" do
        it "returns the variable" 

      end

      context "when the variables is undefined" do
        it "returns nil" 

      end
    end

    context "with a default" do
      context "when the variables is defined" do
        it "returns the variable" 

      end

      context "when the variables is undefined" do
        it "returns the default" 

      end
    end

    context "with a block" do
      context "when the variables is defined" do
        it "returns the variable" 

      end

      context "when the variables is undefined" do
        it "calls the block" 

      end
    end
  end

  describe "asking for a variable" do
    before do
      dsl.ask(:scm, :svn)
      $stdout.stubs(:print)
    end

    context "variable is provided" do
      before do
        $stdin.expects(:gets).returns("git")
      end

      it "sets the input as the variable" 

    end

    context "variable is not provided" do
      before do
        $stdin.expects(:gets).returns("")
      end

      it "sets the variable as the default" 

    end
  end

  describe "checking for presence" do
    subject { dsl.any? :linked_files }

    before do
      dsl.set(:linked_files, linked_files)
    end

    context "variable is an non-empty array" do
      let(:linked_files) { %w{1} }

      it { expect(subject).to be_truthy }
    end

    context "variable is an empty array" do
      let(:linked_files) { [] }
      it { expect(subject).to be_falsey }
    end

    context "variable exists, is not an array" do
      let(:linked_files) { stub }
      it { expect(subject).to be_truthy }
    end

    context "variable is nil" do
      let(:linked_files) { nil }
      it { expect(subject).to be_falsey }
    end
  end

  describe "configuration SSHKit" do
    let(:config) { SSHKit.config }
    let(:backend) { SSHKit.config.backend.config }
    let(:default_env) { { rails_env: :production } }

    before do
      dsl.set(:format, :dot)
      dsl.set(:log_level, :debug)
      dsl.set(:default_env, default_env)
      dsl.set(:pty, true)
      dsl.set(:connection_timeout, 10)
      dsl.set(:ssh_options, keys: %w(/home/user/.ssh/id_rsa),
                            forward_agent: false,
                            auth_methods: %w(publickey password))
      dsl.configure_backend
    end

    it "sets the output" 


    it "sets the output verbosity" 


    it "sets the default env" 


    it "sets the backend pty" 


    it "sets the backend connection timeout" 


    it "sets the backend ssh_options" 

  end

  describe "on()" do
    describe "when passed server objects" do
      before do
        dsl.server "example1.com", roles: %w{web}, active: true
        dsl.server "example2.com", roles: %w{web}
        dsl.server "example3.com", roles: %w{app web}, active: true
        dsl.server "example4.com", roles: %w{app}, primary: true
        dsl.server "example5.com", roles: %w{db}, no_release: true
        @coordinator = mock("coordinator")
        @coordinator.expects(:each).returns(nil)
        ENV.delete "ROLES"
        ENV.delete "HOSTS"
      end

      it "filters by role from the :filter variable" 


      it "filters by host and role from the :filter variable" 


      it "filters by roles from the :filter variable" 


      it "filters by hosts and roles from the :filter variable" 


      it "filters from ENV[ROLES]" 


      it "filters from ENV[HOSTS]" 


      it "filters by ENV[HOSTS] && ENV[ROLES]" 

    end

    describe "when passed server literal names" do
      before do
        ENV.delete "ROLES"
        ENV.delete "HOSTS"
        @coordinator = mock("coordinator")
        @coordinator.expects(:each).returns(nil)
      end

      it "selects nothing when a role filter is present" 


      it "selects using the string when a host filter is present" 


      it "doesn't select when a host filter is present that doesn't match" 


      it "selects nothing when a roles filter is present" 


      it "selects using the string when a hosts filter is present" 


      it "doesn't select when a hosts filter is present that doesn't match" 

    end
  end

  describe "role_properties()" do
    before do
      dsl.role :redis, %w[example1.com example2.com], redis: { port: 6379, type: :slave }
      dsl.server "example1.com", roles: %w{web}, active: true, web: { port: 80 }
      dsl.server "example2.com", roles: %w{web redis}, web: { port: 81 }, redis: { type: :master }
      dsl.server "example3.com", roles: %w{app}, primary: true
    end

    it "retrieves properties for a single role as a set" 


    it "retrieves properties for multiple roles as a set" 


    it "yields the properties for a single role" 


    it "yields the properties for multiple roles" 


    it "yields the merged properties for multiple roles" 


    it "honours a property filter before yielding" 

  end
end

