require "helper"
require "thor/actions"

describe Thor::Actions::Directory do
  before do
    ::FileUtils.rm_rf(destination_root)
    allow(invoker).to receive(:file_name).and_return("rdoc")
  end

  def invoker
    @invoker ||= WhinyGenerator.new([1, 2], {}, :destination_root => destination_root)
  end

  def revoker
    @revoker ||= WhinyGenerator.new([1, 2], {}, :destination_root => destination_root, :behavior => :revoke)
  end

  def invoke!(*args, &block)
    capture(:stdout) { invoker.directory(*args, &block) }
  end

  def revoke!(*args, &block)
    capture(:stdout) { revoker.directory(*args, &block) }
  end

  def exists_and_identical?(source_path, destination_path)
    %w(config.rb README).each do |file|
      source      = File.join(source_root, source_path, file)
      destination = File.join(destination_root, destination_path, file)

      expect(File.exist?(destination)).to be true
      expect(FileUtils.identical?(source, destination)).to be true
    end
  end

  describe "#invoke!" do
    it "raises an error if the source does not exist" 


    it "does not create a directory in pretend mode" 


    it "copies the whole directory recursively to the default destination" 


    it "copies the whole directory recursively to the specified destination" 


    it "copies only the first level files if recursive" 


    it "ignores files within excluding/ directories when exclude_pattern is provided" 


    it "copies and evaluates files within excluding/ directory when no exclude_pattern is present" 


    it "copies files from the source relative to the current path" 


    it "copies and evaluates templates" 


    it "copies directories and preserves file mode" 


    it "copies directories" 


    it "does not copy .empty_directory files" 


    it "copies directories even if they are empty" 


    it "does not copy empty directories twice" 


    it "logs status" 


    it "yields a block" 


    it "works with glob characters in the path" 

  end

  describe "#revoke!" do
    it "removes the destination file" 


    it "works with glob characters in the path" 

  end
end

