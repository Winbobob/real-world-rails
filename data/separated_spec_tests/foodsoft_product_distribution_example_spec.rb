require_relative '../spec_helper'

feature 'product distribution', js: true do
  let(:ftt) { create :financial_transaction_type }
  let(:admin) { create :admin }
  let(:user_a) { create :user, groups: [create(:ordergroup)] }
  let(:user_b) { create :user, groups: [create(:ordergroup)] }
  let(:supplier) { create :supplier }
  let(:article) { create :article, supplier: supplier, unit_quantity: 5 }
  let(:order) { create(:order, supplier: supplier, article_ids: [article.id]) }
  let(:oa) { order.order_articles.first }

  before do
    # make sure users have enough money to order
    [user_a, user_b].each do |user|
      ordergroup = Ordergroup.find(user.ordergroup.id)
      ordergroup.add_financial_transaction! 5000, 'for ordering', admin, ftt
    end
    order # make sure order is referenced
  end

  it 'agrees to documented example' 

end

