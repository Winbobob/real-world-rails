# -*- encoding : utf-8 -*-
require 'spec_helper'

describe 'when displaying user listings' do
  let(:highlighted_words) { [] }
  let(:user) { FactoryBot.create(:user) }

  before do
    assign :highlight_words, highlighted_words
  end

  def render_view
    render :partial => 'user/user_listing_single',
           :locals => { :display_user => user }
  end

  it 'displays a normal request' 


  it 'does not display an embargoed request' 


  it 'does not display a hidden request' 

end

