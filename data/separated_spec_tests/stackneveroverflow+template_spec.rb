# coding: utf-8
# Copyright (C) Bob Aman
#
#    Licensed under the Apache License, Version 2.0 (the "License");
#    you may not use this file except in compliance with the License.
#    You may obtain a copy of the License at
#
#        http://www.apache.org/licenses/LICENSE-2.0
#
#    Unless required by applicable law or agreed to in writing, software
#    distributed under the License is distributed on an "AS IS" BASIS,
#    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#    See the License for the specific language governing permissions and
#    limitations under the License.


require "spec_helper"

require "bigdecimal"
require "addressable/template"

shared_examples_for 'expands' do |tests|
  tests.each do |template, expansion|
    exp = expansion.is_a?(Array) ? expansion.first : expansion
    it "#{template} to #{exp}" 

  end
end

describe "eql?" do
  let(:template) { Addressable::Template.new('https://www.example.com/{foo}') }
  it 'is equal when the pattern matches' 

  it 'is not equal when the pattern differs' 

  it 'is not equal to non-templates' 

end

describe "==" do
  let(:template) { Addressable::Template.new('https://www.example.com/{foo}') }
  it 'is equal when the pattern matches' 

  it 'is not equal when the pattern differs' 

  it 'is not equal to non-templates' 

end

describe "Type conversion" do
  subject {
    {
      :var => true,
      :hello => 1234,
      :nothing => nil,
      :sym => :symbolic,
      :decimal => BigDecimal.new('1')
    }
  }

  it_behaves_like 'expands', {
    '{var}' => 'true',
    '{hello}' => '1234',
    '{nothing}' => '',
    '{sym}' => 'symbolic',
    '{decimal}' => RUBY_VERSION < '2.4.0' ? '0.1E1' : '0.1e1'
  }
end

describe "Level 1:" do
  subject {
    {:var => "value", :hello => "Hello World!"}
  }
  it_behaves_like 'expands', {
    '{var}' => 'value',
    '{hello}' => 'Hello%20World%21'
  }
end

describe "Level 2" do
  subject {
    {
      :var => "value",
      :hello => "Hello World!",
      :path => "/foo/bar"
    }
  }
  context "Operator +:" do
    it_behaves_like 'expands', {
      '{+var}' => 'value',
      '{+hello}' => 'Hello%20World!',
      '{+path}/here' => '/foo/bar/here',
      'here?ref={+path}' => 'here?ref=/foo/bar'
    }
  end
  context "Operator #:" do
    it_behaves_like 'expands', {
      'X{#var}' => 'X#value',
      'X{#hello}' => 'X#Hello%20World!'
    }
  end
end

describe "Level 3" do
  subject {
    {
      :var => "value",
      :hello => "Hello World!",
      :empty => "",
      :path => "/foo/bar",
      :x => "1024",
      :y => "768"
    }
  }
  context "Operator nil (multiple vars):" do
    it_behaves_like 'expands', {
      'map?{x,y}' => 'map?1024,768',
      '{x,hello,y}' => '1024,Hello%20World%21,768'
    }
  end
  context "Operator + (multiple vars):" do
    it_behaves_like 'expands', {
      '{+x,hello,y}' => '1024,Hello%20World!,768',
      '{+path,x}/here' => '/foo/bar,1024/here'
    }
  end
  context "Operator # (multiple vars):" do
    it_behaves_like 'expands', {
      '{#x,hello,y}' => '#1024,Hello%20World!,768',
      '{#path,x}/here' => '#/foo/bar,1024/here'
    }
  end
  context "Operator ." do
    it_behaves_like 'expands', {
      'X{.var}' => 'X.value',
      'X{.x,y}' => 'X.1024.768'
    }
  end
  context "Operator /" do
    it_behaves_like 'expands', {
      '{/var}' => '/value',
      '{/var,x}/here' => '/value/1024/here'
    }
  end
  context "Operator ;" do
    it_behaves_like 'expands', {
      '{;x,y}' => ';x=1024;y=768',
      '{;x,y,empty}' => ';x=1024;y=768;empty'
    }
  end
  context "Operator ?" do
    it_behaves_like 'expands', {
      '{?x,y}' => '?x=1024&y=768',
      '{?x,y,empty}' => '?x=1024&y=768&empty='
    }
  end
  context "Operator &" do
    it_behaves_like 'expands', {
      '?fixed=yes{&x}' => '?fixed=yes&x=1024',
      '{&x,y,empty}' => '&x=1024&y=768&empty='
    }
  end
end

