require 'rails_helper'

RSpec.describe CategoryGuardian do
  let(:admin) { Fabricate(:admin) }
  let(:guardian) { Guardian.new(admin) }
  let(:category) { Fabricate(:category) }

  describe '#cannot_delete_category_reason' do
    describe 'when category is uncategorized' do
      it 'should return the reason' 

    end

    describe 'when category has subcategories' do
      it 'should return the right reason' 

    end

    describe 'when category has topics' do
      it 'should return the right reason' 

    end
  end
end

