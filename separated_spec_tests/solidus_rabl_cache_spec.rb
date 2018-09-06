# frozen_string_literal: true

require 'spec_helper'

describe "Rabl Cache", type: :request, caching: true do
  let!(:user)  { create(:admin_user) }

  before do
    create(:variant)
    user.generate_spree_api_key!
    expect(Spree::Product.count).to eq(1)
  end

  it "doesn't create a cache key collision for models with different rabl templates" 

end

