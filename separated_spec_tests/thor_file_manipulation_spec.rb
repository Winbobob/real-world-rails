require "helper"

class Application; end
module ApplicationHelper; end

describe Thor::Actions do
  def runner(options = {})
    @runner ||= MyCounter.new([1], options, :destination_root => destination_root)
  end

  def action(*args, &block)
    capture(:stdout) { runner.send(*args, &block) }
  end

  def exists_and_identical?(source, destination)
    destination = File.join(destination_root, destination)
    expect(File.exist?(destination)).to be true

    source = File.join(source_root, source)
    expect(FileUtils).to be_identical(source, destination)
  end

  def file
    File.join(destination_root, "foo")
  end

  before do
    ::FileUtils.rm_rf(destination_root)
  end

  describe "#chmod" do
    it "executes the command given" 


    it "does not execute the command if pretending" 


    it "logs status" 


    it "does not log status if required" 

  end

  describe "#copy_file" do
    it "copies file from source to default destination" 


    it "copies file from source to the specified destination" 


    it "copies file from the source relative to the current path" 


    it "copies file from source to default destination and preserves file mode" 


    it "logs status" 


    it "accepts a block to change output" 

  end

  describe "#link_file" do
    it "links file from source to default destination" 


    it "links file from source to the specified destination" 


    it "links file from the source relative to the current path" 


    it "logs status" 

  end

  describe "#get" do
    it "copies file from source to the specified destination" 


    it "uses just the source basename as destination if none is specified" 


    it "allows the destination to be set as a block result" 


    it "yields file content to a block" 


    it "logs status" 


    it "accepts http remote sources" 


    it "accepts https remote sources" 

  end

  describe "#template" do
    it "allows using block helpers in the template" 


    it "evaluates the template given as source" 


    it "copies the template to the specified destination" 


    it "converts encoded instructions" 


    it "accepts filename without .tt for template method" 


    it "logs status" 


    it "accepts a block to change output" 


    it "accepts a context to use as the binding" 


    it "guesses the destination name when given only a source" 


    it "has proper ERB stacktraces" 

  end

  describe "when changing existent files" do
    before do
      ::FileUtils.cp_r(source_root, destination_root)
    end

    def file
      File.join(destination_root, "doc", "README")
    end

    describe "#remove_file" do
      it "removes the file given" 


      it "removes directories too" 


      it "does not remove if pretending" 


      it "logs status" 


      it "does not log status if required" 

    end

    describe "#gsub_file" do
      it "replaces the content in the file" 


      it "does not replace if pretending" 


      it "accepts a block" 


      it "logs status" 


      it "does not log status if required" 

    end

    describe "#append_to_file" do
      it "appends content to the file" 


      it "accepts a block" 


      it "logs status" 

    end

    describe "#prepend_to_file" do
      it "prepends content to the file" 


      it "accepts a block" 


      it "logs status" 

    end

    describe "#inject_into_class" do
      def file
        File.join(destination_root, "application.rb")
      end

      it "appends content to a class" 


      it "accepts a block" 


      it "logs status" 


      it "does not append if class name does not match" 

    end

    describe "#inject_into_module" do
      def file
        File.join(destination_root, "application_helper.rb")
      end

      it "appends content to a module" 


      it "accepts a block" 


      it "logs status" 


      it "does not append if class name does not match" 

    end
  end

  describe "when adjusting comments" do
    before do
      ::FileUtils.cp_r(source_root, destination_root)
    end

    def file
      File.join(destination_root, "doc", "COMMENTER")
    end

    unmodified_comments_file = /__start__\n # greenblue\n#\n# yellowblue\n#yellowred\n #greenred\norange\n    purple\n  ind#igo\n  # ind#igo\n__end__/

    describe "#uncomment_lines" do
      it "uncomments all matching lines in the file" 


      it "correctly uncomments lines with hashes in them" 


      it "does not modify already uncommented lines in the file" 


      it "does not uncomment the wrong line when uncommenting lines preceded by blank commented line" 

    end

    describe "#comment_lines" do
      it "comments lines which are not commented" 


      it "correctly comments lines with hashes in them" 


      it "does not modify already commented lines" 

    end
  end
end

