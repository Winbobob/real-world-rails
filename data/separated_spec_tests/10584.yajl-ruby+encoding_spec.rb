# encoding: UTF-8
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper.rb')
require 'tmpdir'
require 'zlib'

class Dummy2
  def to_json
    "{\"hawtness\":true}"
  end
end

class TheMindKiller
  def to_json
    nil
  end
end

class TheMindKillerDuce
  def to_s
    nil
  end
end

describe "Yajl JSON encoder" do
  FILES = Dir[File.dirname(__FILE__)+'/../../benchmark/subjects/*.json']

  FILES.each do |file|
     it "should encode #{File.basename(file)} to an StringIO" 

   end

   FILES.each do |file|
     it "should encode #{File.basename(file)} to a Zlib::GzipWriter" 

   end

   FILES.each do |file|
     it "should encode #{File.basename(file)} and return a String" 

   end

   FILES.each do |file|
     it "should encode #{File.basename(file)} call the passed block, passing it a String" 

   end

  it "should encode with :pretty turned on and a single space indent, to an IO" 


  it "should encode with :pretty turned on and a single space indent, and return a String" 


  it "should encode with :pretty turned on and a tab character indent, to an IO" 


  it "should encode with :pretty turned on and a tab character indent, and return a String" 


  it "should encode with it's class method with :pretty and a tab character indent options set, to an IO" 


  it "should encode with it's class method with :pretty and a tab character indent options set, and return a String" 


  it "should encode with it's class method with :pretty and a tab character indent options set, to a block" 


  it "should encode multiple objects into a single stream, to an IO" 


  it "should encode multiple objects into a single stream, and return a String" 


  it "should encode all map keys as strings" 


  it "should check for and call #to_json if it exists on custom objects" 


  it "should encode a hash where the key and value can be symbols" 


  it "should encode using a newline or nil terminator" 


  it "should encode using a newline or nil terminator, to an IO" 


  it "should encode using a newline or nil terminator, using a block" 


  it "should not encode NaN" 


  it "should not encode Infinity or -Infinity" 


  it "should encode with unicode chars in the key" 


  if RUBY_VERSION =~ /^1.9/
    it "should return a string encoded in utf-8 if Encoding.default_internal is nil" 


    it "should return a string encoded in utf-8 even if Encoding.default_internal *is* set" 

  end

  it "should be able to escape / characters if html_safe is enabled" 


  it "should not encode characters with entities by default" 


  it "should encode characters with entities when enabled" 


  it "should default to *not* escaping / characters" 


  it "should encode slashes when enabled" 


  it "return value of #to_json must be a string" 


  it "return value of #to_s must be a string" 


  it "should raise an exception for deeply nested arrays" 


  it "should raise an exception for deeply nested hashes" 

end

