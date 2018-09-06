require 'spec_helper'
require 'open_food_network/cached_products_renderer'

module OpenFoodNetwork
  describe CachedProductsRenderer do
    let(:distributor) { double(:distributor, id: 123) }
    let(:order_cycle) { double(:order_cycle, id: 456) }
    let(:cpr) { CachedProductsRenderer.new(distributor, order_cycle) }

    describe "#products_json" do
      context "when in testing / development" do
        let(:products_renderer) do
          double(ProductsRenderer, products_json: 'uncached products')
        end

        before do
          allow(ProductsRenderer)
            .to receive(:new)
            .with(distributor, order_cycle) { products_renderer }
        end

        it "returns uncaches products JSON" 

      end

      context "when in production / staging" do
        before do
          allow(Rails.env).to receive(:production?) { true }
        end

        describe "when the distribution is not set" do
          let(:cpr) { CachedProductsRenderer.new(nil, nil) }

          it "raises an exception and returns no products" 

        end

        describe "when the products JSON is already cached" do
          before do
            Rails.cache.write "products-json-#{distributor.id}-#{order_cycle.id}", 'products'
          end

          it "returns the cached JSON" 


          it "raises an exception when there are no products" 

        end

        describe "when the products JSON is not cached" do
          let(:cache_key) { "products-json-#{distributor.id}-#{order_cycle.id}" }
          let(:cached_json) { Rails.cache.read(cache_key) }
          let(:cache_present) { Rails.cache.exist?(cache_key) }
          let(:products_renderer) do
            double(ProductsRenderer, products_json: 'fresh products')
          end

          before do
            Rails.cache.delete(cache_key)

            allow(ProductsRenderer)
              .to receive(:new)
              .with(distributor, order_cycle) { products_renderer }
          end

          describe "when there are products" do
            it "returns products as JSON" 


            it "caches the JSON" 

          end

          describe "when there are no products" do
            let(:products_renderer) { double(ProductsRenderer) }

            before do
              allow(products_renderer).to receive(:products_json).and_raise ProductsRenderer::NoProducts

              allow(ProductsRenderer)
                .to receive(:new)
                .with(distributor, order_cycle) { products_renderer }
            end

            it "raises an error" 


            it "caches the products as nil" 

          end
        end
      end
    end
  end
end

