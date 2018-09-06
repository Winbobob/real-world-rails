require 'spec_helper'

describe 'page promotions', type: :feature do
  before do
    create(:product, name: 'RoR Mug', price: 20)

    promotion = Spree::Promotion.create!(name:       '$10 off',
                                         path:       'test',
                                         starts_at:  1.day.ago,
                                         expires_at: 1.day.from_now)

    calculator = Spree::Calculator::FlatRate.new
    calculator.preferred_amount = 10

    action = Spree::Promotion::Actions::CreateItemAdjustments.create(calculator: calculator)
    promotion.actions << action

    visit spree.root_path
    click_link 'RoR Mug'
    click_button 'add-to-cart-button'
  end

  it 'automatically applies a page promotion upon visiting' 


  it "does not activate an adjustment for a path that doesn't have a promotion" 

end

