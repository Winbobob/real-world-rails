require "spec_helper"

describe "Root path", type: :request do
  it "routes to blog_homepage#show when site homepage is a blog" 


  it "routes to pages#show when site homepage is page" 

end

describe "Post path", type: :request do
  it "uses /posts/post-slug when site#post_slug_style is default" 


  it "uses /year/month/day/post-slug when site#post_slug_style is day_and_name" 


  it "uses /year/month/post-slug when site#post_slug_style is month_and_name" 


  it "uses /post-id when site#post_slug_style is post_id" 

end