describe "Level 4" do
  subject {
    {
      :var => "value",
      :hello => "Hello World!",
      :path => "/foo/bar",
      :semi => ";",
      :list => %w(red green blue),
      :keys => {"semi" => ';', "dot" => '.', "comma" => ','}
    }
  }
  context "Expansion with value modifiers" do
    it_behaves_like 'expands', {
      '{var:3}' => 'val',
      '{var:30}' => 'value',
      '{list}' => 'red,green,blue',
      '{list*}' => 'red,green,blue',
      '{keys}' => [
        'semi,%3B,dot,.,comma,%2C',
        'dot,.,semi,%3B,comma,%2C',
        'comma,%2C,semi,%3B,dot,.',
        'semi,%3B,comma,%2C,dot,.',
        'dot,.,comma,%2C,semi,%3B',
        'comma,%2C,dot,.,semi,%3B'
      ],
      '{keys*}' => [
        'semi=%3B,dot=.,comma=%2C',
        'dot=.,semi=%3B,comma=%2C',
        'comma=%2C,semi=%3B,dot=.',
        'semi=%3B,comma=%2C,dot=.',
        'dot=.,comma=%2C,semi=%3B',
        'comma=%2C,dot=.,semi=%3B'
      ]
    }
  end
  context "Operator + with value modifiers" do
    it_behaves_like 'expands', {
      '{+path:6}/here' => '/foo/b/here',
      '{+list}' => 'red,green,blue',
      '{+list*}' => 'red,green,blue',
      '{+keys}' => [
        'semi,;,dot,.,comma,,',
        'dot,.,semi,;,comma,,',
        'comma,,,semi,;,dot,.',
        'semi,;,comma,,,dot,.',
        'dot,.,comma,,,semi,;',
        'comma,,,dot,.,semi,;'
      ],
      '{+keys*}' => [
        'semi=;,dot=.,comma=,',
        'dot=.,semi=;,comma=,',
        'comma=,,semi=;,dot=.',
        'semi=;,comma=,,dot=.',
        'dot=.,comma=,,semi=;',
        'comma=,,dot=.,semi=;'
      ]
    }
  end
  context "Operator # with value modifiers" do
    it_behaves_like 'expands', {
      '{#path:6}/here' => '#/foo/b/here',
      '{#list}' => '#red,green,blue',
      '{#list*}' => '#red,green,blue',
      '{#keys}' => [
        '#semi,;,dot,.,comma,,',
        '#dot,.,semi,;,comma,,',
        '#comma,,,semi,;,dot,.',
        '#semi,;,comma,,,dot,.',
        '#dot,.,comma,,,semi,;',
        '#comma,,,dot,.,semi,;'
      ],
      '{#keys*}' => [
        '#semi=;,dot=.,comma=,',
        '#dot=.,semi=;,comma=,',
        '#comma=,,semi=;,dot=.',
        '#semi=;,comma=,,dot=.',
        '#dot=.,comma=,,semi=;',
        '#comma=,,dot=.,semi=;'
      ]
    }
  end
  context "Operator . with value modifiers" do
    it_behaves_like 'expands', {
      'X{.var:3}' => 'X.val',
      'X{.list}' => 'X.red,green,blue',
      'X{.list*}' => 'X.red.green.blue',
      'X{.keys}' => [
        'X.semi,%3B,dot,.,comma,%2C',
        'X.dot,.,semi,%3B,comma,%2C',
        'X.comma,%2C,semi,%3B,dot,.',
        'X.semi,%3B,comma,%2C,dot,.',
        'X.dot,.,comma,%2C,semi,%3B',
        'X.comma,%2C,dot,.,semi,%3B'
      ],
      'X{.keys*}' => [
        'X.semi=%3B.dot=..comma=%2C',
        'X.dot=..semi=%3B.comma=%2C',
        'X.comma=%2C.semi=%3B.dot=.',
        'X.semi=%3B.comma=%2C.dot=.',
        'X.dot=..comma=%2C.semi=%3B',
        'X.comma=%2C.dot=..semi=%3B'
      ]
    }
  end
  context "Operator / with value modifiers" do
    it_behaves_like 'expands', {
      '{/var:1,var}' => '/v/value',
      '{/list}' => '/red,green,blue',
      '{/list*}' => '/red/green/blue',
      '{/list*,path:4}' => '/red/green/blue/%2Ffoo',
      '{/keys}' => [
        '/semi,%3B,dot,.,comma,%2C',
        '/dot,.,semi,%3B,comma,%2C',
        '/comma,%2C,semi,%3B,dot,.',
        '/semi,%3B,comma,%2C,dot,.',
        '/dot,.,comma,%2C,semi,%3B',
        '/comma,%2C,dot,.,semi,%3B'
      ],
      '{/keys*}' => [
        '/semi=%3B/dot=./comma=%2C',
        '/dot=./semi=%3B/comma=%2C',
        '/comma=%2C/semi=%3B/dot=.',
        '/semi=%3B/comma=%2C/dot=.',
        '/dot=./comma=%2C/semi=%3B',
        '/comma=%2C/dot=./semi=%3B'
      ]
    }
  end
  context "Operator ; with value modifiers" do
    it_behaves_like 'expands', {
      '{;hello:5}' => ';hello=Hello',
      '{;list}' => ';list=red,green,blue',
      '{;list*}' => ';list=red;list=green;list=blue',
      '{;keys}' => [
        ';keys=semi,%3B,dot,.,comma,%2C',
        ';keys=dot,.,semi,%3B,comma,%2C',
        ';keys=comma,%2C,semi,%3B,dot,.',
        ';keys=semi,%3B,comma,%2C,dot,.',
        ';keys=dot,.,comma,%2C,semi,%3B',
        ';keys=comma,%2C,dot,.,semi,%3B'
      ],
      '{;keys*}' => [
        ';semi=%3B;dot=.;comma=%2C',
        ';dot=.;semi=%3B;comma=%2C',
        ';comma=%2C;semi=%3B;dot=.',
        ';semi=%3B;comma=%2C;dot=.',
        ';dot=.;comma=%2C;semi=%3B',
        ';comma=%2C;dot=.;semi=%3B'
      ]
    }
  end
  context "Operator ? with value modifiers" do
    it_behaves_like 'expands', {
      '{?var:3}' => '?var=val',
      '{?list}' => '?list=red,green,blue',
      '{?list*}' => '?list=red&list=green&list=blue',
      '{?keys}' => [
        '?keys=semi,%3B,dot,.,comma,%2C',
        '?keys=dot,.,semi,%3B,comma,%2C',
        '?keys=comma,%2C,semi,%3B,dot,.',
        '?keys=semi,%3B,comma,%2C,dot,.',
        '?keys=dot,.,comma,%2C,semi,%3B',
        '?keys=comma,%2C,dot,.,semi,%3B'
      ],
      '{?keys*}' => [
        '?semi=%3B&dot=.&comma=%2C',
        '?dot=.&semi=%3B&comma=%2C',
        '?comma=%2C&semi=%3B&dot=.',
        '?semi=%3B&comma=%2C&dot=.',
        '?dot=.&comma=%2C&semi=%3B',
        '?comma=%2C&dot=.&semi=%3B'
      ]
    }
  end
  context "Operator & with value modifiers" do
    it_behaves_like 'expands', {
      '{&var:3}' => '&var=val',
      '{&list}' => '&list=red,green,blue',
      '{&list*}' => '&list=red&list=green&list=blue',
      '{&keys}' => [
        '&keys=semi,%3B,dot,.,comma,%2C',
        '&keys=dot,.,semi,%3B,comma,%2C',
        '&keys=comma,%2C,semi,%3B,dot,.',
        '&keys=semi,%3B,comma,%2C,dot,.',
        '&keys=dot,.,comma,%2C,semi,%3B',
        '&keys=comma,%2C,dot,.,semi,%3B'
      ],
      '{&keys*}' => [
        '&semi=%3B&dot=.&comma=%2C',
        '&dot=.&semi=%3B&comma=%2C',
        '&comma=%2C&semi=%3B&dot=.',
        '&semi=%3B&comma=%2C&dot=.',
        '&dot=.&comma=%2C&semi=%3B',
        '&comma=%2C&dot=.&semi=%3B'
      ]
    }
  end
