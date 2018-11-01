# frozen_string_literal: true

require 'rails_helper'

describe 'api/pages' do
  def json
    JSON.parse(response.body)
  end

  let(:expected) do
    %w[
      id
      title
      slug
      content
      created_at
      updated_at
      publish_status
      campaign_action_count
      action_count
      language
      featured
      image
      url
    ]
  end

  describe 'GET index' do
    before do
      create(:page, :published, title: 'Foo', content: 'Bar')
    end

    subject { JSON.parse(response.body) }
    before { get('/api/pages.json') }

    it 'returns list of pages' 

  end

  describe 'GET featured' do
    before do
      create(:page, :published, featured: true, title: 'Foo', content: 'Bar')
      create(:page, featured: false)
    end

    subject { JSON.parse(response.body) }
    before { get(featured_api_pages_path(format: :json)) }

    it 'returns list of pages' 

  end

  describe 'GET show' do
    let(:page) { create(:page, title: 'Foo', content: 'Bar') }

    subject { JSON.parse(response.body) }

    before { get(api_page_path(page, format: :json)) }

    it 'returns page' 

  end

  describe 'GET actions' do
    let(:page) { create :page }
    let!(:actions) do
      %i[default published hidden].map do |status|
        create :action, page: page, publish_status: status, form_data: { action_foo: status }
      end
    end

    subject { get api_page_actions_path(page) }

    it 'returns a 403 if the page publish_actions is secure' 


    it 'returns published and default actions if page publish_actions is default_published' 


    it 'returns only published pages if page publish_actions is default_hidden' 


    it 'returns a hash with the names of the headers' 


    it 'will paginate according to parameters that are passed to it' 

  end

  describe 'GET /similar' do
    let(:name_tag) { create :tag, name: 'TuuliP' }
    let(:region_tag) { create :tag, name: '@Global' }
    let(:issue_tag1) { create :tag, name: '#AnimalRights' }
    let(:issue_tag2) { create :tag, name: '#Sexism' }
    let(:english) { create :language, :english }

    let!(:original_page) do
      create(:page,
             :published,
             id: 123,
             title: 'Coolest petition',
             content: 'Coolest petition content',
             language: english,
             tags: [name_tag, region_tag, issue_tag1, issue_tag2])
    end

    context 'valid request' do
      # Look into spec/service/page_service.spec for specs going through all the business logic of deciding which
      # pages to send back in the request.
      let!(:similar_page) do
        create(:page,
               :published,
               title: 'A very similar page',
               content: 'Also cool content',
               language: english,
               tags: [name_tag, region_tag, issue_tag1, issue_tag2])
      end

      let!(:another_similar_page) do
        create(:page,
               :published,
               title: 'A similar petition',
               language: english,
               tags: [name_tag, region_tag, issue_tag1])
      end

      let!(:similar_unpublished) do
        create(:page,
               :unpublished,
               title: 'Similar but unpublished',
               language: english,
               tags: [name_tag, region_tag, issue_tag1, issue_tag2])
      end

      let!(:one_issue_tag_page) do
        create(:page,
               :published,
               title: 'One tag match',
               language: english,
               tags: [name_tag, region_tag, issue_tag1])
      end

      it 'returns the specified number of pages with tags that are similar to the original page' 

    end

    context 'the requested page does not exist' do
      it 'responds with 404' 

    end
  end
end
