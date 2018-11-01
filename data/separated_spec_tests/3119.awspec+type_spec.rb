require 'spec_helper'

describe 'Awspec::Generator::Doc::Type' do
  it 'generate_doc output should be the same as doc/resource_types.md' 

end

types = Awspec::Helper::Type::TYPES
types.delete('base')
types.each do |type|
  describe 'Resource Type ' + type do
    let(:generator) { eval "Awspec::Generator::Doc::Type::#{type.camelize}.new" }
    it 'should generate doc' 

  end
end

