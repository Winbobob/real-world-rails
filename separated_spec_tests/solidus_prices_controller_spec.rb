# frozen_string_literal: true

require 'spec_helper'

describe Spree::Admin::PricesController do
  stub_authorization!

  let!(:product) { create(:product) }

  describe '#index' do
    context "when only given a product" do
      let(:product) { create(:product) }

      subject { get :index, params: { product_id: product.slug } }

      it { is_expected.to be_successful }

      it 'assigns usable instance variables' 

    end

    context "when given a product and a variant" do
      let(:variant) { create(:variant) }
      let(:product) { variant.product }

      subject { get :index, params: { product_id: product.slug, variant_id: variant.id } }

      it { is_expected.to be_successful }

      it 'assigns usable instance variables' 

    end
  end
end

