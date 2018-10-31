require_relative '../helper'
require "fixtures/show_source_doc_examples"

describe "show-doc" do
  before do
    @o = Object.new

    # sample doc
    def @o.sample_method
      :sample
    end

    def @o.no_docs;end

  end

  after do
    if Symbol.method_defined? :call
      Symbol.class_eval { undef :call }
    end
  end

  it 'should work even if #call is defined on Symbol' 


  it 'should output a method\'s documentation' 


  it 'should raise exception when cannot find docs' 


  it 'should output a method\'s documentation with line numbers' 


  it 'should output a method\'s documentation with line numbers (base one)' 


  it 'should output a method\'s documentation if inside method without needing to use method name' 


  describe "finding find super method docs with help of `--super` switch" do
    before do
      class Daddy
        # daddy initialize!
        def initialize(*args); end
      end

      class Classy < Daddy
        # classy initialize!
        def initialize(*args); end
      end

      class Grungy < Classy
        # grungy initialize??
        def initialize(*args); end
      end

      @o = Grungy.new

      # instancey initialize!
      def @o.initialize; end
    end

    after do
      Object.remove_const(:Grungy)
      Object.remove_const(:Classy)
      Object.remove_const(:Daddy)
    end

    it "finds super method docs" 


    it "traverses ancestor chain and finds super method docs" 


    it "traverses ancestor chain even higher and finds super method doc" 


    it "finds super method docs without explicit method argument" 


    it "finds super method docs without `--super` but with the `super` keyword" 

  end

  describe "rdoc highlighting" do
    it "should syntax highlight code in rdoc" 


    it "should syntax highlight `code` in rdoc" 


    it "should not syntax highlight `` inside code" 

  end

  describe "on sourcable objects" do
    it "should show documentation for object" 

  end

  describe "on modules" do
    before do
      # god this is boring1
      class ShowSourceTestClass
        def alpha
        end
      end

      # god this is boring2
      module ShowSourceTestModule
        def alpha
        end
      end

      # god this is boring3
      ShowSourceTestClassWeirdSyntax = Class.new do
        def beta
        end
      end

      # god this is boring4
      ShowSourceTestModuleWeirdSyntax = Module.new do
        def beta
        end
      end
    end

    after do
      Object.remove_const :ShowSourceTestClass
      Object.remove_const :ShowSourceTestClassWeirdSyntax
      Object.remove_const :ShowSourceTestModule
      Object.remove_const :ShowSourceTestModuleWeirdSyntax
    end

    describe "basic functionality, should show docs for top-level module definitions" do
      it 'should show docs for a class' 


      it 'should show docs for a module' 


      it 'should show docs for a class when Const = Class.new syntax is used' 


      it 'should show docs for a module when Const = Module.new syntax is used' 

    end

    describe "in REPL" do
      it 'should find class defined in repl' 

    end

    it 'should lookup module name with respect to current context' 


    it 'should look up nested modules' 


    describe "show-doc -a" do
      it 'should show the docs for all monkeypatches defined in different files' 


      describe "messages relating to -a" do
        it "displays the original definition by default (not a doc of a monkeypatch)" 


        it 'indicates all available monkeypatches can be shown with -a ' \
          '(when -a not used and more than one candidate exists for class)' do
          # Still reading boring tests, eh?
          class TestClassForShowSource
            def delta
            end
          end

          result = pry_eval('show-doc TestClassForShowSource')
          expect(result).to match(/available monkeypatches/)
        end

        it 'shouldnt say anything about monkeypatches when only one candidate exists for selected class' 

      end
    end

    describe "when no class/module arg is given" do
      before do
        module TestHost

          # hello there froggy
          module M
            def d; end

            def e; end
          end
        end
      end

      after do
        Object.remove_const(:TestHost)
      end

      it 'should return doc for current module' 

    end

    # FIXME: THis is nto a good spec anyway, because i dont think it
    # SHOULD skip!
    describe "should skip over broken modules" do
      before do
        module TestHost
          # hello
          module M
            binding.eval("def a; end", "dummy.rb", 1)
            binding.eval("def b; end", "dummy.rb", 2)
            binding.eval("def c; end", "dummy.rb", 3)
          end

          # goodbye
          module M
            def d; end

            def e; end
          end
        end
      end

      after do
        Object.remove_const(:TestHost)
      end

      it 'should return doc for first valid module' 

    end
  end

  describe "on commands" do
    # mostly copied & modified from test_help.rb
    before do
      @oldset = Pry.config.commands
      @set = Pry.config.commands = Pry::CommandSet.new do
        import Pry::Commands
      end
    end

    after do
      Pry.config.commands = @oldset
    end

    it 'should display help for a specific command' 


    it 'should display help for a regex command with a "listing"' 


    it 'should display help for a command with a spaces in its name' 


    describe "class commands" do
      before do
        # pretty pink pincers
        class LobsterLady < Pry::ClassCommand
          match "lobster-lady"
          description "nada."
          def process
            "lobster"
          end
        end

        Pry.config.commands.add_command(LobsterLady)
      end

      after do
        Object.remove_const(:LobsterLady)
      end

      it 'should display "help" when looking up by command name' 


      it 'should display actual preceding comment for a class command, when class is used (rather than command name) when looking up' 

    end
  end

  describe "should set _file_ and _dir_" do
    it 'should set _file_ and _dir_ to file containing method source' 

  end

  describe "can't find class docs" do
    describe "for classes" do
      before do
        module Jesus
          class Brian; end

          # doink-doc
          class Jingle
            def a; :doink; end
          end

          class Jangle < Jingle; end
          class Bangle < Jangle; end
        end
      end

      after do
        Object.remove_const(:Jesus)
      end

      it 'shows superclass doc' 


      it 'errors when class has no superclass to show' 


      it 'shows warning when reverting to superclass docs' 


      it 'shows nth level superclass docs (when no intermediary superclasses have code either)' 


      it 'shows correct warning when reverting to nth level superclass' 

    end

    describe "for modules" do
      before do
        module Jesus

          # alpha-doc
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

      it 'shows included module doc' 


      it 'shows warning when reverting to included module doc' 


      it 'errors when module has no included module to show' 


      it 'shows nth level included module doc (when no intermediary modules have code either)' 


      it 'shows correct warning when reverting to nth level included module' 

    end
  end
end

