require 'rails_helper'

RSpec.describe 'Content Pages API' do
  let(:default_params) { { format: :json } }

  describe 'GET index' do
    before(:each) do
      create :content_page
      create :content_page
      sign_in_as create :staff, :admin
      @content_pages = ContentPage.all
    end

    it 'returns a collection of all of the content pages' 


    it 'paginates the content pages' 

  end

  describe 'GET show' do
    before(:each) do
      create :content_page
      sign_in_as create :staff, :admin
      @content_page = ContentPage.first
    end

    it 'returns a content page', :show_in_doc do
      get "/api/v1/content_pages/#{@content_page.slug}"
      compare_content_pages(JSON.parse(response.body), @content_page)
    end

    it 'returns an error when the content page does not exist' 

  end

  describe 'PUT update' do
    before(:each) do
      create :content_page
      sign_in_as create :staff, :admin
      @content_page = ContentPage.first
    end

    it 'updates a content page', :show_in_doc do
      put "/api/v1/content_pages/#{@content_page.slug}", title: 'test title', body: 'test body'
      expect(response.status).to eq(204)
    end

    it 'returns an error when the content page does not exist' 

  end

  describe 'POST create' do
    before(:each) do
      sign_in_as create :staff, :admin
    end

    it 'creates an content page', :show_in_doc do
      post '/api/v1/content_pages/', title: 'test title', body: 'test body'
      compare_content_pages(JSON.parse(response.body), ContentPage.first)
    end
  end

  describe 'DELETE destroy' do
    before :each do
      sign_in_as create :staff, :admin
      @content_page = create :content_page
    end

    it 'removes the content page', :show_in_doc do
      delete "/api/v1/content_pages/#{@content_page.slug}"
      expect(response.status).to eq(204)
    end

    it 'returns an error when the content page does not exist' 

  end

  def compare_content_pages(response, page)
    expect(response.keys.length).to eq(page.attributes.length)
    expect(response['id']).to eq(page.id)
    expect(response['staff_id']).to eq(page.staff_id)
    expect(response['title']).to eq(page.title)
    expect(response['slug']).to eq(page.slug)
    expect(response['body']).to eq(page.body)

    check_dates(response, page)
  end

  def check_dates(response, page)
    expect(response['created_at'].to_datetime.to_i)
      .to be_within(0.1).of(page.created_at.to_i)

    expect(response['updated_at'].to_datetime.to_i)
      .to be_within(0.1).of(page.updated_at.to_i)

    expect(response['deleted_at'].to_datetime.to_i).to be_within(0.1).of(page.deleted_at.to_i) if response['deleted_at'].present?
  end
end

