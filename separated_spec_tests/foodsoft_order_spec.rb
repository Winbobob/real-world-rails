require_relative '../spec_helper'

feature Order, js: true do
  let(:admin) { create :user, groups:[create(:workgroup, role_orders: true)] }
  let(:article) { create :article, unit_quantity: 1 }
  let(:order) { create :order, supplier: article.supplier, article_ids: [article.id] } # need to ref article
  let(:go1) { create :group_order, order: order }
  let(:oa) { order.order_articles.find_by_article_id(article.id) }
  let(:goa1) { create :group_order_article, group_order: go1, order_article: oa }

  before { login admin }

  it 'can get to the new order page' 


  it 'fills in the end date with a schedule' 


  it 'can create a new order' 


  it 'can close an order' 


  def setup_and_close_order
    # have at least something ordered
    goa1.update_quantities 1, 0
    oa.update_results!
    # and close the order
    visit orders_path
    click_link_or_button I18n.t('orders.index.action_end')
    expect(page).to have_selector('.alert-success')
    order.reload
    oa.reload
  end
end

