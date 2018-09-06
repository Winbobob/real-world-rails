require_relative 'helper'

describe Pry::Hooks do
  before do
    @hooks = Pry::Hooks.new
  end

  describe "adding a new hook" do
    it 'should not execute hook while adding it' 


    it 'should not allow adding of a hook with a duplicate name' 


    it 'should create a new hook with a block' 


    it 'should create a new hook with a callable' 


    it 'should use block if given both block and callable' 


    it 'should raise if not given a block or any other object' 


    it 'should create multiple hooks for an event' 


    it 'should return a count of 0 for an empty hook' 

  end

  describe "Pry::Hooks#merge" do
    describe "merge!" do
      it 'should merge in the Pry::Hooks' 


      it 'should not share merged elements with original' 


      it 'should NOT overwrite hooks belonging to shared event in receiver' 


      it 'should overwrite identical hook in receiver' 


      it 'should preserve hook order' 


      describe "merge" do
        it 'should return a fresh, independent instance' 


        it 'should contain hooks from original instance' 


        it 'should not affect original instances when new hooks are added' 

      end

    end
  end

  describe "dupping a Pry::Hooks instance" do
    it 'should share hooks with original' 


    it 'adding a new event to dupped instance should not affect original' 


    it 'adding a new hook to dupped instance should not affect original' 


  end

  describe "getting hooks" do
    describe "get_hook" do
      it 'should return the correct requested hook' 


      it 'should return nil if hook does not exist' 

    end

    describe "get_hooks" do
      it 'should return a hash of hook names/hook functions for an event' 


      it 'should return an empty hash if no hooks defined' 

    end
  end

  describe "clearing all hooks for an event" do
    it 'should clear all hooks' 

  end

  describe "deleting a hook" do
    it 'should successfully delete a hook' 


    it 'should return the deleted hook' 


    it 'should return nil if hook does not exist' 

  end

  describe "executing a hook" do
    it 'should execute block hook' 


    it 'should execute proc hook' 


    it 'should execute a general callable hook' 


    it 'should execute all hooks for an event if more than one is defined' 


    it 'should execute hooks in order' 


    it 'return value of exec_hook should be that of last executed hook' 


    it 'should add exceptions to the errors array' 


    it 'should return the last exception raised as the return value' 

  end

  describe "integration tests" do
    describe "when_started hook" do
      it 'should yield options to the hook' 


      describe "target" do

        it 'should yield the target, as a binding ' 


        it 'should yield the target to the hook' 

      end

      it 'should allow overriding of target (and binding_stack)' 


    end

    describe "after_session hook" do
      it 'should always run, even if uncaught exception bubbles out of repl' 


      describe "before_eval hook" do
        describe "modifying input code" do
          it 'should replace input code with code determined by hook' 


          it 'should not interfere with command processing when replacing input code' 

        end

      end

      describe "exceptions" do
        before do
          Pry.config.hooks.add_hook(:after_eval, :baddums){ raise "Baddums" }
          Pry.config.hooks.add_hook(:after_eval, :simbads){ raise "Simbads" }
        end

        after do
          Pry.config.hooks.delete_hook(:after_eval, :baddums)
          Pry.config.hooks.delete_hook(:after_eval, :simbads)
        end
        it "should not raise exceptions" 


        it "should print out a notice for each exception raised" 

      end
    end
  end

  describe "anonymous hooks" do
    it 'should allow adding of hook without a name' 


    it 'should only allow one anonymous hook to exist' 


    it 'should execute most recently added anonymous hook' 

  end

end

