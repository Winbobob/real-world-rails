require 'rails_helper'

describe DotHelper do
  describe "with example Agents" do
    class Agents::DotFoo < Agent
      default_schedule "2pm"

      def check
        create_event :payload => {}
      end
    end

    class Agents::DotBar < Agent
      cannot_be_scheduled!

      def check
        create_event :payload => {}
      end
    end

    before do
      stub(Agents::DotFoo).valid_type?("Agents::DotFoo") { true }
      stub(Agents::DotBar).valid_type?("Agents::DotBar") { true }
    end

    describe "#agents_dot" do
      before do
        @agents = [
          @foo = Agents::DotFoo.new(name: "foo").tap { |agent|
            agent.user = users(:bob)
            agent.save!
          },

          @bar1 = Agents::DotBar.new(name: "bar1").tap { |agent|
            agent.user = users(:bob)
            agent.sources << @foo
            agent.save!
          },

          @bar2 = Agents::DotBar.new(name: "bar2").tap { |agent|
            agent.user = users(:bob)
            agent.sources << @foo
            agent.propagate_immediately = true
            agent.disabled = true
            agent.save!
          },

          @bar3 = Agents::DotBar.new(name: "bar3").tap { |agent|
            agent.user = users(:bob)
            agent.sources << @bar2
            agent.save!
          },
        ]
        @foo.reload
        @bar2.reload

        # Fix the order of receivers
        @agents.each do |agent|
          stub.proxy(agent).receivers { |orig| orig.order(:id) }
        end
      end

      it "generates a DOT script" 


      it "generates a richer DOT script" 

    end
  end

  describe "DotHelper::DotDrawer" do
    describe "#id" do
      it "properly escapes double quotaion and backslash" 

    end
  end
end

