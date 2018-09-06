# frozen_string_literal: true
require 'rails_helper'

describe PageCloner do
  let!(:tag) { create(:tag) }
  let(:campaign) { create(:campaign) }
  let!(:petition_partial) { create :liquid_partial, title: 'petition', content: '{{ plugins.petition[ref] }}' }
  let!(:thermo_partial) { create :liquid_partial, title: 'thermometer', content: '{{ plugins.thermometer[ref] }}' }
  let(:liquid_layout) { create(:liquid_layout, :default) }
  let(:page) do
    create(
      :page,
      :featured,
      tags: [tag],
      campaign: campaign,
      liquid_layout: liquid_layout,
      title: 'foo bar',
      content: 'Foo Bar',
      action_count: 12_345
    )
  end
  let!(:image) { create(:image, page: page, id: 123) }
  let!(:fb_share) do
    create(:share_facebook,
           page: page,
           description: 'facebook share {LINK}',
           title: 'share',
           image_id: image.id)
  end
  let!(:tw_share) do
    create(:share_twitter,
           page: page,
           description: 'twitter share {LINK}')
  end
  let!(:email_share) do
    create(:share_email,
           page: page,
           subject: 'forward this email',
           body: 'They are on it! {LINK}')
  end
  let!(:link) { create(:link, page: page) }

  subject(:cloned_page) do
    @title ||= nil
    @language_id ||= nil
    @override_forms ||= nil
    VCR.use_cassette('page_cloner_share_success') do
      PageCloner.clone(page, @title, @language_id, @override_forms).reload
    end
  end

  it 'clones page' 


  it 'clones links' 


  it 'clones shares' 


  it 'clones facebook shares' 


  it 'clones twitter shares' 


  it 'clones email shares' 


  it 'clones tag associations' 


  it 'associates with the same language' 


  it 'associates with the same campaign' 


  it 'duplicates content' 


  it 'updates the language when language_id is passed' 


  it 'sets the new pages action_count to 0' 


  it 'unfeatures page' 


  describe 'title and slug' do
    context 'no title is passed in' do
      it 'clones title' 


      it 'clones slug with appended count' 

    end

    context 'new title passed in' do
      subject(:cloned_page) do
        VCR.use_cassette('page_cloner_share_success') do
          PageCloner.clone(page, 'The English Patient')
        end
      end

      it 'assigns new title' 

    end
  end

  context 'images' do
    let!(:image) { create(:image, page: page) }
    let!(:primary_image) { create(:image, page: page) }

    before do
      page.update(primary_image: primary_image)
    end

    it 'clones images' 


    it 'associates primary image' 

  end

  context 'plugins' do
    let(:custom_field) { create(:form_element, name: 'foo_bar') }
    let(:petition) { page.plugins.select { |p| p.class == Plugins::Petition }.first }

    before do
      link.destroy! # create the conditions that incited the bug previously
      petition.form.form_elements << custom_field
      petition.form.save
    end

    def get_plugin(type)
      [page.plugins.select { |plugin| plugin.is_a?(type) }.first,
       cloned_page.plugins.select { |plugin| plugin.is_a?(type) }.first]
    end

    it 'has the plugins indicated by the liquid layout before the clone' 


    it 'clones plugins' 


    it 'clones petition' 


    it 'clones thermometer' 


    context 'forms' do
      let(:form) { petition.form }
      let(:cloned_form) { cloned_page.plugins.first.form }

      it 'clones form' 


      it 'clones form elements' 


      context 'when override_forms is passed' do
        before :each do
          @override_forms = true
        end

        it 'with a language_id it creates a new form with the same language' 


        it 'without a language_id' 

      end
    end
  end
end