end
describe "Modifiers" do
  subject {
    {
      :var => "value",
      :semi => ";",
      :year => %w(1965 2000 2012),
      :dom => %w(example com)
    }
  }
  context "length" do
    it_behaves_like 'expands', {
      '{var:3}' => 'val',
      '{var:30}' => 'value',
      '{var}' => 'value',
      '{semi}' => '%3B',
      '{semi:2}' => '%3B'
    }
  end
  context "explode" do
    it_behaves_like 'expands', {
      'find{?year*}' => 'find?year=1965&year=2000&year=2012',
      'www{.dom*}' => 'www.example.com',
    }
  end
end
describe "Expansion" do
  subject {
    {
      :count => ["one", "two", "three"],
      :dom => ["example", "com"],
      :dub   => "me/too",
      :hello => "Hello World!",
      :half  => "50%",
      :var   => "value",
      :who   => "fred",
      :base  => "http://example.com/home/",
      :path  => "/foo/bar",
      :list  => ["red", "green", "blue"],
      :keys  => {"semi" => ";","dot" => ".","comma" => ","},
      :v     => "6",
      :x     => "1024",
      :y     => "768",
      :empty => "",
      :empty_keys  => {},
      :undef => nil
    }
  }
  context "concatenation" do
    it_behaves_like 'expands', {
      '{count}' => 'one,two,three',
      '{count*}' => 'one,two,three',
      '{/count}' => '/one,two,three',
      '{/count*}' => '/one/two/three',
      '{;count}' => ';count=one,two,three',
      '{;count*}' => ';count=one;count=two;count=three',
      '{?count}' => '?count=one,two,three',
      '{?count*}' => '?count=one&count=two&count=three',
      '{&count*}' => '&count=one&count=two&count=three'
    }
  end
  context "simple expansion" do
    it_behaves_like 'expands', {
      '{var}' => 'value',
      '{hello}' => 'Hello%20World%21',
      '{half}' => '50%25',
      'O{empty}X' => 'OX',
      'O{undef}X' => 'OX',
      '{x,y}' => '1024,768',
      '{x,hello,y}' => '1024,Hello%20World%21,768',
      '?{x,empty}' => '?1024,',
      '?{x,undef}' => '?1024',
      '?{undef,y}' => '?768',
      '{var:3}' => 'val',
      '{var:30}' => 'value',
      '{list}' => 'red,green,blue',
      '{list*}' => 'red,green,blue',
      '{keys}' => [
        'semi,%3B,dot,.,comma,%2C',
        'dot,.,semi,%3B,comma,%2C',
        'comma,%2C,semi,%3B,dot,.',
        'semi,%3B,comma,%2C,dot,.',
        'dot,.,comma,%2C,semi,%3B',
        'comma,%2C,dot,.,semi,%3B'
      ],
      '{keys*}' => [
        'semi=%3B,dot=.,comma=%2C',
        'dot=.,semi=%3B,comma=%2C',
        'comma=%2C,semi=%3B,dot=.',
        'semi=%3B,comma=%2C,dot=.',
        'dot=.,comma=%2C,semi=%3B',
        'comma=%2C,dot=.,semi=%3B'
      ]
    }
  end
  context "reserved expansion (+)" do
    it_behaves_like 'expands', {
      '{+var}' => 'value',
      '{+hello}' => 'Hello%20World!',
      '{+half}' => '50%25',
      '{base}index' => 'http%3A%2F%2Fexample.com%2Fhome%2Findex',
      '{+base}index' => 'http://example.com/home/index',
      'O{+empty}X' => 'OX',
      'O{+undef}X' => 'OX',
      '{+path}/here' => '/foo/bar/here',
      'here?ref={+path}' => 'here?ref=/foo/bar',
      'up{+path}{var}/here' => 'up/foo/barvalue/here',
      '{+x,hello,y}' => '1024,Hello%20World!,768',
      '{+path,x}/here' => '/foo/bar,1024/here',
      '{+path:6}/here' => '/foo/b/here',
      '{+list}' => 'red,green,blue',
      '{+list*}' => 'red,green,blue',
      '{+keys}' => [
        'semi,;,dot,.,comma,,',
        'dot,.,semi,;,comma,,',
        'comma,,,semi,;,dot,.',
        'semi,;,comma,,,dot,.',
        'dot,.,comma,,,semi,;',
        'comma,,,dot,.,semi,;'
      ],
      '{+keys*}' => [
        'semi=;,dot=.,comma=,',
        'dot=.,semi=;,comma=,',
        'comma=,,semi=;,dot=.',
        'semi=;,comma=,,dot=.',
        'dot=.,comma=,,semi=;',
        'comma=,,dot=.,semi=;'
      ]
    }
  end
  context "fragment expansion (#)" do
    it_behaves_like 'expands', {
      '{#var}' => '#value',
      '{#hello}' => '#Hello%20World!',
      '{#half}' => '#50%25',
      'foo{#empty}' => 'foo#',
      'foo{#undef}' => 'foo',
      '{#x,hello,y}' => '#1024,Hello%20World!,768',
      '{#path,x}/here' => '#/foo/bar,1024/here',
      '{#path:6}/here' => '#/foo/b/here',
      '{#list}' => '#red,green,blue',
      '{#list*}' => '#red,green,blue',
      '{#keys}' => [
        '#semi,;,dot,.,comma,,',
        '#dot,.,semi,;,comma,,',
        '#comma,,,semi,;,dot,.',
        '#semi,;,comma,,,dot,.',
        '#dot,.,comma,,,semi,;',
        '#comma,,,dot,.,semi,;'
      ],
      '{#keys*}' => [
        '#semi=;,dot=.,comma=,',
        '#dot=.,semi=;,comma=,',
        '#comma=,,semi=;,dot=.',
        '#semi=;,comma=,,dot=.',
        '#dot=.,comma=,,semi=;',
        '#comma=,,dot=.,semi=;'
      ]
    }
  end
  context "label expansion (.)" do
    it_behaves_like 'expands', {
      '{.who}' => '.fred',
      '{.who,who}' => '.fred.fred',
      '{.half,who}' => '.50%25.fred',
      'www{.dom*}' => 'www.example.com',
      'X{.var}' => 'X.value',
      'X{.empty}' => 'X.',
      'X{.undef}' => 'X',
      'X{.var:3}' => 'X.val',
      'X{.list}' => 'X.red,green,blue',
      'X{.list*}' => 'X.red.green.blue',
      'X{.keys}' => [
        'X.semi,%3B,dot,.,comma,%2C',
        'X.dot,.,semi,%3B,comma,%2C',
        'X.comma,%2C,semi,%3B,dot,.',
        'X.semi,%3B,comma,%2C,dot,.',
        'X.dot,.,comma,%2C,semi,%3B',
        'X.comma,%2C,dot,.,semi,%3B'
      ],
      'X{.keys*}' => [
        'X.semi=%3B.dot=..comma=%2C',
        'X.dot=..semi=%3B.comma=%2C',
        'X.comma=%2C.semi=%3B.dot=.',
        'X.semi=%3B.comma=%2C.dot=.',
        'X.dot=..comma=%2C.semi=%3B',
        'X.comma=%2C.dot=..semi=%3B'
      ],
      'X{.empty_keys}' => 'X',
      'X{.empty_keys*}' => 'X'
    }
  end
  context "path expansion (/)" do
    it_behaves_like 'expands', {
      '{/who}' => '/fred',
      '{/who,who}' => '/fred/fred',
      '{/half,who}' => '/50%25/fred',
      '{/who,dub}' => '/fred/me%2Ftoo',
      '{/var}' => '/value',
      '{/var,empty}' => '/value/',
      '{/var,undef}' => '/value',
      '{/var,x}/here' => '/value/1024/here',
      '{/var:1,var}' => '/v/value',
      '{/list}' => '/red,green,blue',
      '{/list*}' => '/red/green/blue',
      '{/list*,path:4}' => '/red/green/blue/%2Ffoo',
      '{/keys}' => [
        '/semi,%3B,dot,.,comma,%2C',
        '/dot,.,semi,%3B,comma,%2C',
        '/comma,%2C,semi,%3B,dot,.',
        '/semi,%3B,comma,%2C,dot,.',
        '/dot,.,comma,%2C,semi,%3B',
        '/comma,%2C,dot,.,semi,%3B'
      ],
      '{/keys*}' => [
        '/semi=%3B/dot=./comma=%2C',
        '/dot=./semi=%3B/comma=%2C',
        '/comma=%2C/semi=%3B/dot=.',
        '/semi=%3B/comma=%2C/dot=.',
        '/dot=./comma=%2C/semi=%3B',
        '/comma=%2C/dot=./semi=%3B'
      ]
    }
  end
  context "path-style expansion (;)" do
    it_behaves_like 'expands', {
      '{;who}' => ';who=fred',
      '{;half}' => ';half=50%25',
      '{;empty}' => ';empty',
      '{;v,empty,who}' => ';v=6;empty;who=fred',
      '{;v,bar,who}' => ';v=6;who=fred',
      '{;x,y}' => ';x=1024;y=768',
      '{;x,y,empty}' => ';x=1024;y=768;empty',
      '{;x,y,undef}' => ';x=1024;y=768',
      '{;hello:5}' => ';hello=Hello',
      '{;list}' => ';list=red,green,blue',
      '{;list*}' => ';list=red;list=green;list=blue',
      '{;keys}' => [
        ';keys=semi,%3B,dot,.,comma,%2C',
        ';keys=dot,.,semi,%3B,comma,%2C',
        ';keys=comma,%2C,semi,%3B,dot,.',
        ';keys=semi,%3B,comma,%2C,dot,.',
        ';keys=dot,.,comma,%2C,semi,%3B',
        ';keys=comma,%2C,dot,.,semi,%3B'
      ],
      '{;keys*}' => [
        ';semi=%3B;dot=.;comma=%2C',
        ';dot=.;semi=%3B;comma=%2C',
        ';comma=%2C;semi=%3B;dot=.',
        ';semi=%3B;comma=%2C;dot=.',
        ';dot=.;comma=%2C;semi=%3B',
        ';comma=%2C;dot=.;semi=%3B'
      ]
    }
  end
  context "form query expansion (?)" do
    it_behaves_like 'expands', {
      '{?who}' => '?who=fred',
      '{?half}' => '?half=50%25',
      '{?x,y}' => '?x=1024&y=768',
      '{?x,y,empty}' => '?x=1024&y=768&empty=',
      '{?x,y,undef}' => '?x=1024&y=768',
      '{?var:3}' => '?var=val',
      '{?list}' => '?list=red,green,blue',
      '{?list*}' => '?list=red&list=green&list=blue',
      '{?keys}' => [
        '?keys=semi,%3B,dot,.,comma,%2C',
        '?keys=dot,.,semi,%3B,comma,%2C',
        '?keys=comma,%2C,semi,%3B,dot,.',
        '?keys=semi,%3B,comma,%2C,dot,.',
        '?keys=dot,.,comma,%2C,semi,%3B',
        '?keys=comma,%2C,dot,.,semi,%3B'
      ],
      '{?keys*}' => [
        '?semi=%3B&dot=.&comma=%2C',
        '?dot=.&semi=%3B&comma=%2C',
        '?comma=%2C&semi=%3B&dot=.',
        '?semi=%3B&comma=%2C&dot=.',
        '?dot=.&comma=%2C&semi=%3B',
        '?comma=%2C&dot=.&semi=%3B'
      ]
    }
  end
  context "form query expansion (&)" do
    it_behaves_like 'expands', {
      '{&who}' => '&who=fred',
      '{&half}' => '&half=50%25',
      '?fixed=yes{&x}' => '?fixed=yes&x=1024',
      '{&x,y,empty}' => '&x=1024&y=768&empty=',
      '{&x,y,undef}' => '&x=1024&y=768',
      '{&var:3}' => '&var=val',
      '{&list}' => '&list=red,green,blue',
      '{&list*}' => '&list=red&list=green&list=blue',
      '{&keys}' => [
        '&keys=semi,%3B,dot,.,comma,%2C',
        '&keys=dot,.,semi,%3B,comma,%2C',
        '&keys=comma,%2C,semi,%3B,dot,.',
        '&keys=semi,%3B,comma,%2C,dot,.',
        '&keys=dot,.,comma,%2C,semi,%3B',
        '&keys=comma,%2C,dot,.,semi,%3B'
      ],
      '{&keys*}' => [
        '&semi=%3B&dot=.&comma=%2C',
        '&dot=.&semi=%3B&comma=%2C',
        '&comma=%2C&semi=%3B&dot=.',
        '&semi=%3B&comma=%2C&dot=.',
        '&dot=.&comma=%2C&semi=%3B',
        '&comma=%2C&dot=.&semi=%3B'
      ]
    }
  end
  context "non-string key in match data" do
    subject {Addressable::Template.new("http://example.com/{one}")}

    it "raises TypeError" 

  end
