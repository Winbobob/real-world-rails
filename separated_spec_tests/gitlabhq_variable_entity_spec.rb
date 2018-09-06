require 'spec_helper'

describe VariableEntity do
  let(:variable) { create(:ci_variable) }
  let(:entity) { described_class.new(variable) }

  describe '#as_json' do
    subject { entity.as_json }

    it 'contains required fields' 

  end
end

