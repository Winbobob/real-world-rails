require 'helper'
require 'parser_shared_example'

class MockDecoder
  def self.parse; end
end

describe 'MultiXml' do
  context 'Parsers' do
    it 'picks a default parser' 


    it 'defaults to the best available gem' 


    it 'is settable via a symbol' 


    it 'is settable via a class' 

  end

  [%w(LibXML libxml),
   %w(REXML rexml/document),
   %w(Nokogiri nokogiri),
   %w(Ox ox),
   %w(Oga oga)].each do |parser|
    begin
      require parser.last
      context "#{parser.first} parser" do
        it_behaves_like 'a parser', parser.first
      end
    rescue LoadError
      puts "Tests not run for #{parser.first} due to a LoadError"
    end
  end
end

