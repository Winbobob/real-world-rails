require "spec_helper"

module Capistrano
  class Configuration
    describe Servers do
      let(:servers) { Servers.new }

      describe "adding a role" do
        it "adds two new server instances" 


        it "handles de-duplification within roles" 


        it "handles de-duplification within roles with users" 


        it "accepts instances of server objects" 


        it "accepts non-enumerable types" 


        it "creates distinct server properties" 

      end

      describe "adding a role to an existing server" do
        before do
          servers.add_role(:web, %w{1 2})
          servers.add_role(:app, %w{1 2})
        end

        it "adds new roles to existing servers" 

      end

      describe "collecting server roles" do
        let(:app) { Set.new([:app]) }
        let(:web_app) { Set.new(%i(web app)) }
        let(:web) { Set.new([:web]) }

        before do
          servers.add_role(:app, %w{1 2 3})
          servers.add_role(:web, %w{2 3 4})
        end

        it "returns an array of the roles" 

      end

      describe "finding the primary server" do
        after do
          Configuration.reset!
        end
        it "takes the first server if none have the primary property" 


        it "takes the first server with the primary have the primary flag" 


        it "ignores any on_filters" 

      end

      describe "fetching servers" do
        before do
          servers.add_role(:app, %w{1 2})
          servers.add_role(:web, %w{2 3})
        end

        it "returns the correct app servers" 


        it "returns the correct web servers" 


        it "returns the correct app and web servers" 


        it "returns all servers" 

      end

      describe "adding a server" do
        before do
          servers.add_host("1", roles: [:app, "web"], test: :value)
        end

        it "can create a server with properties" 


        it "can accept multiple servers with the same hostname but different ports or users" 


        describe "with a :user property" do
          it "sets the server ssh username" 


          it "overwrites the value of a user specified in the hostname" 

        end

        it "overwrites the value of a previously defined scalar property" 


        it "merges previously defined hash properties" 


        it "concatenates previously defined array properties" 


        it "merges previously defined set properties" 


        it "adds array property value only ones for a new host" 


        it "updates roles when custom user defined" 


        it "updates roles when custom port defined" 

      end

      describe "selecting roles" do
        before do
          servers.add_host("1", roles: :app, active: true)
          servers.add_host("2", roles: :app)
        end

        it "is empty if the filter would remove all matching hosts" 


        it "can filter hosts by properties on the host object using symbol as shorthand" 


        it "can select hosts by properties on the host object using symbol as shorthand" 


        it "can filter hosts by properties on the host using a regular proc" 


        it "can select hosts by properties on the host using a regular proc" 


        it "is empty if the regular proc filter would remove all matching hosts" 

      end

      describe "excluding by property" do
        before do
          servers.add_host("1", roles: :app, active: true)
          servers.add_host("2", roles: :app, active: true, no_release: true)
        end

        it "is empty if the filter would remove all matching hosts" 


        it "returns the servers without the attributes specified" 


        it "can exclude hosts by properties on the host using a regular proc" 


        it "is empty if the regular proc filter would remove all matching hosts" 

      end

      describe "filtering roles internally" do
        before do
          servers.add_host("1", roles: :app, active: true)
          servers.add_host("2", roles: :app)
          servers.add_host("3", roles: :web)
          servers.add_host("4", roles: :web)
          servers.add_host("5", roles: :db)
        end

        subject { servers.roles_for(roles).map(&:hostname) }

        context "with the ROLES environment variable set" do
          before do
            ENV.stubs(:[]).with("ROLES").returns("web,db")
            ENV.stubs(:[]).with("HOSTS").returns(nil)
          end

          context "when selecting all roles" do
            let(:roles) { [:all] }
            it "ignores it" 

          end

          context "when selecting specific roles" do
            let(:roles) { %i(app web) }
            it "ignores it" 

          end

          context "when selecting roles not included in ROLE" do
            let(:roles) { [:app] }
            it "ignores it" 

          end
        end

        context "with the HOSTS environment variable set" do
          before do
            ENV.stubs(:[]).with("ROLES").returns(nil)
            ENV.stubs(:[]).with("HOSTS").returns("3,5")
          end

          context "when selecting all roles" do
            let(:roles) { [:all] }
            it "ignores it" 

          end

          context "when selecting specific roles" do
            let(:roles) { %i(app web) }
            it "ignores it" 

          end

          context "when selecting no roles" do
            let(:roles) { [] }
            it "ignores it" 

          end
        end
      end
    end
  end
end

