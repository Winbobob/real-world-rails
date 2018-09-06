describe ContentPagePolicy do
  subject { ContentPagePolicy }

  let(:content_page) { create :content_page }
  let(:current_staff) { create :staff }
  let(:admin) { create :staff, :admin }

  permissions :index? do
    it 'allows access for a user' 

    it 'allows access for an admin' 

  end

  permissions :show? do
    it 'allows users to view content pages' 

    it 'allows an admin to see any content page' 

  end

  permissions :create? do
    it 'prevents creation if not an admin' 

    it 'allows an admin to create content pages' 

  end

  permissions :update? do
    it 'does not allow users to update content pages' 

    it 'allows an admin to make updates' 

  end

  permissions :destroy? do
    it 'does not allow users to delete content pages' 

    it 'allows an admin to delete any content page' 

  end
end

