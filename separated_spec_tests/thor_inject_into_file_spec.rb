# encoding: utf-8
require "helper"
require "thor/actions"

describe Thor::Actions::InjectIntoFile do
  before do
    ::FileUtils.rm_rf(destination_root)
    ::FileUtils.cp_r(source_root, destination_root)
  end

  def invoker(options = {})
    @invoker ||= MyCounter.new([1, 2], options, :destination_root => destination_root)
  end

  def revoker
    @revoker ||= MyCounter.new([1, 2], {}, :destination_root => destination_root, :behavior => :revoke)
  end

  def invoke!(*args, &block)
    capture(:stdout) { invoker.insert_into_file(*args, &block) }
  end

  def revoke!(*args, &block)
    capture(:stdout) { revoker.insert_into_file(*args, &block) }
  end

  def file
    File.join(destination_root, "doc/README")
  end

  describe "#invoke!" do
    it "changes the file adding content after the flag" 


    it "changes the file adding content before the flag" 


    it "accepts data as a block" 


    it "logs status" 


    it "does not change the file if pretending" 


    it "does not change the file if already includes content" 


    it "does not attempt to change the file if it doesn't exist - instead raises Thor::Error" 


    it "does not attempt to change the file if it doesn't exist and pretending" 


    it "does change the file if already includes content and :force is true" 


    it "can insert chinese" 

  end

  describe "#revoke!" do
    it "subtracts the destination file after injection" 


    it "subtracts the destination file before injection" 


    it "subtracts even with double after injection" 


    it "subtracts even with double before injection" 


    it "subtracts when prepending" 


    it "subtracts when appending" 


    it "shows progress information to the user" 

  end
end

