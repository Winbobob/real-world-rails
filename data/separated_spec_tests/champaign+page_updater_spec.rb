# frozen_string_literal: true

require 'rails_helper'

describe PageUpdater do
  # these are really integration tests, but I want to test it does the things
  # that will actually make or break the campaigner experience

  let!(:petition_partial) { create :liquid_partial, title: 'petition', content: '{{ plugins.petition[ref].lol }}' }
  let!(:thermo_partial) { create :liquid_partial, title: 'thermometer', content: '{{ plugins.thermometer[ref].lol }}' }
  let(:liquid_layout) { create :liquid_layout, :default }
  let(:page) { create :page, liquid_layout: liquid_layout }
  let(:url) { 'sumofus.org/my-path' }
  let(:simple_changes) { { page: { title: 'howdy folks!', content: 'Did they get you to trade' } } }
  let(:breaking_changes) { { page: { title: nil, content: 'your heros for ghosts' } } }
  let(:thermo_plugin) { page.plugins.select { |p| p.name == 'Thermometer' }.first }
  let(:petition_plugin) { page.plugins.select { |p| p.name == 'Petition' }.first }

  subject(:pupdater) { PageUpdater.new(page, url) }

  it { is_expected.to respond_to :update }
  it { is_expected.to respond_to :errors }
  it { is_expected.to respond_to :refresh? }

  before do
    allow(QueueManager).to receive(:push)
  end

  describe 'update' do
    describe 'enqueue for ActionKit' do
      context 'it occurs if' do
        it 'title change' 


        it 'language change' 


        it 'tag additions' 


        it 'tag deletions' 

      end

      context 'it does not occur if' do
        it 'content change' 


        it 'plugin change' 


        it 'does not save' 

      end
    end

    context 'on success' do
      it 'returns true' 


      it 'enqueues page for update' 

    end

    context 'with errors' do
      it 'returns false' 


      it 'does not enqueue' 

    end

    it 'can update one plugin' 


    it 'can update multiple plugin' 


    it 'can update the page' 


    it 'can update plugins and page together' 


    it "updates the plugins even if it can't update the page" 


    it "updates the page even if it can't update the plugins" 


    it 'raises ActiveRecord::RecordNotFound if missing plugin name' 


    it 'raises ActiveRecord::RecordNotFound if missing plugin id' 


    it 'updates the publish status to "published"' 


    it 'updates the pulish status to "unpublished"' 


    it 'updates the pulish status to "archived"' 


    describe 'shares' do
      let(:errorless_variant) { instance_double('Shares::Twitter', errors: {}) }
      let(:error_variant) { instance_double('Shares::Twitter', errors: { description: "can't be blank" }) }
      let(:create_params) { { share_twitter_1: { description: 'I want you to {LINK} for me', name: 'twitter' } } }
      let(:update_params) do
        {
          share_twitter_12: {
            description: 'I want you to {LINK} for me',
            name: 'twitter',
            id: '12'
          }
        }
      end

      before :each do
        allow(ShareVariantBuilder).to receive(:create) { errorless_variant }
        allow(ShareVariantBuilder).to receive(:update) { errorless_variant }
        params = { share_twitter_1: { description: 'I want you to {LINK} for me', id: '1', name: 'twitter' } }
      end

      it 'creates variants if not given an id' 


      it 'updates variants if given an id' 


      it 'can update and create at the same time' 


      it 'can update multiple at once' 


      it 'can return multiple errors' 

    end
  end

  describe 'errors' do
    it 'returns errors nested by page' 


    it 'returns errors nested by plugin' 

  end

  describe 'refresh?' do
    let(:ll_different_plugins) { create :liquid_layout, :thermometer }
    let(:ll_same_plugins) { create :liquid_layout, :default, title: 'Swoop swoop' }

    it 'returns false before update called' 


    it 'returns false if nothing changed' 


    it 'returns false if several non-refresh fields were updated' 


    it 'returns true if new liquid_layout has different plugins' 


    it 'returns false if new liquid_layout has the same plugins' 

  end
end

