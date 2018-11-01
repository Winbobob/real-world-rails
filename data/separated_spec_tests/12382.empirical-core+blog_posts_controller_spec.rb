require 'rails_helper'

describe Cms::BlogPostsController, type: :controller do
  it { should use_before_action :set_blog_post }
  it { should use_before_action :authors }
  it { should use_before_action :topics }

  let(:user) { create(:staff) }

  before do
    allow(controller).to receive(:current_user) { user }
  end

  describe '#index' do
    let!(:post) { create(:blog_post) }

    before do
      allow_any_instance_of(BlogPost).to receive(:attributes) { {} }
    end

    it 'should set the blog posts name and id and topics' 

  end

  describe '#create' do
    let(:bpost) { build(:blog_post) }

    it 'should create the blog post with the params given' 

  end

  describe '#update' do
    let!(:bpost) { create(:blog_post) }

    it 'should update the given blog post' 

  end

  describe '#destroy' do
    let!(:bpost) { create(:blog_post) }

    it 'should destroy the given blog post' 

  end

  describe '#unpublish' do
    let!(:bpost) { create(:blog_post) }

    it 'should make draft true in the given blog post' 

  end

  describe '#update_order_numbers' do
    let!(:bpost) { create(:blog_post) }
    let!(:bpost1) { create(:blog_post) }

    it 'should update the order number for all given blog posts' 

  end
end

