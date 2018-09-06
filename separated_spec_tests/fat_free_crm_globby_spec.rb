require 'globby'

describe Globby do
  it "should support chaining" 


  describe ".select" do
    context "a blank line" do
      it "should return nothing" 

    end

    context "a comment" do
      it "should return nothing" 

    end

    context "a pattern ending in a slash" do
      it "should return a matching directory's contents" 


      it "should ignore symlinks and regular files" 

    end

    context "a pattern starting in a slash" do
      it "should return only root glob matches" 

    end

    context "a pattern with a *" do
      it "should return matching files" 


      it "should not glob slashes" 

    end

    context "a pattern with a ?" do
      it "should return matching files" 


      it "should not glob slashes" 

    end

    context "a pattern with a **" do
      it "should match directories recursively" 

    end

    context "a pattern with bracket expressions" do
      it "should return matching files" 

    end
  end

  def files(files)
    files = Array(files)
    files.sort!
    dirs = files.grep(/\//).map(&:dup).inject([]) { |ary, file|
      ary << file while file.sub!(/[^\/]+\z/, '')
      ary
    }.uniq.sort
    Globby::GlObject.new files, dirs
  end
end

