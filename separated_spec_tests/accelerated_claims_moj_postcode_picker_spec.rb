# coding: utf-8
describe 'MojPostcodePicker' do

  let(:form)      { double LabellingFormBuilder }
  let(:object)    { double Object }

  before(:each) do
    allow(form).to receive(:object).and_return( object )
  end

  describe 'new' do
    it 'calls load_haml just once the first time the class is instantiated' 


    it 'generates default prefixes and attribute names if no options specified' 


    it 'generates non-default prefixes and attribute names if options are specified' 


    it 'generates non-default name' 


    it 'generates non-default button label' 


  end

  describe 'emit' do
    it 'substitutes its own variables' 

  end

  describe 'country_name_for_messages' do
    before(:each) do
      allow(object).to receive(:postcode).and_return('RG2 7PU')
      allow(object).to receive(:street).and_return("50 Tregunter Road\r\nLondon")
      allow(object).to receive(:errors).and_return( {:street => [], :postcode => [] } )
    end

    it 'should return England and Wales' 


    it 'should return UK' 


    it 'should return England, Wales, Northern Ireland and Isle of Man' 


  end

end

def hidden_field_tag_html
  %q/<input class="manual_entry_flag" id="claim_property_manually_entered_address" name="claim[property][manually_entered_address]" type="hidden" value="1">/
end

