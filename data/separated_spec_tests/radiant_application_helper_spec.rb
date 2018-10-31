describe Radiant::ApplicationHelper do
  
  before :each do
    allow(helper).to receive(:request).and_return(ActionDispatch::TestRequest.new)
  end

  it "should have the Radiant::Config" 


  it "should use the default title if not configured" 


  it "should use the stored title if configured" 


  it "should use the default subtitle if not configured" 


  it "should use the stored title if configured" 


  it "should not be logged in before authentication" 


  it "should be logged in when authenticated" 


  it "should create a button for a new model" 


  it "should create a button for an existing model" 


  it "should create a button with custom options" 


  it "should create a button with a custom label" 


  it "should create a save and continue button" 


  it "should determine whether a given url matches the current url" 


  it "should clean a url" 


  it "should render an admin navigation link" 


  it "should render an admin link without translation" 


  it "should render an admin section link with translation" 


  it "should render an admin section link without translation" 


  it "should determine whether the current user is an admin" 


  it "should determine whether the current user is a designer" 


  it "should render a Javascript snippet that focuses a given field" 


  it "should render an updated timestamp for a model" 


  it "should render a timezone-adjusted timestamp" 


  it "should determine whether a meta area item should be visible" 


  it "should not have meta errors" 


  it "should provide a meta_label of 'Less' when meta_errors? is true" 


  it "should provide a meta_label of 'More' when meta_errors? is false" 


  it "should render a Javascript snippet to toggle the meta area" 


  it "should render an image tag with a default file extension" 


  it "should render an image submit tag with a default file extension" 


  it "should provide the admin object" 


  it "should return filter options for select" 


  it "should include the regions helper" 


  describe 'stylesheet_and_javascript_overrides' do
    before do
      @override_css_path = "#{Rails.root}/public/stylesheets/admin/overrides.css"
      @override_sass_path = "#{Rails.root}/public/stylesheets/sass/admin/overrides.sass"
      @override_js_path = "#{Rails.root}/public/javascripts/admin/overrides.js"
      allow(File).to receive(:exist?)
    end
    it "should render a link to the overrides.css file when it exists" 

    it "should render a link to the overrides.css file when the overrides.sass file exists" 

    it "should not render a link to the overrides.css file when it does not exist" 

    it "should not render a link to the overrides.css file when the overrides.css and overrides.sass file does not exist" 

    it "should render a link to the overrides.js file when it exists" 

    it "should not render a link to the overrides.js file when it does not exist" 

  end

  # describe "pagination" do
  #   before do
  #     @collection = WillPaginate::Collection.new(1, 10, 100)
  #     request = double("request")
  #     helper.stub(:request).and_return(request)
  #     helper.stub(:will_paginate_options).and_return({})
  #     helper.stub(:will_paginate).and_return("pagination of some kind")
  #     helper.stub(:link_to).and_return("link")
  #   end
  #
  #   it "should render pagination controls for a supplied list" do
  #     helper.pagination_for(@collection).should have_tag('div.pagination').with_tag('span.current', text: '1')
  #   end
  #
  #   it "should include a depagination link by default" do
  #     helper.pagination_for(@collection).should have_tag('div.depaginate')
  #   end
  #
  #   it "should omit the depagination link when :depaginate is false" do
  #     helper.pagination_for(@collection, depaginate: false).should_not have_tag('div.depaginate')
  #   end
  #
  #   it "should omit the depagination link when the :max_list_length is exceeded" do
  #     helper.pagination_for(@collection, depaginate: true, max_list_length: 5).should_not have_tag('div.depaginate')
  #   end
  #
  #   it "should use the max_list_length config item when no other value is specified" do
  #     Radiant::Config['pagination.max_list_length'] = 50
  #     helper.pagination_for(@collection).should_not have_tag('div.depaginate')
  #   end
  #
  #   it "should disregard list length when max_list_length is false" do
  #     Radiant::Config['pagination.max_list_length'] = 50
  #     helper.pagination_for(@collection, max_list_length: false).should_not have_tag('div.depaginate')
  #   end
  #
  # end
end

