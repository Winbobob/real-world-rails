require 'spec_helper'

describe 'new reimbursement type', type: :feature do
  stub_authorization!

  before do
    visit '/admin/reimbursement_types/new'
  end

  it 'view should have select field' 


  context 'with valid attributes' do
    it 'credit type' 


    it 'exchange type' 


    it 'original payment type' 


    it 'store credit type' 

  end

  context 'with invalid params' do
    it 'without name' 

  end
end

