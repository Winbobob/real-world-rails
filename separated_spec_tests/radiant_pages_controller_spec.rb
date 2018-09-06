#encoding: utf-8

require File.dirname(__FILE__) + '/../../spec_helper'

describe Radiant::Admin::PagesController do
  routes { Radiant::Engine.routes }
  #dataset :users, :pages

  before :each do
    login_as :existing
  end

  it "should route children to the pages controller" 


  describe "show" do
    it "should redirect to the edit action" 


    it "should show json when format is json" 

  end

  describe "with invalid page id" do
    [:edit, :remove].each do |action|
      before do
        @parameters = {id: 999}
      end
      it "should redirect the #{action} action to the index action" 

      it "should say that the 'Page could not be found.' after the #{action} action" 

    end
    it 'should redirect the update action to the index action' 

    it "should say that the 'Page could not be found.' after the update action" 

    it 'should redirect the destroy action to the index action' 

    it "should say that the 'Page could not be found.' after the destroy action" 

  end

  describe "viewing the sitemap" do


    it "should render when the homepage is present" 


    it "should allow the index to render even with there are no pages" 


    it "should show the tree partially expanded by default" 


    it "should show the tree partially expanded even when the expanded_rows cookie is empty" 


    it "should show the tree partially expanded according to the expanded_rows cookie" 


    it "should show the tree with a mangled cookie" 


    it "should render the appropriate children when branch of the site map is expanded via AJAX" 

  end

  describe "permissions" do

    [:admin, :designer, :non_admin, :existing].each do |user|
      {
        post: :create,
        put: :update,
        delete: :destroy
      }.each do |method, action|
        it "should require login to access the #{action} action" 


        it "should allow access to #{user.to_s.humanize}s for the #{action} action" 

      end
    end

    [:index, :show, :new, :edit, :remove].each do |action|
      before :each do
        @parameters = lambda do
          case action
          when :index
            {}
          when :new
            {page_id: page_id(:home)}
          else
            {id: page_id(:home)}
          end
        end
      end

      it "should require login to access the #{action} action" 


      it "should allow access to admins for the #{action} action" 


      it "should allow access to designers for the #{action} action" 


      it "should allow non-designers and non-admins for the #{action} action" 

    end
  end

  describe '#preview' do

    let(:preview_page){ pages(:home, :with_parts) }
    let(:body_id){ preview_page.part('body').id }
    let(:preview_params){
      {'page' => {
        'title' => 'BOGUS',
        'id' => preview_page.id.to_s,
        'parts_attributes' => [{'content' => 'TEST', 'id' => body_id.to_s}] } }
    }
    it 'should render the page with changes' 


    describe 'new child' do
      it 'should not save any changes' 

    end
    # TODO: transactional fixtures must be turned off for this to be able to test the transactions properly
    # describe 'edit existing page' do
    #   it 'should not save any changes' do
    #     request.stub(:referer).and_return("/admin/pages/#{preview_page.id}/edit")
    #     original_date = preview_page.updated_at
    #     put :preview, preview_params
    #     non_updated_page = Page.find(preview_page.id)
    #     non_updated_page.title.should_not == 'BOGUS'
    #     non_updated_page.updated_at.to_i.should == original_date.to_i
    #   end
    # end
  end

  describe "prompting page removal" do


    # TODO: This should be in a view or integration spec
    it "should render the expanded descendants of the page being removed" 

  end

  describe '#new' do
    it "should initialize meta and buttons_partials in new action" 


    it "should set the parent_id from the parameters" 


    it "should set the @page variable" 


     it "should create a page based on the given param" 


     it "should gracefully handle bogus page params" 


     it "should instantiate a new page of the given class" 

  end

  describe '#update' do
    it 'should update the page updated_at on every update' 


    if RUBY_VERSION =~ /1\.9/
      it 'should convert form input to UTF-8' 

    end
  end

  it "should initialize meta and buttons_partials in edit action" 


  it "should clear the page cache when saved" 


  describe "@body_classes" do
    it "should return 'reversed' when the action_name is 'new'" 

    it "should return 'reversed' when the action_name is 'edit'" 

    it "should return 'reversed' when the action_name is 'create'" 

    it "should return 'reversed' when the action_name is 'update'" 

  end

  protected

    def assert_rendered_nodes_where(&block)
      wanted, unwanted = Page.all.partition(&block)
      wanted.each do |page|
        expect(response).to have_tag("tr[id=page_#{page.id}]")
      end
      unwanted.each do |page|
        expect(response).not_to have_tag("tr[id=page_#{page.id}]")
      end
    end

    def write_cookie(name, value)
      request.cookies[name] = value
    end
end

