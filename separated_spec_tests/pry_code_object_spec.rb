require_relative 'helper'

describe Pry::CodeObject do
  describe "basic lookups" do
    before do
      @obj = Object.new
      def @obj.ziggy
        "a flight of scarlet pigeons thunders round my thoughts"
      end

      class ClassyWassy
        def piggy
          binding
        end
      end

      @p = Pry.new
      @p.binding_stack = [binding]
    end

    after do
      Object.remove_const(:ClassyWassy)
    end

    it 'should lookup methods' 


    it 'should lookup modules' 


    it 'should lookup procs' 


    describe 'commands lookup' do
      before do
        @p = Pry.new
        @p.binding_stack = [binding]
      end

      it 'should return command class' 


      describe "class commands" do
        before do
          class LobsterLady < Pry::ClassCommand
            match "lobster-lady"
            description "nada."
            def process
              "lobster"
            end
          end
        end

        after do
          Object.remove_const(:LobsterLady)
        end

        it 'should return Pry::ClassCommand class when looking up class command' 


        it 'should return Pry::WrappedModule when looking up command class directly (as a class, not as a command)' 

      end

      it 'looks up commands by :listing name as well' 


      it 'finds nothing when passing nil as the first argument' 


    end

    it 'should lookup instance methods defined on classes accessed via local variable' 


    it 'should lookup class methods defined on classes accessed via local variable' 


    it 'should lookup the class of an object (when given a variable)' 


    describe "inferring object from binding when lookup str is empty/nil" do
      before do
        @b1 = Pry.binding_for(ClassyWassy)
        @b2 = Pry.binding_for(ClassyWassy.new)
      end

      describe "infer module objects" do
        it 'should infer module object when binding self is a module' 


        it 'should infer module object when binding self is an instance' 

      end

      describe "infer method objects" do
        it 'should infer method object from binding when inside method context' 

      end
    end
  end

  describe "lookups with :super" do
    before do
      class MyClassyWassy; end
      class CuteSubclass < MyClassyWassy; end
      @p = Pry.new
      @p.binding_stack = [binding]
    end

    after do
      Object.remove_const(:MyClassyWassy)
      Object.remove_const(:CuteSubclass)
    end

    it 'should lookup original class with :super => 0' 


    it 'should lookup immediate super class with :super => 1' 


    it 'should ignore :super parameter for commands' 

  end

  describe "precedence" do
    before do
      class ClassyWassy
        class Puff
          def tiggy
          end
        end

        def Puff
        end

        def piggy
        end
      end

      Object.class_eval do
        def ClassyWassy
          :ducky
        end
      end

      @p = Pry.new
      @p.binding_stack = [binding]
    end

    after do
      Object.remove_const(:ClassyWassy)
      Object.remove_method(:ClassyWassy)
    end

    it 'should look up classes before methods (at top-level)' 


    it 'should look up methods before classes when ending in () (at top-level)' 


    it 'should look up classes before methods when namespaced' 


    it 'should look up locals before methods' 


    # actually locals are never looked up (via co.default_lookup)  when they're classes, it
    # just falls through to co.method_or_class
    it 'should look up classes before locals' 

  end
end