end

class ExampleTwoProcessor
  def self.restore(name, value)
    return value.gsub(/-/, " ") if name == "query"
    return value
  end

  def self.match(name)
    return ".*?" if name == "first"
    return ".*"
  end
  def self.validate(name, value)
    return !!(value =~ /^[\w ]+$/) if name == "query"
    return true
  end

  def self.transform(name, value)
    return value.gsub(/ /, "+") if name == "query"
    return value
  end
end

class DumbProcessor
  def self.match(name)
    return ".*?" if name == "first"
  end
end

describe Addressable::Template do
  describe 'initialize' do
    context 'with a non-string' do
      it 'raises a TypeError' 

    end
  end

  describe 'freeze' do
    subject { Addressable::Template.new("http://example.com/{first}/{+second}/") }
    it 'freezes the template' 

  end

  describe "Matching" do
    let(:uri){
      Addressable::URI.parse(
        "http://example.com/search/an-example-search-query/"
      )
    }
    let(:uri2){
      Addressable::URI.parse("http://example.com/a/b/c/")
    }
    let(:uri3){
      Addressable::URI.parse("http://example.com/;a=1;b=2;c=3;first=foo")
    }
    let(:uri4){
      Addressable::URI.parse("http://example.com/?a=1&b=2&c=3&first=foo")
    }
    let(:uri5){
      "http://example.com/foo"
    }
    context "first uri with ExampleTwoProcessor" do
      subject {
        Addressable::Template.new(
          "http://example.com/search/{query}/"
        ).match(uri, ExampleTwoProcessor)
      }
      its(:variables){ should == ["query"] }
      its(:captures){ should == ["an example search query"] }
    end

    context "second uri with ExampleTwoProcessor" do
      subject {
        Addressable::Template.new(
          "http://example.com/{first}/{+second}/"
        ).match(uri2, ExampleTwoProcessor)
      }
      its(:variables){ should == ["first", "second"] }
      its(:captures){ should == ["a", "b/c"] }
    end

    context "second uri with DumbProcessor" do
      subject {
        Addressable::Template.new(
          "http://example.com/{first}/{+second}/"
        ).match(uri2, DumbProcessor)
      }
      its(:variables){ should == ["first", "second"] }
      its(:captures){ should == ["a", "b/c"] }
    end

    context "second uri" do
      subject {
        Addressable::Template.new(
          "http://example.com/{first}{/second*}/"
        ).match(uri2)
      }
      its(:variables){ should == ["first", "second"] }
      its(:captures){ should == ["a", ["b","c"]] }
    end
    context "third uri" do
      subject {
        Addressable::Template.new(
          "http://example.com/{;hash*,first}"
        ).match(uri3)
      }
      its(:variables){ should == ["hash", "first"] }
      its(:captures){ should == [
        {"a" => "1", "b" => "2", "c" => "3", "first" => "foo"}, nil] }
    end
    # Note that this expansion is impossible to revert deterministically - the
    # * operator means first could have been a key of hash or a separate key.
    # Semantically, a separate key is more likely, but both are possible.
    context "fourth uri" do
      subject {
        Addressable::Template.new(
          "http://example.com/{?hash*,first}"
        ).match(uri4)
      }
      its(:variables){ should == ["hash", "first"] }
      its(:captures){ should == [
        {"a" => "1", "b" => "2", "c" => "3", "first"=> "foo"}, nil] }
    end
    context "fifth uri" do
      subject {
        Addressable::Template.new(
          "http://example.com/{path}{?hash*,first}"
        ).match(uri5)
      }
      its(:variables){ should == ["path", "hash", "first"] }
      its(:captures){ should == ["foo", nil, nil] }
    end
  end

  describe 'match' do
    subject { Addressable::Template.new('http://example.com/first/second/') }
    context 'when the URI is the same as the template' do
      it 'returns the match data itself with an empty mapping' 

    end
  end

  describe "extract" do
    let(:template) {
      Addressable::Template.new(
        "http://{host}{/segments*}/{?one,two,bogus}{#fragment}"
      )
    }
    let(:uri){ "http://example.com/a/b/c/?one=1&two=2#foo" }
    let(:uri2){ "http://example.com/a/b/c/#foo" }
    it "should be able to extract with queries" 

    it "should be able to extract without queries" 


    context "issue #137" do
      subject { Addressable::Template.new('/path{?page,per_page}') }

      it "can match empty" 


      it "can match first var" 


      it "can match second var" 


      it "can match both vars" 

    end
  end

  describe "Partial expand with symbols" do
    context "partial_expand with two simple values" do
      subject {
        Addressable::Template.new("http://example.com/{one}/{two}/")
      }
      it "builds a new pattern" 

    end
    context "partial_expand query with missing param in middle" do
      subject {
        Addressable::Template.new("http://example.com/{?one,two,three}/")
      }
      it "builds a new pattern" 

    end
    context "partial_expand form style query with missing param at beginning" do
      subject {
        Addressable::Template.new("http://example.com/{?one,two}/")
      }
      it "builds a new pattern" 

    end
    context "partial_expand with query string" do
      subject {
        Addressable::Template.new("http://example.com/{?two,one}/")
      }
      it "builds a new pattern" 

    end
    context "partial_expand with path operator" do
      subject {
        Addressable::Template.new("http://example.com{/one,two}/")
      }
      it "builds a new pattern" 

    end
    context "partial expand with unicode values" do
      subject do
        Addressable::Template.new("http://example.com/{resource}/{query}/")
      end
      it "normalizes unicode by default" 


      it "does not normalize unicode when byte semantics requested" 

    end
  end
  describe "Partial expand with strings" do
    context "partial_expand with two simple values" do
      subject {
        Addressable::Template.new("http://example.com/{one}/{two}/")
      }
      it "builds a new pattern" 

    end
    context "partial_expand query with missing param in middle" do
      subject {
        Addressable::Template.new("http://example.com/{?one,two,three}/")
      }
      it "builds a new pattern" 

    end
    context "partial_expand with query string" do
      subject {
        Addressable::Template.new("http://example.com/{?two,one}/")
      }
      it "builds a new pattern" 

    end
    context "partial_expand with path operator" do
      subject {
        Addressable::Template.new("http://example.com{/one,two}/")
      }
      it "builds a new pattern" 

    end
  end
  describe "Expand" do
    context "expand with unicode values" do
      subject do
        Addressable::Template.new("http://example.com/search/{query}/")
      end
      it "normalizes unicode by default" 


      it "does not normalize unicode when byte semantics requested" 

    end
    context "expand with a processor" do
      subject {
        Addressable::Template.new("http://example.com/search/{query}/")
      }
      it "processes spaces" 

      it "validates" 

    end
    context "partial_expand query with missing param in middle" do
      subject {
        Addressable::Template.new("http://example.com/{?one,two,three}/")
      }
      it "builds a new pattern" 

    end
    context "partial_expand with query string" do
      subject {
        Addressable::Template.new("http://example.com/{?two,one}/")
      }
      it "builds a new pattern" 

    end
    context "partial_expand with path operator" do
      subject {
        Addressable::Template.new("http://example.com{/one,two}/")
      }
      it "builds a new pattern" 

    end
  end
  context "Matching with operators" do
    describe "Level 1:" do
      subject { Addressable::Template.new("foo{foo}/{bar}baz") }
      it "can match" 

      it "can fail" 

      it "can match empty" 

      it "lists vars" 

    end

    describe "Level 2:" do
      subject { Addressable::Template.new("foo{+foo}{#bar}baz") }
      it "can match" 

      it "can match empty level 2 #" 

      it "can match empty level 2 +" 

      it "lists vars" 

    end

    describe "Level 3:" do
      context "no operator" do
        subject { Addressable::Template.new("foo{foo,bar}baz") }
        it "can match" 

        it "lists vars" 

      end
      context "+ operator" do
        subject { Addressable::Template.new("foo{+foo,bar}baz") }
        it "can match" 

        it "lists vars" 

      end
      context ". operator" do
        subject { Addressable::Template.new("foo{.foo,bar}baz") }
        it "can match" 

        it "lists vars" 

      end
      context "/ operator" do
        subject { Addressable::Template.new("foo{/foo,bar}baz") }
        it "can match" 

        it "lists vars" 

      end
      context "; operator" do
        subject { Addressable::Template.new("foo{;foo,bar,baz}baz") }
        it "can match" 

        it "lists vars" 

      end
      context "? operator" do
        context "test" do
          subject { Addressable::Template.new("foo{?foo,bar}baz") }
          it "can match" 

          it "lists vars" 

        end

        context "issue #137" do
          subject { Addressable::Template.new('/path{?page,per_page}') }

          it "can match empty" 


          it "can match first var" 


          it "can match second var" 


          it "can match both vars" 

        end

        context "issue #71" do
          subject { Addressable::Template.new("http://cyberscore.dev/api/users{?username}") }
          it "can match" 

          it "lists vars" 

        end
      end
      context "& operator" do
        subject { Addressable::Template.new("foo{&foo,bar}baz") }
        it "can match" 

        it "lists vars" 

      end
    end
  end

  context "support regexes:" do
    context "EXPRESSION" do
      subject { Addressable::Template::EXPRESSION }
      it "should be able to match an expression" 

      it "should fail on non vars" 

    end
    context "VARNAME" do
      subject { Addressable::Template::VARNAME }
      it "should be able to match a variable" 

      it "should fail on non vars" 

    end
    context "VARIABLE_LIST" do
      subject { Addressable::Template::VARIABLE_LIST }
      it "should be able to match a variable list" 

      it "should fail on non vars" 

    end
    context "VARSPEC" do
      subject { Addressable::Template::VARSPEC }
      it "should be able to match a variable with modifier" 

      it "should fail on non vars" 

    end
  end
