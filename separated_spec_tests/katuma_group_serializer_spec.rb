require 'rails_helper'

module BasicResources
  describe GroupSerializer do
    context 'passing a Group instance' do
      let(:group) { FactoryGirl.create(:group) }

      subject { described_class.new(group).to_hash }

      it 'returns the expected attributes' 

    end
  end
end

