require File.expand_path(File.dirname(__FILE__) + '/../spec_helper.rb')

describe "Parsing JSON Fixtures" do
  fixtures = File.join(File.dirname(__FILE__), 'fixtures/*.json')
  passed, failed = Dir[fixtures].partition { |f| f['pass'] }
  PASSED = passed.inject([]) { |a, f| a << [ f, File.read(f) ] }.sort
  FAILED = failed.inject([]) { |a, f| a << [ f, File.read(f) ] }.sort

  FAILED.each do |name, source|
    it "should not be able to parse #{File.basename(name)} as an IO" 

  end

  FAILED.each do |name, source|
    it "should not be able to parse #{File.basename(name)} as a string" 

  end

  PASSED.each do |name, source|
    it "should be able to parse #{File.basename(name)} as an IO" 

  end

  PASSED.each do |name, source|
    it "should be able to parse #{File.basename(name)} as a string" 

  end
end

