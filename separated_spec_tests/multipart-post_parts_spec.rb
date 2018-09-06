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

require 'parts'
require 'stringio'
require 'composite_io'
require 'tempfile'

MULTIBYTE = File.dirname(__FILE__)+'/multibyte.txt'
TEMP_FILE = "temp.txt"

module AssertPartLength
  def assert_part_length(part)
    bytes = part.to_io.read
    bytesize = bytes.respond_to?(:bytesize) ? bytes.bytesize : bytes.length
    expect(bytesize).to be == part.length
  end
end

RSpec.describe Parts do
  let(:string_with_content_type) do
    Class.new(String) do
      def content_type; 'application/data'; end
    end
  end

  it "test_file_with_upload_io" 


  it "test_file_with_modified_string" 


  it "test_new_with_modified_string" 

end

RSpec.describe Parts::FilePart do
  include AssertPartLength

  before(:each) do
    File.open(TEMP_FILE, "w") {|f| f << "1234567890"}
    io =  UploadIO.new(TEMP_FILE, "text/plain")
    @part = Parts::FilePart.new("boundary", "afile", io)
  end

  after(:each) do
    File.delete(TEMP_FILE) rescue nil
  end

  it "test_correct_length" 


  it "test_multibyte_file_length" 


  it "test_multibyte_filename" 


   it "test_force_content_type_header" 
  it "test_correct_length" 

end

