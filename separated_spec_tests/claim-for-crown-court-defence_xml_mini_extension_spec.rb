require 'rails_helper'

describe XmlMiniExtension do

  subject { [1, 'a', nil] }

  let(:xml_result) { subject.to_xml(options.merge(skip_instruct: true, indent: 0)) }

  context 'without any options' do
    let(:options) { {} }

    it 'should serialize nil values' 

  end

  context 'with blank_nils option' do
    let(:options) { {blank_nils: true} }

    it 'should serialize nil values to empty strings' 

  end

  context 'with skip_nils option' do
    let(:options) { {skip_nils: true} }

    it 'should not serialize nil values and omit them' 

  end
end

