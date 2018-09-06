#
# Copyright (C) 2011 - present Instructure, Inc.
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

require 'sanitize'

describe Sanitize do
  it "should sanitize style attributes width invalid url protocols" 


  it "should sanitize the entire style string if they try to get tricky" 

  
  it "should sanitize style attributes width invalid methods" 

  
  it "should allow negative values" 


  it "should remove non-whitelisted css attributes" 


  it "should allow valid css methods with valid css protocols" 

  
  it "should allow font tags with valid attributes" 


  it "should allow valid MathML" 


  it "should strip invalid attributes from MathML" 


  it "should remove and not escape contents of style tags" 


  it "should not be extremely slow with long, weird microsoft styles" 


  Dir.glob(Rails.root.join('spec', 'fixtures', 'xss', '*.xss')) do |filename|
    name = File.split(filename).last
    it "should sanitize xss attempts for #{name}" 

  end
end

