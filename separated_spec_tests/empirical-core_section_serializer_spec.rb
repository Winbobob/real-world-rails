require 'rails_helper'

describe SectionSerializer, type: :serializer do
  let(:section)    { create(:section)}
  let(:serializer) { SectionSerializer.new(section) }

  describe '#to_json output' do
    let(:json)   { serializer.to_json }
    let(:parsed) { JSON.parse(json) }

    section_key = 'section'

    it "includes '#{section_key}' key" 


    describe "'#{section_key}' object" do
      let(:parsed_section) { parsed[section_key] }


      it 'has the correct keys' 


    end
  end
end

