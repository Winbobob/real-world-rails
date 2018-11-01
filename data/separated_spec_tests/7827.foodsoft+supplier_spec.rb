# encoding: utf-8
require_relative '../spec_helper'

feature 'supplier' do
  let(:supplier) { create :supplier }

  describe 'create new' do
    let(:user) { create :user, groups:[create(:workgroup, role_suppliers: true)] }
    before { login user }

    it 'can be created' 


    it 'is included in supplier list' 

  end
end

