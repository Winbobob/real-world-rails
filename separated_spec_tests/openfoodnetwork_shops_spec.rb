require 'spec_helper'

feature 'Shops', js: true do
  include AuthenticationWorkflow
  include UIComponentHelper

  let!(:distributor) { create(:distributor_enterprise, with_payment_and_shipping: true) }
  let!(:invisible_distributor) { create(:distributor_enterprise, visible: false) }
  let!(:profile) { create(:distributor_enterprise, sells: 'none') }
  let!(:d1) { create(:distributor_enterprise, with_payment_and_shipping: true) }
  let!(:d2) { create(:distributor_enterprise, with_payment_and_shipping: true) }
  let!(:order_cycle) { create(:simple_order_cycle, distributors: [distributor], coordinator: create(:distributor_enterprise)) }
  let!(:producer) { create(:supplier_enterprise) }
  let!(:er) { create(:enterprise_relationship, parent: distributor, child: producer) }

  before do
    producer.set_producer_property 'Organic', 'NASAA 12345'
  end

  it "searches by URL" 



  describe "listing shops" do
    before do
      visit shops_path
    end

    it "shows hubs" 


    it "does not show invisible hubs" 


    it "does not show hubs that are not in an order cycle" 


    it "does not show profiles" 


    it "shows closed shops after clicking the button" 


    it "links to the hub page" 


    describe "showing profiles" do
      before do
        check "Show profiles"
      end

      it "still shows hubs" 


      # https://github.com/openfoodfoundation/openfoodnetwork/issues/1718
      it "shows profiles" 

    end
  end

  describe "showing available hubs" do
    let!(:hub) { create(:distributor_enterprise, with_payment_and_shipping: false) }
    let!(:order_cycle) { create(:simple_order_cycle, distributors: [hub], coordinator: hub) }
    let!(:producer) { create(:supplier_enterprise) }
    let!(:er) { create(:enterprise_relationship, parent: hub, child: producer) }

    it "does not show hubs that are not ready for checkout" 

  end

  describe "filtering by product property" do
    let!(:order_cycle) { create(:simple_order_cycle, distributors: [d1, d2], coordinator: create(:distributor_enterprise)) }
    let!(:p1) { create(:simple_product, supplier: producer) }
    let!(:p2) { create(:simple_product, supplier: create(:supplier_enterprise)) }
    let(:ex_d1) { order_cycle.exchanges.outgoing.where(receiver_id: d1).first }
    let(:ex_d2) { order_cycle.exchanges.outgoing.where(receiver_id: d2).first }

    before do
      ex_d1.variants << p1.variants.first
      ex_d2.variants << p2.variants.first

      p2.set_property 'Local', 'XYZ 123'

      visit shops_path
    end

    it "filters" 

  end

  describe "taxon badges" do
    let!(:closed_oc) { create(:closed_order_cycle, distributors: [shop], variants: [p_closed.variants.first]) }
    let!(:p_closed) { create(:simple_product, taxons: [taxon_closed]) }
    let(:shop) { create(:distributor_enterprise, with_payment_and_shipping: true) }
    let(:taxon_closed) { create(:taxon, name: 'Closed') }

    describe "open shops" do
      let!(:open_oc) { create(:open_order_cycle, distributors: [shop], variants: [p_open.variants.first]) }
      let!(:p_open) { create(:simple_product, taxons: [taxon_open]) }
      let(:taxon_open) { create(:taxon, name: 'Open') }

      it "shows taxons for open order cycles only" 

    end

    describe "closed shops" do
      it "shows taxons for any order cycle" 

    end
  end

  describe "property badges" do
    let!(:order_cycle) { create(:simple_order_cycle, distributors: [distributor], coordinator: create(:distributor_enterprise), variants: [product.variants.first]) }
    let(:product) { create(:simple_product, supplier: producer) }

    before do
      product.set_property 'Local', 'XYZ 123'
    end

    it "shows property badges" 

  end

  describe "hub producer modal" do
    let!(:product) { create(:simple_product, supplier: producer, taxons: [taxon]) }
    let!(:taxon) { create(:taxon, name: 'Fruit') }
    let!(:order_cycle) { create(:simple_order_cycle, distributors: [distributor], coordinator: create(:distributor_enterprise), variants: [product.variants.first]) }

    it "shows hub producer modals" 

  end

  describe "viewing closed shops by URL" do
    before do
      d1
      d2
      visit shops_path(anchor: "/?show_closed=1")
    end

    it "shows closed shops" 

  end


  private

  def click_link_and_ensure(link_text, check)
    # Buttons appear to be unresponsive for a while, so keep clicking them until content appears
    using_wait_time 0.5 do
      10.times do
        click_link link_text
        break if check.call
      end
    end
  end
end

