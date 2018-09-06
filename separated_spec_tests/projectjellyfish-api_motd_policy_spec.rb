describe MotdPolicy do
  subject { MotdPolicy }

  let(:motd) { create :motd }
  let(:user) { create :staff, :user }
  let(:admin) { create :staff, :admin }
  let(:guest) { nil }

  permissions :create? do
    it 'prevents creation of an MOTD for a user' 


    it 'allows creation of an MOTD for an admin' 


    it 'prevents creation of an MOTD for a guest' 

  end

  permissions :update? do
    it 'prevents updates for a user' 


    it 'allows an admin to make updates' 


    it 'prevents updates for a guest' 

  end

  permissions :destroy? do
    it 'prevents deleting for a user' 


    it 'allows an admin to delete an MOTD' 


    it 'prevents deleting for a guest' 

  end
end

