require "spec_helper"

module Capistrano
  class DummyTaskEnhancements
    include TaskEnhancements
  end

  describe TaskEnhancements do
    let(:task_enhancements) { DummyTaskEnhancements.new }

    describe "ordering" do
      after do
        task.clear
        before_task.clear
        after_task.clear
        Rake::Task.clear
      end

      let(:order) { [] }
      let!(:task) do
        Rake::Task.define_task("task", [:order]) do |_t, args|
          args["order"].push "task"
        end
      end

      let!(:before_task) do
        Rake::Task.define_task("before_task") do
          order.push "before_task"
        end
      end

      let!(:after_task) do
        Rake::Task.define_task("after_task") do
          order.push "after_task"
        end
      end

      it "invokes in proper order if define after than before" 


      it "invokes in proper order if define before than after" 


      it "invokes in proper order when referring to as-yet undefined tasks" 


      it "invokes in proper order and with arguments and block" 


      it "invokes using the correct namespace when defined within a namespace" 


      it "raises a sensible error if the task isn't found" 

    end
  end
end

