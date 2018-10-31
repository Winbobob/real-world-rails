# Copyright, 2012, by Nick Sieger.
# Copyright, 2017, by Samuel G. D. Williams. <http://www.codeotaku.com>
# 
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
# 
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

require 'composite_io'
require 'stringio'
require 'timeout'

RSpec.shared_context "composite io" do
  it "test_full_read_from_several_ios" 

  
  it "test_partial_read" 


  it "test_partial_read_to_boundary" 


  it "test_read_with_size_larger_than_available" 

  
  it "test_read_into_buffer" 


  it "test_multiple_reads" 


  it "test_read_after_end" 


  it "test_read_after_end_with_amount" 

  
  it "test_second_full_read_after_rewinding" 

  
  # Was apparently broken on JRuby due to http://jira.codehaus.org/browse/JRUBY-7109
  it "test_compatible_with_copy_stream" 

end

RSpec.describe CompositeReadIO do
  describe "generic io" do
    subject {StringIO.new('the quick brown fox')}
  
    include_context "composite io"
  end
  
  describe "composite io" do
    subject {CompositeReadIO.new(StringIO.new('the '), StringIO.new('quick '), StringIO.new('brown '), StringIO.new('fox'))}
  
    include_context "composite io"
  end
  
  describe "nested composite io" do
    subject {CompositeReadIO.new(CompositeReadIO.new(StringIO.new('the '), StringIO.new('quick ')), StringIO.new('brown '), StringIO.new('fox'))}
  
    include_context "composite io"
  end
  
  describe "unicode composite io" do
    let(:utf8_io) {File.open(File.dirname(__FILE__)+'/multibyte.txt')}
    let(:binary_io) {StringIO.new("\x86")}
    
    subject {CompositeReadIO.new(binary_io, utf8_io)}
    
    it "test_read_from_multibyte" 

  end
  
  it "test_convert_error" 

  
  it "test_empty" 


  it "test_empty_limited" 


  it "test_empty_parts" 


  it "test_all_empty_parts" 

end

