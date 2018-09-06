require 'rails_helper'

describe UsersHelper do
  include TermsHelper

  let(:user) { create(:user) }

  describe '#user_link' do
    subject { helper.user_link(user) }

    it "links to the user's profile" 


    it "has the user's email as title" 

  end

  describe '#profile_tabs' do
    subject(:tabs) { helper.profile_tabs }

    before do
      allow(helper).to receive(:current_user).and_return(user)
      allow(helper).to receive(:can?).and_return(true)
    end

    it 'includes all the expected tabs' 

  end

  describe '#current_user_menu_items' do
    subject(:items) { helper.current_user_menu_items }

    before do
      allow(helper).to receive(:current_user).and_return(user)
      allow(helper).to receive(:can?).and_return(false)
    end

    it 'includes all default items' 


    it 'includes the profile tab if the user can read themself' 


    it 'includes the settings tab if the user can update themself' 


    context 'when terms are enforced' do
      before do
        enforce_terms
      end

      it 'hides the profile and the settings tab' 

    end
  end
end

