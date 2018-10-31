require 'spec_helper'

describe 'API V2 Storefront Cart Spec', type: :request do
  let(:default_currency) { 'USD' }
  let(:store) { create(:store, default_currency: default_currency) }
  let(:currency) { store.default_currency }
  let(:user)  { create(:user) }
  let(:token) { Doorkeeper::AccessToken.create!(resource_owner_id: user.id, expires_in: nil) }
  let(:order) { Spree::Order.last }

  shared_examples 'returns valid cart JSON' do
    it 'returns a valid cart JSON response' 

  end

  shared_context 'creates order with line_item' do
    let!(:order)     { create(:order, user: user, store: store, currency: currency) }
    let!(:line_item) { create(:line_item, order: order, currency: currency) }
    let!(:headers)   { { 'Authorization' => "Bearer #{token.token}" } }
  end

  shared_context 'creates guest order with guest token' do
    let(:guest_token) { 'guest_token' }
    let!(:order)      { create(:order, token: guest_token, store: store, currency: currency) }
    let!(:line_item)  { create(:line_item, order: order, currency: currency) }
    let!(:headers)    { { 'X-Spree-Order-Token' => order.token } }
  end

  describe 'cart#create' do
    shared_examples 'creates an order' do
      it 'returns a proper HTTP status' 


      it_behaves_like 'returns valid cart JSON'
    end

    context 'for signed in user' do
      before do
        headers = { 'Authorization' => "Bearer #{token.token}" }
        post '/api/v2/storefront/cart', headers: headers
      end

      it_behaves_like 'creates an order'

      it 'associates order with user' 

    end

    context 'as guest user' do
      before do
        post '/api/v2/storefront/cart'
      end

      it_behaves_like 'creates an order'
    end

    context 'for specified currency' do
      before do
        store.update!(default_currency: 'EUR')
        post '/api/v2/storefront/cart'
      end

      it_behaves_like 'creates an order'

      it 'sets proper currency' 

    end
  end

  describe 'cart#add_item' do
    let(:variant) { create(:variant) }
    let(:headers) { { 'Authorization' => "Bearer #{token.token}" } }

    shared_examples 'adds item' do
      it 'with success' 

    end

    context 'without existing order' do
      it 'returns error' 

    end

    context 'with existing order' do
      let!(:order) { create(:order, user: user, store: store, currency: currency) }

      before do
        post '/api/v2/storefront/cart/add_item', params: { variant_id: variant.id, quantity: 5 }, headers: headers
      end

      it_behaves_like 'adds item'

      it_behaves_like 'returns valid cart JSON'
    end

    context 'with existing guest order' do
      let(:custom_token) { 'custom_token' }
      let!(:order) { create(:order, token: custom_token, store: store, currency: currency) }

      before do
        post '/api/v2/storefront/cart/add_item', params: { variant_id: variant.id, quantity: 5, order_token: custom_token }, headers: headers
      end

      it_behaves_like 'adds item'

      it_behaves_like 'returns valid cart JSON'
    end

    context 'with options' do
      let!(:order) { create(:order, user: user, store: store, currency: currency) }
      let(:options) { { cost_price: 1.99 } }

      before do
        Spree::PermittedAttributes.line_item_attributes << :cost_price

        post '/api/v2/storefront/cart/add_item', params: { variant_id: variant.id, quantity: 5, options: options }, headers: headers
      end

      it_behaves_like 'adds item'

      it_behaves_like 'returns valid cart JSON'

      it 'sets custom attributes values' 

    end

    context 'with quantity unnavailble' do
      let!(:order) { create(:order, user: user, store: store, currency: currency) }
      let(:variant) { create(:variant) }

      before do
        variant.stock_items.first.update(backorderable: false)
        post '/api/v2/storefront/cart/add_item', params: { variant_id: variant.id, quantity: 11 }, headers: headers
      end

      it 'returns 422 when there is not enough stock' 

    end
  end

  describe 'cart#remove_line_item' do
    shared_examples 'removes line item' do
      context 'without line items' do
        let!(:line_item) { create(:line_item) }

        it 'tries to remove an item and fails' 

      end

      context 'containing line item' do
        let!(:line_item) { create(:line_item, order: order) }

        it 'removes line item from the cart' 

      end
    end

    context 'without existing order' do
      let!(:line_item) { create(:line_item) }

      it 'returns error' 

    end

    context 'existing order' do
      let!(:order) { create(:order, user: user, store: store, currency: currency) }
      let!(:headers) { { 'Authorization' => "Bearer #{token.token}" } }

      it_behaves_like 'removes line item'
    end

    context 'as a guest' do
      let!(:order) { create(:order, user: user, store: store, currency: currency) }
      let!(:headers) { { 'X-Spree-Order-Token' => order.token } }

      it_behaves_like 'removes line item'
    end
  end

  describe 'cart#empty' do
    shared_examples 'emptying the order' do
      it 'empties the order' 

    end

    context 'without existing order' do
      it 'returns status code 404' 

    end

    context 'with existing order and line item' do
      include_context 'creates order with line_item'

      it_behaves_like 'emptying the order'
    end

    context 'with existing guest order and line item' do
      include_context 'creates guest order with guest token'

      it_behaves_like 'emptying the order'
    end
  end

  describe 'cart#set_quantity' do
    let!(:order) { create(:order, user: user, store: store, currency: currency) }
    let!(:line_item) { create(:line_item, order: order) }

    context 'with insufficient stock quantity and non-backorderable item' do
      before do
        line_item.variant.stock_items.first.update(backorderable: false)
      end

      it 'returns 422 when there is not enough stock' 

    end

    it 'changes the quantity of line_item' 


    it 'returns 422 when quantity is 0' 


    it 'returns 422 when quantity is absent' 

  end

  describe 'cart#show' do
    shared_examples 'showing the cart' do
      before do
        get '/api/v2/storefront/cart', headers: headers
      end

      it 'returns a proper HTTP status' 


      it_behaves_like 'returns valid cart JSON'
    end

    shared_examples 'showing 404' do
      it 'returns status 404' 

    end

    context 'without existing order' do
      let!(:headers) { { 'Authorization': "Bearer #{token.token}" } }

      it_behaves_like 'showing 404'
    end

    context 'with existing user order with line item' do
      include_context 'creates order with line_item'

      it_behaves_like 'showing the cart'
    end

    context 'with existing guest order' do
      include_context 'creates guest order with guest token'

      it_behaves_like 'showing the cart'
    end

    context 'for specified currency' do
      before do
        store.update!(default_currency: 'EUR')
      end

      context 'with matching currency' do
        include_context 'creates guest order with guest token'

        it_behaves_like 'showing the cart'

        it 'includes the same currency' 

      end
    end
  end

  describe 'cart#apply_coupon_code' do
    let!(:order) { create(:order, user: user, store: store, currency: currency) }
    let!(:line_item) { create(:line_item, order: order) }
    let!(:shipment) { create(:shipment, order: order) }
    let!(:promotion) { Spree::Promotion.create(name: 'Free shipping', code: 'freeship') }
    let(:coupon_code) { promotion.code }
    let!(:promotion_action) { Spree::PromotionAction.create(promotion_id: promotion.id, type: 'Spree::Promotion::Actions::FreeShipping') }
    let(:headers) { { 'Authorization' => "Bearer #{token.token}" } }

    context 'with coupon code for free shipping' do
      let(:adjustment_value) { -(shipment.cost.to_f) }

      context 'applies coupon code correctly' do
        before do
          patch '/api/v2/storefront/cart/apply_coupon_code', params: { user: user, coupon_code: coupon_code }, headers: headers
        end

        it 'changes the adjustment total' 


        it 'includes the promotion in the response' 


        it_behaves_like 'returns valid cart JSON'
      end

      context 'does not apply the coupon code' do
        before do
          patch '/api/v2/storefront/cart/apply_coupon_code', params: { user: user, coupon_code: 'zxr' }, headers: headers
        end

        it 'returns 422 status with an error' 

      end
    end

    context 'without coupon code' do
      context 'does not apply the coupon code' do
        before do
          patch '/api/v2/storefront/cart/apply_coupon_code', params: { user: user, coupon_code: '' }, headers: headers
        end

        it 'returns 422 status with an error' 

      end
    end
  end
end

