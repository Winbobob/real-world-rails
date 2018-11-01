require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
  controller do
    before_action :authorize, only: [:destroy]
    before_action :set_title

    def index
      signed_in?

      render plain: 'index'
    end

    def new
      render plain: 'new'
    end

    def show
      render plain: 'show'
    end

    def edit
      render plain: 'edit'
    end

    def destroy
      render plain: 'authorized'
    end

    def set_title
      @title = params[:title]
    end
  end

  describe '#page_title' do
    it 'adds admin to the title in admin routes' 


    it 'appends the set title' 


    it 'has a default title' 

  end

  describe '#current_user' do
    let(:user) { User.create(username: 'example', password: 'x' * 30) }

    it 'loads from session' 


    it 'doesn’t break with no session' 

  end

  describe '#signed_in?' do
    let(:user) { User.create(username: 'example', password: 'x' * 30) }

    it 'is true with a user' 


    it 'is false with no user' 

  end

  describe '#authorize' do
    let(:user) { User.create(username: 'example', password: 'x' * 30) }

    it 'renders with a user' 


    it 'is false with no user' 

  end

  describe '#listing?' do
    it 'is true on index' 

  end

  describe '#showing?' do
    it 'is true on show' 

  end

  describe '#editing?' do
    it 'is true on edit' 

  end

  describe '#creating?' do
    it 'is true on new' 

  end

  describe '#check_for_redirection' do
    it 'redirects temporarily when present' 


    it 'redirects permanently when present' 

  end

  describe '#strip_file_extension' do
    it 'strips .html' 

  end

  describe '#render_markdown' do
    subject { controller.render_markdown('text').strip }

    it { is_expected.to eq('<p>text</p>') }
  end

  describe '#render_content' do
    subject { post.content_rendered.strip }

    let(:post) { Page.new(content: 'text', content_format: 'markdown') }

    it { is_expected.to eq('<p>text</p>') }
  end

  # describe '#current_resource_name' do
  #   # TODO: migrate this spec from admin_helper_spec to application_controller_spec
  #   before { expect(helper.request).to receive(:path) { 'admin/things/id' } }
  #
  #   subject { helper.current_resource_name }
  #
  #   it { is_expected.to eq('Thing') }
  # end
end

