require File.dirname(__FILE__) + '/../../spec_helper'

describe Radiant::SiteController do
  routes { Radiant::Engine.routes }
  #dataset :pages

  it "should find and render home page" 


  it "should find a page one level deep" 


  it "should find a page two levels deep" 


  it "should show page not found" 


  it "should redirect to admin if missing root" 


  it "should pass pagination parameters to the page" 


  it "should parse pages with Radius" 


  it "should render 404 if page is not published status" 


  it "should display draft and hidden pages on default dev site" 


  it "should display draft and hidden pages on dev site in config" 


  ['draft','hidden'].each do |type|
    it "it should display #{type} pages on default dev site when dev.host specified" 

  end

  it "should not require login" 


  describe "scheduling" do
    before do
      @sched_page = Page.find_by_title('d')
    end
    it "should not display scheduled pages on live site" 


    it "should update status of scheduled pages on home page" 


  end

  describe "caching" do
    it "should add a default Cache-Control header with public and max-age of 5 minutes" 


    it "should pass along the etag set by the page" 


    %w{put post delete}.each do |method|
      it "should prevent upstream caching on #{method.upcase} requests" 

    end

    it "should return a not-modified response when the sent etag matches" 


    it "should prevent upstream caching when the page should not be cached" 


    it "should prevent upstream caching in dev mode" 


    it "should set the default cache timeout (max-age) to a value assigned by the user" 

  end

  describe "pagination" do
    it "should pass through pagination parameters to the page" 

  end
end

