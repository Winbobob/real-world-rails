require 'rails_helper'

module BasicResources
  describe GroupsSerializer do
    context 'Passing a collection of Group instances' do
      let(:first_group) { FactoryGirl.create(:group) }
      let(:second_group) { FactoryGirl.create(:group) }

      subject { described_class.new([first_group, second_group]).to_hash }

      it 'returns the expected attributes' 

    end
  end
end

