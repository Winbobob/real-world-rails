require_relative '../spec_helper'

feature 'settling an order', js: true do
  let(:ftt) { create :financial_transaction_type }
  let(:admin) { create :user, groups:[create(:workgroup, role_finance: true)] }
  let(:user) { create :user, groups:[create(:ordergroup)] }
  let(:supplier) { create :supplier }
  let(:article) { create :article, supplier: supplier, unit_quantity: 1 }
  let(:order) { create :order, supplier: supplier, article_ids: [article.id] } # need to ref article
  let(:go1) { create :group_order, order: order }
  let(:go2) { create :group_order, order: order }
  let(:oa) { order.order_articles.find_by_article_id(article.id) }
  let(:goa1) { create :group_order_article, group_order: go1, order_article: oa }
  let(:goa2) { create :group_order_article, group_order: go2, order_article: oa }
  before do
    goa1.update_quantities(3, 0)
    goa2.update_quantities(1, 0)
    oa.update_results!
    order.finish!(admin)
    goa1.reload
    goa2.reload
  end

  it 'has correct order result' 


  before { login admin }
  before { visit new_finance_order_path(order_id: order.id) }

  it 'has product ordered visible' 


  it 'shows order result' 


  it 'keeps ordered quantities when article is deleted from resulting order' 


  it 'deletes an OrderArticle with no GroupOrderArticles' 


  it 'keeps ordered quantities when GroupOrderArticle is deleted from resulting order' 


  it 'deletes a GroupOrderArticle with no ordered amounts' 


  it 'keeps product when amount is set to zero' 


  it 'can add an ordergroup to an order article' 


  it 'can modify an ordergroup result' 


  it 'can modify an ordergroup result using the + button' 


  it 'can add an article' 

end