end

describe Addressable::Template::MatchData do
  let(:template) { Addressable::Template.new('{foo}/{bar}') }
  subject(:its) { template.match('ab/cd') }
  its(:uri) { should == Addressable::URI.parse('ab/cd') }
  its(:template) { should == template }
  its(:mapping) { should == { 'foo' => 'ab', 'bar' => 'cd' } }
  its(:variables) { should == ['foo', 'bar'] }
  its(:keys) { should == ['foo', 'bar'] }
  its(:names) { should == ['foo', 'bar'] }
  its(:values) { should == ['ab', 'cd'] }
  its(:captures) { should == ['ab', 'cd'] }
  its(:to_a) { should == ['ab/cd', 'ab', 'cd'] }
  its(:to_s) { should == 'ab/cd' }
  its(:string) { should == its.to_s }
  its(:pre_match) { should == "" }
  its(:post_match) { should == "" }

  describe 'values_at' do
    it 'returns an array with the values' 

    it 'allows mixing integer an string keys' 

    it 'accepts unknown keys' 

  end

  describe '[]' do
    context 'string key' do
      it 'returns the corresponding capture' 

      it 'returns nil for unknown keys' 

    end
    context 'symbol key' do
      it 'returns the corresponding capture' 

      it 'returns nil for unknown keys' 

    end
    context 'integer key' do
      it 'returns the full URI for index 0' 

      it 'returns the corresponding capture' 

      it 'returns nil for unknown keys' 

    end
    context 'other key' do
      it 'raises an exception' 

    end
    context 'with length' do
      it 'returns an array starting at index with given length' 

    end
  end
end

