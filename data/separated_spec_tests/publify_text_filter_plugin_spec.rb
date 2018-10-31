require 'rails_helper'

describe TextFilterPlugin::Macro do
  describe '#self.attributes_parse' do
    it 'should parse lang="ruby" to {"lang" => "ruby"}' 


    it "should parse lang='ruby' to {'lang' => 'ruby'}" 

  end
end

