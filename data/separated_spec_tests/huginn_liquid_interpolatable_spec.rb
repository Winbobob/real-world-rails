require 'rails_helper'
require 'nokogiri'

describe LiquidInterpolatable::Filters do
  before do
    @filter = Class.new do
      include LiquidInterpolatable::Filters
    end.new
  end

  describe 'uri_escape' do
    it 'should escape a string for use in URI' 


    it 'should not raise an error when an operand is nil' 

  end

  describe 'validations' do
    class Agents::InterpolatableAgent < Agent
      include LiquidInterpolatable

      def check
        create_event :payload => {}
      end

      def validate_options
        interpolated['foo']
      end
    end

    it "should finish without raising an exception" 

  end

  describe 'unescape' do
    let(:agent) { Agents::InterpolatableAgent.new(name: "test") }

    it 'should unescape basic HTML entities' 

  end

  describe "json" do
    let(:agent) { Agents::InterpolatableAgent.new(name: "test") }

    it 'serializes data to json' 

  end

  describe 'to_xpath' do
    before do
      def @filter.to_xpath_roundtrip(string)
        Nokogiri::XML('').xpath(to_xpath(string))
      end
    end

    it 'should escape a string for use in XPath expression' 


    it 'should stringify a non-string operand' 

  end

  describe 'to_uri' do
    before do
      @agent = Agents::InterpolatableAgent.new(name: "test", options: { 'foo' => '{% assign u = s | to_uri %}{{ u.path }}' })
      @agent.interpolation_context['s'] = 'http://example.com/dir/1?q=test'
    end

    it 'should parse an abosule URI' 


    it 'should parse an abosule URI with a base URI specified' 


    it 'should parse a relative URI with a base URI specified' 


    it 'should parse an abosule URI with a base URI specified' 


    it 'should stringify a non-string operand' 


    it 'should normalize a URL' 


    it 'should return a URI value in interpolation' 


    it 'should return a URI value resolved against a base URI in interpolation' 


    it 'should normalize a URI value if an empty base URI is given' 

  end

  describe 'uri_expand' do
    before do
      stub_request(:head, 'https://t.co.x/aaaa').
        to_return(status: 301, headers: { Location: 'https://bit.ly.x/bbbb' })
      stub_request(:head, 'https://bit.ly.x/bbbb').
        to_return(status: 301, headers: { Location: 'http://tinyurl.com.x/cccc' })
      stub_request(:head, 'http://tinyurl.com.x/cccc').
        to_return(status: 301, headers: { Location: 'http://www.example.com/welcome' })
      stub_request(:head, 'http://www.example.com/welcome').
        to_return(status: 200)

      (1..5).each do |i|
        stub_request(:head, "http://2many.x/#{i}").
          to_return(status: 301, headers: { Location: "http://2many.x/#{i+1}" })
      end
      stub_request(:head, 'http://2many.x/6').
        to_return(status: 301, headers: { 'Content-Length' => '5' })
    end

    it 'should handle inaccessible URIs' 


    it 'should follow redirects' 


    it 'should respect the limit for the number of redirects' 


    it 'should detect a redirect loop' 


    it 'should be able to handle an FTP URL' 


    describe 'used in interpolation' do
      before do
        @agent = Agents::InterpolatableAgent.new(name: "test")
      end

      it 'should follow redirects' 


      it 'should respect the limit for the number of redirects' 

    end
  end

  describe 'regex_replace_first' do
    let(:agent) { Agents::InterpolatableAgent.new(name: "test") }

    it 'should replace the first occurrence of a string using regex' 


    it 'should support escaped characters' 

  end

  describe 'regex_replace' do
    let(:agent) { Agents::InterpolatableAgent.new(name: "test") }

    it 'should replace the all occurrences of a string using regex' 


    it 'should support escaped characters' 

  end

  describe 'regex_replace_first block' do
    let(:agent) { Agents::InterpolatableAgent.new(name: "test") }

    it 'should replace the first occurrence of a string using regex' 


    it 'should be able to take a pattern in a variable' 


    it 'should define a variable named "match" in a "with" block' 

  end

  describe 'regex_replace block' do
    let(:agent) { Agents::InterpolatableAgent.new(name: "test") }

    it 'should replace the all occurrences of a string using regex' 

  end

  context 'as_object' do
    let(:agent) { Agents::InterpolatableAgent.new(name: "test") }

    it 'returns an array that was splitted in liquid tags' 


    it 'returns an object that was not modified in liquid' 


    context 'as_json' do
      def ensure_safety(obj)
        JSON.parse(JSON.dump(obj))
      end

      it 'it converts "complex" objects' 


      it 'works with AgentDrops' 


      it 'works with EventDrops' 


      it 'works with MatchDataDrops' 


      it 'works with URIDrops' 

    end
  end

  describe 'rebase_hrefs' do
    let(:agent) { Agents::InterpolatableAgent.new(name: "test") }

    let(:fragment) { <<HTML }
<ul>
  <li>
    <a href="downloads/file1"><img src="/images/iconA.png" srcset="/images/iconA.png 1x, /images/iconA@2x.png 2x">file1</a>
  </li>
  <li>
    <a href="downloads/file2"><img src="/images/iconA.png" srcset="/images/iconA.png 1x, /images/iconA@2x.png 2x">file2</a>
  </li>
  <li>
    <a href="downloads/file3"><img src="/images/iconB.png" srcset="/images/iconB.png 1x, /images/iconB@2x.png 2x">file3</a>
  </li>
</ul>
HTML

    let(:replaced_fragment) { <<HTML }
<ul>
  <li>
    <a href="http://example.com/support/downloads/file1"><img src="http://example.com/images/iconA.png" srcset="http://example.com/images/iconA.png 1x, http://example.com/images/iconA@2x.png 2x">file1</a>
  </li>
  <li>
    <a href="http://example.com/support/downloads/file2"><img src="http://example.com/images/iconA.png" srcset="http://example.com/images/iconA.png 1x, http://example.com/images/iconA@2x.png 2x">file2</a>
  </li>
  <li>
    <a href="http://example.com/support/downloads/file3"><img src="http://example.com/images/iconB.png" srcset="http://example.com/images/iconB.png 1x, http://example.com/images/iconB@2x.png 2x">file3</a>
  </li>
</ul>
HTML

    it 'rebases relative URLs in a fragment' 

  end
end

