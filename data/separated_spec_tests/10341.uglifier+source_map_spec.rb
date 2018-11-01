# encoding: UTF-8

require 'stringio'
require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

def expect_to_have_inline_source_map(minified, original)
  options = { :source_map => { :sources_content => true } }
  _, map = Uglifier.compile_with_map(minified, options)
  expect(JSON.parse(map).fetch("sourcesContent", [])).to include(original)
end

describe "Uglifier" do
  let(:source) do
    <<-JS
      function hello () {
        function world () {
          return 2;
        };

        return world() + world();
      };
    JS
  end

  it "generates source maps" 


  it "generates source maps with the correct meta-data" 


  it "skips copyright lines in source maps" 


  it "proceses an input source map" 


  it "handles empty string as input map sourceRoot" 


  it "appends source map url to minified JS" 


  it "appends source url to minified JS" 


  it "inlines source map" 


  describe "inline source map parsing" do
    let(:minified) do
      Uglifier.compile(
        source,
        :source_map => {
          :filename => "ahoy.js",
          :sources_content => true
        }
      )
    end

    let(:code) { minified.split("\n")[0] }
    let(:source_mapping_url) { minified.split("\n")[1][2..-1] }

    it "parses inline source maps from line comments" 


    it "parses inline source maps with block comments" 


    it "parses inline source maps with multi-line block comments" 


    it "parses inline source maps from mixed comments" 


    it "only parses source maps at end of file" 


    it "handles other source map declarations at end of file" 


    it "does not explode when data URI is invalid" 


    it "works with source_map: true" 


    it "works with source_map: false" 

  end
end

