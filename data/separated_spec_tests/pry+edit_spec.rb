require 'pathname'
require_relative '../helper'

describe "edit" do
  before do
    @old_editor = Pry.config.editor
    @file = @line = @contents = nil
    Pry.config.editor = lambda do |file, line|
      @file = file; @line = line; @contents = File.read(@file)
      nil
    end
  end

  after do
    Pry.config.editor = @old_editor
  end

  describe "with FILE" do
    before do
      # OS-specific tempdir name. For GNU/Linux it's "tmp", for Windows it's
      # something "Temp".
      @tf_dir =
        if Pry::Helpers::BaseHelpers.mri_19?
          Pathname.new(Dir::Tmpname.tmpdir)
        else
          Pathname.new(Dir.tmpdir)
        end

      @tf_path = File.expand_path(File.join(@tf_dir.to_s, 'bar.rb'))
      FileUtils.touch(@tf_path)
    end

    after do
      FileUtils.rm(@tf_path) if File.exist?(@tf_path)
    end

    it "should not allow patching any known kind of file" 


    it "should invoke Pry.config.editor with absolutified filenames" 


    it "should guess the line number from a colon" 


    it "should use the line number from -l" 


    it "should not delete the file!" 


    it "works with files that contain blanks in their names" 


    if respond_to?(:require_relative, true)
      it "should work with require relative" 

    end

    describe do
      before do
        Pad.counter = 0
        Pry.config.editor = lambda { |file, line|
          File.open(file, 'w') { |f| f << "Pad.counter = Pad.counter + 1" }
          nil
        }
      end

      it "should reload the file if it is a ruby file" 


      it "should not reload the file if it is not a ruby file" 


      it "should not reload a ruby file if -n is given" 


      it "should reload a non-ruby file if -r is given" 

    end

    describe do
      before do
        @reloading = nil
        Pry.config.editor = lambda do |file, line, reloading|
          @file = file; @line = line; @reloading = reloading
          nil
        end
      end

      it "should pass the editor a reloading arg" 

    end
  end

  describe "with --ex" do
    before do
      @t = pry_tester do
        def last_exception=(exception)
          @pry.last_exception = exception
        end

        def last_exception; @pry.last_exception; end
      end
    end

    describe "with a real file" do
      before do
        @tf = Tempfile.new(["pry", ".rb"])
        @path = @tf.path
        @tf << "_foo = 1\n_bar = 2\nraise RuntimeError"
        @tf.flush

        begin
          load @path
        rescue RuntimeError => e
          @t.last_exception = e
        end
      end

      after do
        @tf.close(true)
      end

      it "should reload the file" 


      # regression test (this used to edit the current method instead
      # of the exception)
      it 'edits the exception even when in a patched method context' 


      it "should not reload the file if -n is passed" 


      describe "with --patch" do
        # Original source code must be untouched.
        it "should apply changes only in memory (monkey patching)" 

      end
    end

    describe "with --ex NUM" do
      before do
        Pry.config.editor = proc do |file, line|
          @__ex_file__ = file
          @__ex_line__ = line
          nil
        end

        @t.last_exception = mock_exception('a:1', 'b:2', 'c:3')
      end

      it 'should start on first level of backtrace with just --ex' 


      it 'should start editor on first level of backtrace with --ex 0' 


      it 'should start editor on second level of backtrace with --ex 1' 


      it 'should start editor on third level of backtrace with --ex 2' 


      it 'should display error message when backtrace level is invalid' 

    end
  end

  describe "without FILE" do
    before do
      @t = pry_tester
    end

    it "should edit the current expression if it's incomplete" 


    it "should edit the previous expression if the current is empty" 


    it "should use a blank file if -t is specified" 


    it "should use a blank file if -t given, even during an expression" 


    it "should position the cursor at the end of the expression" 


    it "should evaluate the expression" 


    it "should ignore -n for tempfiles" 


    it "should not evaluate a file with -n" 


    it "should write the evaluated command to history" 

  end

  describe "with --in" do
    it "should edit the nth line of _in_" 


    it "should edit the last line if no argument is given" 


    it "should edit a range of lines if a range is given" 


    it "should edit a multi-line expression as it occupies one line of _in_" 


    it "should not work with a filename" 


    it "should not work with nonsense" 

  end

  describe 'when editing a method by name' do
    def use_editor(tester, options)
      tester.pry.config.editor = lambda do |filename, line|
        File.open(filename, 'w') { |f| f.write options.fetch(:replace_all) }
        nil
      end
      tester
    end

    it 'uses patch editing on methods that were previously patched' 


    it 'can repeatedly edit methods that were defined in the console' 

  end

  describe "old edit-method tests now migrated to edit" do
    describe "on a method defined in a file" do
      before do
        Object.remove_const :X if defined? ::X
        Object.remove_const :A if defined? ::A
        @tempfile = (Tempfile.new(['pry', '.rb']))
        @tempfile.puts <<-EOS
        module A
          def a
            :yup
          end

          def b
            :kinda
          end
        end

        class X
          include A

          def self.x
            :double_yup
          end

          def x
            :nope
          end

          def b
            super
          end
          alias c b

          def y?
            :because
          end

          class B
            G = :nawt

            def foo
              _foo = :possibly
              G
            end
          end
        end
        EOS
        @tempfile.flush
        load @tempfile.path

        @tempfile_path = @tempfile.path
      end

      after do
        @tempfile.close(true)
      end

      describe 'without -p' do
        before do
          @file = @line = @contents = nil
          Pry.config.editor = lambda do |file, line|
            @file = file; @line = line
            nil
          end
        end

        it "should correctly find a class method" 


        it "should correctly find an instance method" 


        it "should correctly find a method on an instance" 


        it "should correctly find a method from a module" 


        it "should correctly find an aliased method" 

      end

      describe 'with -p' do
        before do
          Pry.config.editor = lambda do |file, line|
            lines = File.read(file).lines.to_a
            lines[1] = if lines[2] =~ /end/
                         ":maybe\n"
                       else
                         "_foo = :maybe\n"
                       end
            File.open(file, 'w') do |f|
              f.write(lines.join)
            end
            @patched_def = String(lines[1]).chomp
            nil
          end
        end

        it "should successfully replace a class method" 


        it "should successfully replace an instance method" 


        it "should successfully replace a method on an instance" 


        it "should successfully replace a method from a module" 


        it "should successfully replace a method with a question mark" 


        it "should preserve module nesting" 


        describe "monkey-patching" do
          before do
            @edit = 'edit --patch ' # A shortcut.
          end

          # @param [Integer] lineno
          # @return [String] the stripped line from the tempfile at +lineno+
          def stripped_line_at(lineno)
            @tempfile.rewind
            @tempfile.each_line.to_a[lineno].strip
          end

          # Applies the monkey patch for +method+ with help of evaluation of
          # +eval_strs+. The idea is to capture the initial line number (before
          # the monkey patch), because it gets overwritten by the line number from
          # the monkey patch. And our goal is to check that the original
          # definition hasn't changed.
          # @param [UnboundMethod] method
          # @param [Array<String>] eval_strs
          # @return [Array<String] the lines with definitions of the same line
          #   before monkey patching and after (normally, they should be equal)
          def apply_monkey_patch(method, *eval_strs)
            _, lineno = method.source_location
            definition_before = stripped_line_at(lineno)

            pry_eval(*eval_strs)

            definition_after = stripped_line_at(lineno)

            [definition_before, definition_after]
          end

          it "should work for a class method" 


          it "should work for an instance method" 


          it "should work for a method on an instance" 


          it "should work for a method from a module" 


          it "should work for a method with a question mark" 


          it "should work with nesting" 

        end
      end

      describe 'on an aliased method' do
        before do
          Pry.config.editor = lambda do |file, line|
            lines = File.read(file).lines.to_a
            lines[1] = '"#{super}aa".to_sym' + "\n"
            File.open(file, 'w') do |f|
              f.write(lines.join)
            end
            nil
          end
        end

        it "should change the alias, but not the original, without breaking super" 

      end

      describe 'with three-arg editor' do
        before do
          @file = @line = @reloading = nil
          Pry.config.editor = lambda do |file, line, reloading|
            @file = file; @line = line; @reloading = reloading
            nil
          end
        end

        it "should pass the editor a reloading arg" 

      end
    end
  end

  describe "--method flag" do
    before do
      @t = pry_tester
      class BinkyWink
        eval %{
          def m1
            binding
          end
        }

        def m2
          _foo = :jeremy_jones
          binding
        end
      end
    end

    after do
      Object.remove_const(:BinkyWink)
    end

    it 'should edit method context' 


    it 'errors when cannot find method context' 


    it 'errors when a filename arg is passed with --method' 

  end

  describe "pretty error messages" do
    before do
      @t = pry_tester
      class TrinkyDink
        eval %{
          def m
          end
        }
      end
    end

    after do
      Object.remove_const(:TrinkyDink)
    end

    it 'should display a nice error message when cannot open a file' 

  end
end

