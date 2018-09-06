require 'spec_helper'

describe 'edit reimbursement type', type: :feature do
  stub_authorization!
  let(:r_type) do
    create(:reimbursement_type,
           name: 'Exchange',
           type: 'Spree::ReimbursementType::Exchange',
           active: true,
           mutable: true)
  end

  before do
    visit "/admin/reimbursement_types/#{r_type.id}/edit"
  end

  context 'with valid attributes' do
    it 'change name, active and mutable' 

  end

  it 'view should have select field' 

end

