require 'spec_helper'

describe Admin::RecoveryDisplaysController do
  before do
    user = FactoryGirl.create(:admin)
    set_current_user(user)
  end

  describe 'index' do
    it 'renders' 

  end

  describe 'create' do
    context 'valid create' do
      let(:valid_attrs) { { quote: 'something that is nice and short and stuff' } }
      it 'creates the recovery_display' 

    end
    context 'valid create' do
      let(:invalid_attrs) do
        {
          quote: 'La croix scenester pug glossier, yuccie salvia humblebrag chia. Meditation health goth readymade flannel hot chicken austin tofu salvia cornhole tumeric hashtag plaid. Umami vegan hell of before they sold out copper mug chillwave authentic poke mumblecore godard la croix 8-bit. Venmo raw denim synth wolf. Food truck hot chicken waistcoat activated charcoal'
        }
      end
      it 'does not create a recovery display that is too long' 

    end
  end
end

