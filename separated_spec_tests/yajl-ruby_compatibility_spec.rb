# encoding: UTF-8
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper.rb')

class Dummy; end

describe "JSON Gem compatability API" do
  it "shoud not mixin #to_json on base objects until compatability has been enabled" 


  it "should mixin #to_json on base objects after compatability has been enabled" 


  it "should require yajl/json_gem to enable the compatability API" 


  it "should allow default parsing options be set with JSON.default_options" 


  it "should also allow the json gem's symbolize_names key" 


  it "should encode arbitrary classes via their default to_json method" 


  it "should have the standard parsing and encoding exceptions mapped" 


  context "ported tests for Unicode" do
    it "should be able to encode and parse unicode" 

  end

  context "ported tests for generation" do
    before(:all) do
      @hash = {
        'a' => 2,
        'b' => 3.141,
        'c' => 'c',
        'd' => [ 1, "b", 3.14 ],
        'e' => { 'foo' => 'bar' },
        'g' => "blah",
        'h' => 1000.0,
        'i' => 0.001
      }

      @json2 = '{"a":2,"b":3.141,"c":"c","d":[1,"b",3.14],"e":{"foo":"bar"},"g":"blah","h":1000.0,"i":0.001}'

      @json3 = %{
        {
          "a": 2,
          "b": 3.141,
          "c": "c",
          "d": [1, "b", 3.14],
          "e": {"foo": "bar"},
          "g": "blah",
          "h": 1000.0,
          "i": 0.001
        }
      }.chomp
    end

    it "should be able to unparse" 


    it "should be able to unparse pretty" 

  end

  context "ported fixture tests" do
    fixtures = File.join(File.dirname(__FILE__), '../parsing/fixtures/*.json')
    passed, failed = Dir[fixtures].partition { |f| f['pass'] }
    JSON_PASSED = passed.inject([]) { |a, f| a << [ f, File.read(f) ] }.sort
    JSON_FAILED = failed.inject([]) { |a, f| a << [ f, File.read(f) ] }.sort

    JSON_FAILED.each do |name, source|
      it "should not be able to parse #{File.basename(name)} as an IO" 

    end

    JSON_FAILED.each do |name, source|
      it "should not be able to parse #{File.basename(name)} as a string" 

    end

    JSON_PASSED.each do |name, source|
      it "should be able to parse #{File.basename(name)} as an IO" 

    end

    JSON_PASSED.each do |name, source|
      it "should be able to parse #{File.basename(name)} as a string" 

    end
  end
end

