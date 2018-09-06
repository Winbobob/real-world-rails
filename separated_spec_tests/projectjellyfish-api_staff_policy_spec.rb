describe StaffPolicy do
  subject { StaffPolicy }

  let(:current_staff) { create :staff }
  let(:other_staff) { create :staff, :user }
  let(:admin) { create :staff, :admin }

  permissions :index? do
    it 'denies access if not an admin' 

    it 'allows access for an admin' 

  end

  permissions :show? do
    it 'prevents other staff from seeing your profile' 

    it 'allows you to see your own profile' 

    it 'allows an admin to see any profile' 

  end

  permissions :create? do
    it 'prevents creation if not an admin' 

    it 'allows an admin to create users' 

  end

  permissions :update? do
    it 'prevents updates if not an admin' 

    it 'allows an admin to make updates' 

  end

  permissions :destroy? do
    it 'prevents deleting yourself' 

    it 'allows an admin to delete any staff' 

  end
end

