# encoding: UTF-8

require 'stringio'
require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Uglifier" do
  it "minifies JS" 


  describe 'harmony mode' do
    let(:source) { "const foo = () => bar();" }

    it "minifies JS with Harmony features when harmony option is on" 


    it "raises an error when minifying JS with Harmony without harmony option" 

  end

  it "throws an exception when compilation fails" 


  it "throws an exception on invalid option" 


  it "doesn't omit null character in strings" 


  it "adds trailing semicolon to minified source" 


  describe "property name mangling" do
    let(:source) do
      <<-JS
        var obj = {
          _hidden: false,
          "quoted": 'value'
        };

        alert(object.quoted);
      JS
    end

    it "does not mangle property names by default" 


    it "can be configured to mangle properties" 


    it "can be configured using old mangle_properties" 


    it "can configure a regex for mangling" 


    it "can be configured to keep quoted properties" 


    it "can be configured to include debug in mangled properties" 

  end

  describe "argument name mangling" do
    let(:code) { "function bar(foo) {return foo + 'bar'};" }

    it "doesn't try to mangle $super by default to avoid breaking PrototypeJS" 


    it "allows variables to be excluded from mangling" 


    it "skips mangling when set to false" 


    it "mangles argument names by default" 


    it "mangles top-level names when explicitly instructed" 


    it "can be controlled with mangle option" 

  end

  describe "comment preservation" do
    let(:source) do
      <<-JS
        /* @preserve Copyright Notice */
        /* (c) 2011 */
        // INCLUDED
        //! BANG
        function identity(p) { return p; }
        /* Another Copyright */
        /*! Another Bang */
        // A comment!
        function add(a, b) { return a + b; }
      JS
    end

    describe ":copyright" do
      subject { Uglifier.compile(source, :comments => :copyright) }

      it "preserves comments with string Copyright" 


      it "preserves comments that start with a bang (!)" 


      it "ignores other comments" 

    end

    describe ":jsdoc" do
      subject { Uglifier.compile(source, :output => { :comments => :jsdoc }) }

      it "preserves jsdoc license/preserve blocks" 


      it "ignores other comments" 

    end

    describe ":all" do
      subject { Uglifier.compile(source, :comments => :all) }

      it "preserves all comments" 

    end

    describe ":none" do
      subject { Uglifier.compile(source, :comments => :none) }

      it "omits all comments" 

    end

    describe "regular expression" do
      subject { Uglifier.compile(source, :comments => /included/i) }

      it "matches comment blocks with regex" 


      it "omits other blocks" 

    end
  end

  it "honors max line length" 


  it "hoists vars to top of the scope" 


  describe 'reduce_funcs' do
    let(:code) do
      <<-JS
        var foo = function(x, y, z) {
          return x < y ? x * y + z : x * z - y;
        }
        var indirect = function(x, y, z) {
          return foo(x, y, z);
        }
        var sum = 0;
        for (var i = 0; i < 100; ++i)
          sum += indirect(i, i + 1, 3 * i);
        console.log(sum);
      JS
    end

    it 'inlines function declaration' 


    it 'defaults to not inlining function declarations' 

  end

  describe 'reduce_vars' do
    let(:code) do
      <<-JS
        var a = 2;
        (function () {
          console.log(a - 5);
          console.log(a - 1);
        })();
      JS
    end

    it "reduces vars when compress option is set" 


    it "does not reduce vars when compress option is false" 


    it "defaults to variable reducing being disabled" 


    it "does not reduce variables that are assigned to" 

  end

  describe "ie8 option" do
    let(:code) { "function something() { return g.switch; }" }

    it "defaults to IE8-safe output" 


    it "forwards ie8 option to UglifyJS" 

  end

  it "can be configured to output only ASCII" 


  it "escapes </script when asked to" 


  it "quotes keys" 


  it "quotes unsafe keys by default" 


  it "handles constant definitions" 


  it "can disable IIFE negation" 


  it "can drop console logging" 


  describe "collapse_vars option" do
    let(:code) do
      <<-JS
        function a() {
          var win = window;
          return win.Handlebars;
        }
      JS
    end

    it "collapses vars when collapse_vars is enabled" 


    it "does not collapse variables when disable" 


    it "defaults to not collapsing variables" 

  end

  it "keeps unused function arguments when keep_fargs option is set" 


  describe 'keep_fnames' do
    let(:code) do
      <<-JS
      (function() {
        function plus(a, b) { return a + b; };
        plus(1, 2);
      })();
      JS
    end

    it "keeps function names in output when compressor keep_fnames is set" 


    it "does not mangle function names in output when mangler keep_fnames is set" 


    it "sets sets both compress and mangle keep_fnames when toplevel keep_fnames is true" 

  end

  describe "Input Formats" do
    let(:code) { "function hello() { return 'hello world'; }" }

    it "handles strings" 


    it "handles IO objects" 

  end

  describe "wrap_iife option" do
    let(:code) do
      <<-JS
        (function(value) {
          return function() {
            console.log(value)
          };
        })(1)();
      JS
    end

    it "defaults to not wrap IIFEs" 


    it "wraps IIFEs" 

  end

  describe 'removing unused top-level functions and variables' do
    let(:code) do
      <<-JS
        var a, b = 1, c = g;
        function f(d) {
          return function() {
            c = 2;
          }
        }
        a = 2;
        function g() {}
        function h() {}
        console.log(b = 3);
      JS
    end

    it 'removes unused top-level functions and variables when toplevel is set' 


    it 'does not unused top-level functions and variables by default' 


    it 'keeps variables specified in top_retain' 

  end

  describe 'unsafe_comps' do
    let(:code) do
      <<-JS
        var obj1, obj2;
        obj1 <= obj2 ? f1() : g1();
      JS
    end

    let(:options) do
      {
        :comparisons => true,
        :conditionals => true,
        :reduce_vars => false,
        :collapse_vars => false
      }
    end

    it 'keeps unsafe comparisons by default' 


    it 'optimises unsafe comparisons when unsafe_comps is enabled' 

  end

  describe 'unsafe_math' do
    let(:code) do
      <<-JS
        function compute(x) { return 2 * x * 3; }
      JS
    end

    it 'keeps unsafe math by default' 


    it 'optimises unsafe math when unsafe_math is enabled' 

  end

  describe 'unsafe_proto' do
    let(:code) do
      <<-JS
        Array.prototype.slice.call([1,2,3], 1)
      JS
    end

    it 'keeps unsafe prototype references by default' 


    it 'optimises unsafe comparisons when unsafe_comps is enabled' 

  end

  it 'forwards passes option to compressor' 


  describe 'shebang' do
    let(:shebang) { '#!/usr/bin/env node' }
    let(:code) { "#{shebang}\nconsole.log('Hello world!')" }

    it 'is not removed by default' 


    it 'is removed when shebang option is set to false' 

  end

  describe 'keep_infinity' do
    let(:code) do
      <<-JS
        function fun() { return (123456789 / 0).toString(); }
      JS
    end

    it 'compresses Infinity by default' 


    it 'can be enabled to preserve Infinity' 

  end

  describe 'quote style' do
    let(:code) do
      <<-JS
        function fun() { return "foo \\\"bar\\\""; }
      JS
    end

    it 'defaults to auto' 


    it 'can use numbers for configuration' 


    it 'uses single quotes when single' 


    it 'uses double quotes when single' 


    it 'preserves original quoting when original' 

  end

  describe 'keep quoted props' do
    let(:code) do
      <<-JS
        function fun() { return {"foo": "bar"}; }
      JS
    end

    it 'defaults to not keeping quotes' 


    it 'keeps properties when set to true' 

  end

  describe 'side_effects' do
    let(:code) do
      <<-JS
        function fun() { /*@__PURE__*/foo(); }
      JS
    end

    it 'defaults to dropping pure function calls' 


    it 'function call dropping can be disabled' 

  end

  describe 'switches' do
    let(:code) do
      <<-JS
        function fun() {
          switch (1) {
            case 1: foo();
            case 1+1:
              bar();
              break;
            case 1+1+1: baz();
          }
        }
      JS
    end

    it 'drops unreachable switch branches by default' 


    it 'branch dropping can be disabled' 

  end
end

