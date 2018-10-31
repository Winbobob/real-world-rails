require "helper"

describe Thor::Actions do
  def runner(options = {})
    @runner ||= MyCounter.new([1], options, :destination_root => destination_root)
  end

  def action(*args, &block)
    capture(:stdout) { runner.send(*args, &block) }
  end

  def file
    File.join(destination_root, "foo")
  end

  describe "on include" do
    it "adds runtime options to the base class" 

  end

  describe "#initialize" do
    it "has default behavior invoke" 


    it "can have behavior revoke" 


    it "when behavior is set to force, overwrite options" 


    it "when behavior is set to skip, overwrite options" 

  end

  describe "accessors" do
    describe "#destination_root=" do
      it "gets the current directory and expands the path to set the root" 


      it "does not use the current directory if one is given" 


      it "uses the current directory if none is given" 

    end

    describe "#relative_to_original_destination_root" do
      it "returns the path relative to the absolute root" 


      it "does not remove dot if required" 


      it "always use the absolute root" 


      it "creates proper relative paths for absolute file location" 


      it "doesn't remove the root path from the absolute path if it is not at the begining" 


      it "doesn't removes the root path from the absolute path only if it is only the partial name of the directory" 


      it "removes the root path from the absolute path only once" 


      it "does not fail with files containing regexp characters" 


      describe "#source_paths_for_search" do
        it "add source_root to source_paths_for_search" 


        it "keeps only current source root in source paths" 


        it "customized source paths should be before source roots" 


        it "keeps inherited source paths at the end" 

      end
    end

    describe "#find_in_source_paths" do
      it "raises an error if source path is empty" 


      it "finds a template inside the source path" 

    end
  end

  describe "#inside" do
    it "executes the block inside the given folder" 


    it "changes the base root" 


    it "creates the directory if it does not exist" 


    describe "when pretending" do
      it "no directories should be created" 

    end

    describe "when verbose" do
      it "logs status" 


      it "uses padding in next status" 


      it "removes padding after block" 

    end
  end

  describe "#in_root" do
    it "executes the block in the root folder" 


    it "changes the base root" 


    it "returns to the previous state" 

  end

  describe "#apply" do
    before do
      @template = <<-TEMPLATE.dup
        @foo = "FOO"
        say_status :cool, :padding
      TEMPLATE
      allow(@template).to receive(:read).and_return(@template)

      @file = "/"
      allow(runner).to receive(:open).and_return(@template)
    end

    it "accepts a URL as the path" 


    it "accepts a secure URL as the path" 


    it "accepts a local file path with spaces" 


    it "opens a file and executes its content in the instance binding" 


    it "applies padding to the content inside the file" 


    it "logs its status" 


    it "does not log status" 

  end

  describe "#run" do
    describe "when not pretending" do
      before do
        expect(runner).to receive(:system).with("ls")
      end

      it "executes the command given" 


      it "logs status" 


      it "does not log status if required" 


      it "accepts a color as status" 

    end

    describe "when pretending" do
      it "doesn't execute the command" 

    end
  end

  describe "#run_ruby_script" do
    before do
      allow(Thor::Util).to receive(:ruby_command).and_return("/opt/jruby")
      expect(runner).to receive(:system).with("/opt/jruby script.rb")
    end

    it "executes the ruby script" 


    it "logs status" 


    it "does not log status if required" 

  end

  describe "#thor" do
    it "executes the thor command" 


    it "converts extra arguments to command arguments" 


    it "converts options hash to switches" 


    it "logs status" 


    it "does not log status if required" 


    it "captures the output when :capture is given" 

  end
end

