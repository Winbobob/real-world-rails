require "spec_helper"

module Capistrano
  class Configuration
    describe Server do
      let(:server) { Server.new("root@hostname:1234") }

      describe "adding a role" do
        subject { server.add_role(:test) }
        it "adds the role" 

      end

      describe "adding roles" do
        subject { server.add_roles(%i(things stuff)) }
        it "adds the roles" 

      end

      describe "checking roles" do
        subject { server.has_role?(:test) }

        before do
          server.add_role(:test)
        end

        it "adds the role" 

      end

      describe "comparing identity" do
        subject { server.hostname == Server[hostname].hostname }

        context "with the same user, hostname and port" do
          let(:hostname) { "root@hostname:1234" }
          it { expect(subject).to be_truthy }
        end

        context "with a different user" do
          let(:hostname) { "deployer@hostname:1234" }
          it { expect(subject).to be_truthy }
        end

        context "with a different port" do
          let(:hostname) { "root@hostname:5678" }
          it { expect(subject).to be_truthy }
        end

        context "with a different hostname" do
          let(:hostname) { "root@otherserver:1234" }
          it { expect(subject).to be_falsey }
        end
      end

      describe "identifying as primary" do
        subject { server.primary }
        context "server is primary" do
          before do
            server.set(:primary, true)
          end
          it "returns self" 

        end

        context "server is not primary" do
          it "is falesy" 

        end
      end

      describe "assigning properties" do
        before do
          server.with(properties)
        end

        context "properties contains roles" do
          let(:properties) { { roles: [:clouds] } }

          it "adds the roles" 

        end

        context "properties contains user" do
          let(:properties) { { user: "tomc" } }

          it "sets the user" 


          it "sets the netssh_options user" 

        end

        context "properties contains port" do
          let(:properties) { { port: 2222 } }

          it "sets the port" 

        end

        context "properties contains key" do
          let(:properties) { { key: "/key" } }

          it "adds the key" 

        end

        context "properties contains password" do
          let(:properties) { { password: "supersecret" } }

          it "adds the key" 

        end

        context "new properties" do
          let(:properties) { { webscales: 5 } }

          it "adds the properties" 

        end

        context "existing properties" do
          let(:properties) { { webscales: 6 } }

          it "keeps the existing properties" 

        end
      end

      describe "#include?" do
        let(:options) { {} }

        subject { server.select?(options) }

        before do
          server.properties.active = true
        end

        context "options are empty" do
          it { expect(subject).to be_truthy }
        end

        context "value is a symbol" do
          context "value matches server property" do
            context "with :filter" do
              let(:options) { { filter: :active } }
              it { expect(subject).to be_truthy }
            end

            context "with :select" do
              let(:options) { { select: :active } }
              it { expect(subject).to be_truthy }
            end

            context "with :exclude" do
              let(:options) { { exclude: :active } }
              it { expect(subject).to be_falsey }
            end
          end

          context "value does not match server properly" do
            context "with :active true" do
              let(:options) { { active: true } }
              it { expect(subject).to be_truthy }
            end

            context "with :active false" do
              let(:options) { { active: false } }
              it { expect(subject).to be_falsey }
            end
          end

          context "value does not match server properly" do
            context "with :filter" do
              let(:options) { { filter: :inactive } }
              it { expect(subject).to be_falsey }
            end

            context "with :select" do
              let(:options) { { select: :inactive } }
              it { expect(subject).to be_falsey }
            end

            context "with :exclude" do
              let(:options) { { exclude: :inactive } }
              it { expect(subject).to be_truthy }
            end
          end
        end

        context "key is a property" do
          context "with :active true" do
            let(:options) { { active: true } }
            it { expect(subject).to be_truthy }
          end

          context "with :active false" do
            let(:options) { { active: false } }
            it { expect(subject).to be_falsey }
          end
        end

        context "value is a proc" do
          context "value matches server property" do
            context "with :filter" do
              let(:options) { { filter: ->(s) { s.properties.active } } }
              it { expect(subject).to be_truthy }
            end

            context "with :select" do
              let(:options) { { select: ->(s) { s.properties.active } } }
              it { expect(subject).to be_truthy }
            end

            context "with :exclude" do
              let(:options) { { exclude: ->(s) { s.properties.active } } }
              it { expect(subject).to be_falsey }
            end
          end

          context "value does not match server properly" do
            context "with :filter" do
              let(:options) { { filter: ->(s) { s.properties.inactive } } }
              it { expect(subject).to be_falsey }
            end

            context "with :select" do
              let(:options) { { select: ->(s) { s.properties.inactive } } }
              it { expect(subject).to be_falsey }
            end

            context "with :exclude" do
              let(:options) { { exclude: ->(s) { s.properties.inactive } } }
              it { expect(subject).to be_truthy }
            end
          end
        end
      end

      describe "assign ssh_options" do
        let(:server) { Server.new("user_name@hostname") }

        context "defaults" do
          it "forward agent" 

          it "contains user" 

        end

        context "custom" do
          let(:properties) do
            { ssh_options: {
              user: "another_user",
              keys: %w(/home/another_user/.ssh/id_rsa),
              forward_agent: false,
              auth_methods: %w(publickey password)
            } }
          end

          before do
            server.with(properties)
          end

          it "not forward agent" 

          it "contains correct user" 

          it "does not affect server user in host" 

          it "contains keys" 

          it "contains auth_methods" 

        end
      end

      describe ".[]" do
        it "creates a server if its argument is not already a server" 


        it "returns its argument if it is already a server" 

      end
    end
  end
end

