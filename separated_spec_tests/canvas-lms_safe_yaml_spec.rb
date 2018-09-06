#
# Copyright (C) 2013 - present Instructure, Inc.
#
# This file is part of Canvas.
#
# Canvas is free software: you can redistribute it and/or modify it under
# the terms of the GNU Affero General Public License as published by the Free
# Software Foundation, version 3 of the License.
#
# Canvas is distributed in the hope that it will be useful, but WITHOUT ANY
# WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
# A PARTICULAR PURPOSE. See the GNU Affero General Public License for more
# details.
#
# You should have received a copy of the GNU Affero General Public License along
# with this program. If not, see <http://www.gnu.org/licenses/>.
#

require File.expand_path(File.dirname(__FILE__) + '/../spec_helper.rb')

describe "safe_yaml" do
  let(:test_yaml) {
    yaml = <<-YAML
---
hwia: !map:HashWithIndifferentAccess
  a: 1
  b: 2
float: !float
  5.1
float_with_exp: -1.7763568394002505e-15
float_inf: .inf
os: !ruby/object:OpenStruct
  modifiable: true
  table:
    :a: 1
    :b: 2
    :sub: !ruby/object:OpenStruct
      modifiable: true
      table:
        :c: 3
str: !str
  hai
mime: !ruby/object:Mime::Type
  string: png
  symbol:
  synonyms: []
http: !ruby/object:URI::HTTP
  fragment:
  host: example.com
  opaque:
  parser:
  password:
  path: /
  port: 80
  query:
  registry:
  scheme: http
  user:
https: !ruby/object:URI::HTTPS
  fragment:
  host: example.com
  opaque:
  parser:
  password:
  path: /
  port: 443
  query:
  registry:
  scheme: https
  user:
ab: !ruby/object:Class AcademicBenchmark::Converter
qt: !ruby/object:Class Qti::Converter
verbose_symbol: !ruby/symbol blah
oo: !ruby/object:OpenObject
  table:
    :a: 1
    YAML
  }

  it "should be used by default" 


  it "doesn't allow deserialization of arbitrary classes" 


  it "allows deserialization of arbitrary classes when unsafe_loading" 


  it "should allow some whitelisted classes" 


  it "should allow some whitelisted classes through psych" 


  it "should work with aliases" 


  it "should dump whole floats correctly" 


  it "should dump freaky floaty-looking strings" 


  it "should dump html-safe strings correctly" 


  it "should dump strings with underscores followed by an integer" 


  it "should also dump floaat looking strings followed by an underscore" 


  it "should dump whatever this is too" 


  it "should be able to dump and load Canvas:Plugin classes" 


  it "should be able to dump and load BigDecimals" 


  it "should be able to dump and load these strings in stuff" 


  it "dumps and loads singletons" 

end

