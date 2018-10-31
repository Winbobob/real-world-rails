require_relative '../../spec_helper'
require 'time'

module Aws
  module Xml
    describe Parser do
      [:ox, :oga, :nokogiri, :libxml, :rexml].each do |engine|
        describe("ENGINE: #{engine}") do

          begin
            Parser.engine = engine
          rescue LoadError
            next
          end

          let(:shapes) { ApiHelper.sample_shapes }

          let(:parser) {
            api = ApiHelper.sample_api(shapes:shapes)
            rules = api.operation(:example_operation).output
            Parser.new(rules)
          }

          def parse(xml, to_h = true)
            data = parser.parse(xml)
            to_h ? data.to_h : data
          end

          it 'does not trap xml parsing errors' 


          it 'returns an empty hash when the XML is empty' 


          it 'ignores xml namespaces on the root element' 


          it 'returns an instance of Struct' 


          it 'parses complex and nested documents' 


          describe 'structures' do

            it 'observes locationName traits' 


            it 'ignores unknown elements' 


          end

          describe 'lists' do

            it 'observes locationName traits' do # list and list member
              ref = shapes['StructureShape']['members']['NumberList']
              ref['locationName'] = 'Numbers'
              shapes['IntegerList']['member']['locationName'] = 'Value'
              xml = <<-XML.strip
              <xml>
                <Numbers>
                  <Value>1</Value>
                  <Value>2</Value>
                  <Value>3</Value>
                </Numbers>
              </xml>
              XML
              expect(parse(xml)).to eq(number_list:[1,2,3])
            end

            it 'returns missing lists as a DefaultList' 


            it 'returns empty lists as a []' 


            it 'supports flattened lists' 


            it 'supports flattened lists with locationName trait' 


            it 'supports flattened lists with member locationName trait' 


          end

          describe 'maps' do

            it 'returns missing maps as a DefaultMap' 


            it 'returns empty maps as {}' 


            it 'supports maps with locationName traits' do # key and value
              shapes['StringMap']['key']['locationName'] = 'AttrName'
              shapes['StringMap']['value']['locationName'] = 'AttrValue'
              xml = <<-XML.strip
              <xml>
                <StringMap>
                  <entry>
                    <AttrName>size</AttrName>
                    <AttrValue>large</AttrValue>
                  </entry>
                  <entry>
                    <AttrName>color</AttrName>
                    <AttrValue>red</AttrValue>
                  </entry>
                </StringMap>
              </xml>
              XML
              expect(parse(xml)).to eq(string_map: {
                'size' => 'large',
                'color' => 'red',
              })
            end

            it 'supports flattened maps' 


            it 'supports flattened maps with locationName traits' 


          end

          describe 'booleans' do

            it 'supports true values' 


            it 'supports false values' 


            it 'returns nil for an empty element' 


          end

          describe 'timestamps' do

            it 'supports unix timestamps' 


            it 'supports iso8601 strings' 


            it 'supports rfc822 strings' 


          end

          describe 'strings' do

            it 'base64 decodes with encoding is set' 


          end

          describe 'xml attributes' do

            it 'supports paring structure members from xml attributes' 


            it 'ignores xml attributes that are not members' 


            it 'supports xml attributes with qnames' 


          end
        end
      end
    end
  end
end

