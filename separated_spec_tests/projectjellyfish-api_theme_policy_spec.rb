describe ThemePolicy do
  subject { ThemePolicy }

  let(:current_staff) { create :staff }
  let(:admin) { create :staff, :admin }

  permissions :update? do
    it 'prevents updates if not an admin' 

    it 'allows an admin to make updates' 

  end
end

