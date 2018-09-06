# frozen_string_literal: true

require 'rails_helper'

describe ExploreController do
  render_views

  let!(:campaign) do
    create(:campaign, title: 'My awesome campaign',
                      start: Date.civil(2016, 1, 10),
                      end: Date.civil(2050, 1, 10))
  end

  let(:admin) { create(:admin) }

  describe '#index' do
    it 'redirects to campaign overview if given a campaign URL param' 


    it 'list active campaigns' 


    it 'lists active courses of the default campaign' 


    it 'works for admins' 

  end
end

