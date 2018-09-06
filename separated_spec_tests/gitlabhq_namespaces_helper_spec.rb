require 'spec_helper'

describe NamespacesHelper do
  let!(:admin) { create(:admin) }
  let!(:admin_group) { create(:group, :private) }
  let!(:user) { create(:user) }
  let!(:user_group) { create(:group, :private) }

  before do
    admin_group.add_owner(admin)
    user_group.add_owner(user)
  end

  describe '#namespaces_options' do
    it 'returns groups without being a member for admin' 


    it 'returns only allowed namespaces for user' 


    context 'when nested groups are available', :nested_groups do
      it 'includes groups nested in groups the user can administer' 


      it 'orders the groups correctly' 

    end
  end
end

