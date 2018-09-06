describe OrganizationPolicy do
  subject { OrganizationPolicy }

  let(:organization) { create :organization }
  let(:current_staff) { create :staff }
  let(:admin) { create :staff, :admin }
  let(:user) do
    user = create :staff, :user
    user
  end

  permissions :index? do
    it 'allows access for a user' 

    it 'allows access for an admin' 

  end

  permissions :show? do
    it 'allows users to view organizations' 

    it 'allows an admin to see any organization' 

  end

  permissions :create? do
    it 'prevents creation if not an admin' 

    it 'allows an admin to create organizations' 

  end

  permissions :update? do
    it 'does not allow users to update organizations' 

    it 'allows an admin to make updates' 

  end

  permissions :destroy? do
    it 'does not allow users to delete organizations' 

    it 'allows an admin to delete any organization' 

  end
end

