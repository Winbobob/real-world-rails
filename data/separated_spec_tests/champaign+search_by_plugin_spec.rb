# frozen_string_literal: true
require 'rails_helper'

describe 'Search ::' do
  describe 'PageSearcher' do
    context 'searches by single criterion,' do
      context 'by plugin' do
        let!(:petition_partial) { create(:liquid_partial, title: 'petition') }
        let!(:thermometer_partial) { create(:liquid_partial, title: 'thermometer') }

        let!(:default_layout) do
          create(:liquid_layout, :default, title: 'contains petition and thermometer plugin')
        end

        let!(:petition_layout) do
          create(:liquid_layout, :petition, title: 'contains petition plugin')
        end

        let!(:petition_page) do
          create(:page, liquid_layout: petition_layout, title: 'petition page - with petition layout')
        end

        let!(:thermometer_page) do
          create(
            :page,
            liquid_layout: default_layout,
            title: 'thermometer page - with default layout, petition toggled off'
          )
        end

        let!(:default_page) do
          create(
            :page,
            liquid_layout: default_layout,
            title: 'default page - with active thermometer and petition plugins'
          )
        end

        let!(:thermometer_page_thermometer) { create(:plugins_thermometer, page: thermometer_page) }
        let!(:default_page_thermometer) { create(:plugins_thermometer, page: default_page) }
        let!(:petition_page_thermometer) { create(:plugins_thermometer, page: petition_page, active: false) }

        let!(:petition_page_petition) { create(:plugins_petition, page: petition_page, active: true) }
        let!(:default_page_petition) { create(:plugins_petition, page: default_page, active: true) }
        let!(:thermometer_page_petition) { create(:plugins_petition, page: thermometer_page, active: false) }

        describe 'returns all pages when searching' do
          it 'with an empty array' 

          it 'with nil' 

          it 'with empty string' 

        end

        describe 'returns no pages when searching' do
          it 'with a plugin has been turned off on all of the pages' 

          it 'with a plugin that does not exist' 

          it 'with several plugins where a page matches one but not the rest of them' 


          it 'with several plugins where at least one page matches by criteria but at least one of the' \
          'requested plugins is deactivated' do
            default_page_thermometer.update(active: false)
            search = Search::PageSearcher.new(plugin_type: ['Plugins::Petition', 'Plugins::Thermometer']).search
            expect(search).to match_array([])
          end
        end

        describe 'returns some pages when searching' do
          it 'with a plugin that is active on several pages' 


          it 'with several plugins, if a page exists where all of them are active' 

        end
      end
    end
  end
end

