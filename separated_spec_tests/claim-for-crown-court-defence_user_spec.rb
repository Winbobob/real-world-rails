require 'rails_helper'

module Remote
  describe User do
    let(:user)  { ::Remote::User.new first_name: 'Charles', last_name: 'Dickens' }
    describe '#name' do
      it 'returns first name last name' 

    end

    describe '#sortable_name' do
      it 'returns last name first name' 

    end
  end
end

