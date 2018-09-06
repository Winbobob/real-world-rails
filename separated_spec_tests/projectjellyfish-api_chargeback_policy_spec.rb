describe ChargebackPolicy do
  subject { ChargebackPolicy }

  let(:chargeback) { create :chargeback }
  let(:current_staff) { create :staff }
  let(:admin) { create :staff, :admin }

  permissions :index? do
    it 'allows access for a user' 

    it 'allows access for an admin' 

  end

  permissions :show? do
    it 'does not allow users to view chargebacks' 

    it 'allows an admin to see any chargeback' 

  end

  permissions :create? do
    it 'prevents creation if not an admin' 

    it 'allows an admin to create chargebacks' 

  end

  permissions :update? do
    it 'does not allow users to update chargebacks' 

    it 'allows an admin to make updates' 

  end

  permissions :destroy? do
    it 'does not allow users to delete chargebacks' 

    it 'allows an admin to delete any chargeback' 

  end
end

