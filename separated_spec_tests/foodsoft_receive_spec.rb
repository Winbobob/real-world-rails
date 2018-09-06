require_relative '../spec_helper'

feature 'receiving an order', js: true do
  let(:admin) { create :user, groups:[create(:workgroup, role_orders: true)] }
  let(:supplier) { create :supplier }
  let(:article) { create :article, supplier: supplier, unit_quantity: 3 }
  let(:order) { create :order, supplier: supplier, article_ids: [article.id] } # need to ref article
  let(:go1) { create :group_order, order: order }
  let(:go2) { create :group_order, order: order }
  let(:oa) { order.order_articles.find_by_article_id(article.id) }
  let(:goa1) { create :group_order_article, group_order: go1, order_article: oa }
  let(:goa2) { create :group_order_article, group_order: go2, order_article: oa }

  # set quantities of group_order_articles
  def set_quantities(q1, q2)
    goa1.update_quantities(*q1)
    goa2.update_quantities(*q2)
    oa.update_results!
    order.finish!(admin)
    reload_articles
  end

  # reload all group_order_articles
  def reload_articles
    goa1.reload unless goa1.destroyed?
    goa2.reload unless goa2.destroyed?
    oa.reload
  end

  def check_quantities(units, q1, q2)
    reload_articles
    expect(oa.units).to eq units
    expect(goa1.destroyed? ? 0 : goa1.result).to be_within(1e-3).of q1
    expect(goa2.destroyed? ? 0 : goa2.result).to be_within(1e-3).of q2
  end

  before { login admin }

  it 'has product ordered visible' 


  it 'has product not ordered invisible' 


  it 'is not received by default' 


  it 'does not change anything when received is ordered' 


  it 'redistributes properly when received is more' 


  it 'redistributes properly when received is less' 


  it 'has a locked field when edited elsewhere' 


  it 'leaves locked rows alone when submitted' 

end

