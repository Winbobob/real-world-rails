require 'rails_helper'

describe BlogPostsController, type: :controller do
  let(:announcement) { create(:announcement) }

  describe '#index' do
    let(:blog_posts) { create_list(:blog_post, 3) }
    let(:draft_post) { create(:blog_post, :draft) }

    it 'should return all non-draft blog posts' 


    it 'should never return a draft' 


    it 'should return the current webinar announcement' 

  end

  describe '#show' do
    let(:blog_post) { create(:blog_post) }
    let(:three_most_recent_posts) { create_list(:blog_post, 3) }

    it 'should return a 404 if no such post found' 


    it 'should return the called blog post' 


    it 'should increment the blog post read count' 


    it 'should return the blog post author' 


    it 'should return the three most recent posts' 


    it 'should return the title' 


    it 'should return the description' 


    it 'should return the title as description if no subtitle exists' 

  end

  describe '#show_topic' do
    let(:topic) { BlogPost::TOPICS.sample }
    let(:blog_posts) { create_list(:blog_post, 3, topic: topic) }
    let(:draft_post) { create(:blog_post, :draft, topic: topic) }

    it 'should return a 404 if topic slug is not found' 


    it 'should never return a draft' 


    it 'should return all the posts associated with this topic' 


    it 'should return a title' 

  end

  describe '#search' do
    let(:blog_posts) { create_list(:blog_post, 3) }

    it 'should redirect back if no query is present' 


    it 'should return the proper title' 


    xit 'should return posts that match the query' do
      # TODO: figure out how to test this effectively and consistently
      blog_posts
      get :search, query: BlogPost.second.tsv.split(' ').first.gsub("'",'').gsub(/:.*$/,'')
      expect(assigns(:blog_posts)).to eq([{
        'slug' => BlogPost.second.slug,
        'preview_card_content' => BlogPost.second.preview_card_content
      }])
    end
  end
end

