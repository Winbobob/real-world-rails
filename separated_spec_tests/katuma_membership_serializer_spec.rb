require 'rails_helper'

module BasicResources
  describe MembershipSerializer do
    context 'Passing a Membership instance' do
      let(:user) do
        user = FactoryGirl.create(:user)
        User.find(user.id)
      end
      let(:group) { FactoryGirl.create(:group) }
      let(:membership) do
        FactoryGirl.create(
          :membership,
          basic_resource_group_id: group.id,
          user: user,
          role: Membership::ROLES[:admin]
        )
      end

      subject { MembershipSerializer.new(membership).to_hash }

      it 'returns the expected attributes' 

    end
  end
end

