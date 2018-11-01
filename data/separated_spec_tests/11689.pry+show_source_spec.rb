require_relative '../helper'
require "fixtures/show_source_doc_examples"

describe "show-source" do
  before do
    @o = Object.new
    def @o.sample_method
      :sample
    end

    Object.remove_const :Test if Object.const_defined? :Test
    Object.const_set(:Test, Module.new)
  end

  after do
    Pad.clear
  end

  it "should output a method's source" 


  it "should output help" 


  it "should output a method's source with line numbers" 


  it "should output a method's source with line numbers starting at 1" 


  it "should output a method's source if inside method and no name given" 


  it "should output a method's source inside method using the -l switch" 


  it "should find methods even if there are spaces in the arguments" 


  it "should find methods even if the object overrides method method" 


  it "should not show the source when a non-extant method is requested" 


  it "should not show the source and deliver an error message without exclamation point" 



  it "should find instance_methods if the class overrides instance_method" 


  it "should find instance methods with self#moo" 


  it "should not find instance methods with self.moo" 


  it "should find normal methods with self.moo" 


  it "should not find normal methods with self#moo" 


  it "should find normal methods (i.e non-instance methods) by default" 


  it "should find instance methods if no normal methods available" 


  describe "with -e option" do
    before do
      class FooBar
        def bar
          :bar
        end
      end
    end

    after do
      Object.remove_const(:FooBar)
    end

    it "evaluates the argument as ruby and shows the source code for the returned value" 

  end

  it "should raise a CommandError when super method doesn't exist" 


  it "should output the source of a method defined inside Pry" 


  it 'should output source for an instance method defined inside pry' 


  it 'should output source for a repl method defined using define_method' 


  it "should output the source of a command defined inside Pry" 


  context "when there's no source code but the comment exists" do
    before do
      class Foo
        # Bingo.
        def bar; end
      end

      allow_any_instance_of(Pry::Method).to receive(:source).and_return(nil)
    end

    after do
      Object.remove_const(:Foo)
    end

    it "outputs zero line numbers" 

  end

  describe "finding super methods with help of `--super` switch" do
    before do
      class Foo
        def foo(*_bars)
          :super_wibble
        end
      end
    end

    after do
      Object.remove_const(:Foo)
    end

    it "finds super methods with explicit method argument" 


    it "finds super methods without explicit method argument" 


    it "finds super methods with multiple --super " 

  end

  describe "on sourcable objects" do
    it "should output source defined inside pry" 


    it "should output source for procs/lambdas stored in variables" 


    it "should output source for procs/lambdas stored in constants" 


    it "should output source for method objects" 


    describe "on variables that shadow methods" do
      before do
        @t = pry_tester.eval unindent(<<-EOS)
          class ::TestHost
            def hello
              hello = proc { ' smile ' }
              _foo = hello
              pry_tester(binding)
            end
          end
          ::TestHost.new.hello
          EOS
        end

        after do
          Object.remove_const(:TestHost)
        end

        it "source of variable should take precedence over method that is being shadowed" 


        it "source of method being shadowed should take precedence over variable
          if given self.meth_name syntax" do
          expect(@t.eval('show-source self.hello')).to match(/def hello/)
        end
      end
    end

    describe "on variable or constant" do
      before do
        class TestHost
          def hello
            "hi there"
          end
        end
      end

      after do
        Object.remove_const(:TestHost)
      end

      it "should output source of its class if variable doesn't respond to source_location" 


      it "should output source of its class if constant doesn't respond to source_location" 

    end

    describe "on modules" do
      before do
        class ShowSourceTestSuperClass
          def alpha
          end
        end

        class ShowSourceTestClass<ShowSourceTestSuperClass
          def alpha
          end
        end

        module ShowSourceTestSuperModule
          def alpha
          end
        end

        module ShowSourceTestModule
          include ShowSourceTestSuperModule
          def alpha
          end
        end

        ShowSourceTestClassWeirdSyntax = Class.new do
          def beta
          end
        end

        ShowSourceTestModuleWeirdSyntax = Module.new do
          def beta
          end
        end
      end

      after do
        Object.remove_const :ShowSourceTestSuperClass
        Object.remove_const :ShowSourceTestClass
        Object.remove_const :ShowSourceTestClassWeirdSyntax
        Object.remove_const :ShowSourceTestSuperModule
        Object.remove_const :ShowSourceTestModule
        Object.remove_const :ShowSourceTestModuleWeirdSyntax
      end

      describe "basic functionality, should find top-level module definitions" do
        it 'should show source for a class' 


        it 'should show source for a super class' 


        it 'should show source for a module' 


        it 'should show source for an ancestor module' 


        it 'should show source for a class when Const = Class.new syntax is used' 


        it 'should show source for a super class when Const = Class.new syntax is used' 


        it 'should show source for a module when Const = Module.new syntax is used' 

      end

      before do
        pry_eval unindent(<<-EOS)
        class Dog
          def woof
          end
        end

        class TobinaMyDog < Dog
          def woof
          end
        end
        EOS
      end

      after do
        Object.remove_const :Dog
        Object.remove_const :TobinaMyDog
      end

      describe "in REPL" do
        it 'should find class defined in repl' 


        it 'should find superclass defined in repl' 

      end

      it 'should lookup module name with respect to current context' 


      it 'should lookup nested modules' 


      # note that pry assumes a class is only monkey-patched at most
      # ONCE per file, so will not find multiple monkeypatches in the
      # SAME file.
      describe "show-source -a" do
        it 'should show the source for all monkeypatches defined in different files' 


        it 'should show the source for a class_eval-based monkeypatch' 


        it 'should ignore -a when object is not a module' 


        it 'should show the source for an instance_eval-based monkeypatch' 


        describe "messages relating to -a" do
          it 'indicates all available monkeypatches can be shown with -a when (when -a not used and more than one candidate exists for class)' 


          it 'shouldnt say anything about monkeypatches when only one candidate exists for selected class' 

        end
      end

      describe "when show-source is invoked without a method or class argument" do
        before do
          module TestHost
            class M
              def alpha; end

              def beta; end
            end

            module C
            end

            module D
              def self.invoked_in_method
                pry_eval(binding, 'show-source')
              end
            end
          end
        end

        after do
          Object.remove_const(:TestHost)
        end

        describe "inside a module" do
          it 'should display module source by default' 


          it 'should be unable to find module source if no methods defined' 


          it 'should display method code (rather than class) if Pry started inside method binding' 


          it 'should display class source when inside instance' 


          it 'should allow options to be passed' 


          describe "should skip over broken modules" do
            before do
              module BabyDuck

                module Muesli
                  binding.eval("def a; end", "dummy.rb", 1)
                  binding.eval("def b; end", "dummy.rb", 2)
                  binding.eval("def c; end", "dummy.rb", 3)
                end

                module Muesli
                  def d; end

                  def e; end
                end
              end
            end

            after do
              Object.remove_const(:BabyDuck)
            end

            it 'should return source for first valid module' 

          end

          describe "monkey-patched C modules" do
            # Monkey-patch Array and add 15 methods, so its internal rank is
            # high enough to make this definition primary.
            class Array
              15.times do |i|
                define_method(:"doge#{i}") do
                  :"doge#{i}"
                end
              end
            end

            describe "when current context is a C object" do
              it "should display a warning, and not monkey-patched definition" 


              it "recommends to use the --all switch when other candidates are found" 

            end

            describe "when current context is something other than a C object" do
              it "should display a candidate, not a warning" 

            end
          end
        end
      end
    end

    describe "on commands" do
      before do
        @oldset = Pry.config.commands
        @set = Pry.config.commands = Pry::CommandSet.new do
          import Pry::Commands
        end
      end

      after do
        Pry.config.commands = @oldset
      end

      describe "block commands" do
        it 'should show source for an ordinary command' 


        it "should output source of commands using special characters" 


        it 'should show source for a command with spaces in its name' 


        it 'should show source for a command by listing name' 

      end

      describe "create_command commands" do
        it 'should show source for a command' 


        it 'should show source for a command defined inside pry' 


        Pry.config.commands.add_command(::TemporaryCommand)
      end

      after do
        Object.remove_const(:TemporaryCommand)
      end

      it 'should show source for a command' 


      it 'should show source for a command defined inside pry' 

    end
  end

  describe "should set _file_ and _dir_" do
    it 'should set _file_ and _dir_ to file containing method source' 

  end

  describe "can't find class/module code" do
    describe "for classes" do
      before do
        module Jesus
          module Pig
            def lillybing; :lillybing; end
          end

          class Brian; end
          class Jingle
            def a; :doink; end
          end

          class Jangle < Jingle; include Pig; end
          class Bangle < Jangle; end
        end
      end

      after do
        Object.remove_const(:Jesus)
      end

      it 'shows superclass code' 


      it 'ignores included modules' 


      it 'errors when class has no superclass to show' 


      it 'shows warning when reverting to superclass code' 


      it 'shows nth level superclass code (when no intermediary superclasses have code either)' 


      it 'shows correct warning when reverting to nth level superclass' 

    end

    describe "for modules" do
      before do
        module Jesus
          module Alpha
            def alpha; :alpha; end
          end

          module Zeta; end

          module Beta
            include Alpha
          end

          module Gamma
            include Beta
          end
        end
      end

      after do
        Object.remove_const(:Jesus)
      end

      it 'shows included module code' 


      it 'shows warning when reverting to included module code' 


      it 'errors when module has no included module to show' 


      it 'shows nth level included module code (when no intermediary modules have code either)' 


      it 'shows correct warning when reverting to nth level included module' 

    end
  end
end

