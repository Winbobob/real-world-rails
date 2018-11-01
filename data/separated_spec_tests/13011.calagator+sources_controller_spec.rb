require 'spec_helper'

module Calagator

describe SourcesController, :type => :controller do
  routes { Calagator::Engine.routes }

  describe "using import logic" do
    before(:each) do
      @venue = mock_model(Venue,
        :source => nil,
        :source= => true,
        :save! => true,
        :duplicate_of_id =>nil)

      @event = mock_model(Event,
        :title => "Super Event",
        :source= => true,
        :save! => true,
        :venue => @venue,
        :start_time => Time.now+1.week,
        :end_time => nil,
        :old? => false,
        :duplicate_of_id => nil)

      @source = Source.new(:url => "http://my.url/")
      allow(@source).to receive(:save!).and_return(true)
      allow(@source).to receive(:to_events).and_return([@event])

      allow(Source).to receive(:new).and_return(@source)
      allow(Source).to receive(:find_or_create_by).with(url: "http://my.url/").and_return(@source)
    end

    it "should provide a way to create new sources" 


    describe "with render views" do
      render_views

      it "should save the source object when creating events" 


      it "should limit the number of created events to list in the flash" 

    end

    it "should assign newly-created events to the source" 


    it "should assign newly created venues to the source" 



    describe "is given problematic sources" do
      before do
        @source = stub_model(Source)
        expect(Source).to receive(:find_or_create_by).with(url: "http://invalid.host").and_return(@source)
      end

      def assert_import_raises(exception)
        expect(@source).to receive(:create_events!).and_raise(exception)
        post :import, :source => {:url => "http://invalid.host"}
      end

      it "should fail when host responds with no events" 


      it "should fail when host responds with a 404" 


      it "should fail when host responds with an error" 


      it "should fail when host is not responding" 


      it "should fail when host is not found" 


      it "should fail when host requires authentication" 


      it "should fail when host throws something strange" 

    end
  end


  describe "handling GET /sources" do

    before(:each) do
      @source = mock_model(Source)
      allow(Source).to receive(:listing).and_return([@source])
    end

    def do_get
      get :index
    end

    it "should be successful" 


    it "should render index template" 


    it "should find sources" 


    it "should assign the found sources for the view" 

  end

  describe "handling GET /sources.xml" do

    before(:each) do
      @sources = double("Array of Sources", :to_xml => "XML")
      allow(Source).to receive(:find).and_return(@sources)
    end

    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :index
    end

    it "should be successful" 


    it "should find all sources" 


    it "should render the found sources as xml" 

  end

  describe "show" do
    it "should redirect when asked for unknown source" 

  end

  describe "handling GET /sources/1" do

    before(:each) do
      @source = mock_model(Source)
      allow(Source).to receive(:find).and_return(@source)
    end

    def do_get
      get :show, :id => "1"
    end

    it "should be successful" 


    it "should render show template" 


    it "should find the source requested" 


    it "should assign the found source for the view" 

  end

  describe "handling GET /sources/1.xml" do

    before(:each) do
      @source = mock_model(Source, :to_xml => "XML")
      allow(Source).to receive(:find).and_return(@source)
    end

    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :show, :id => "1"
    end

    it "should be successful" 


    it "should find the source requested" 


    it "should render the found source as xml" 

  end

  describe "handling GET /sources/new" do

    before(:each) do
      @source = mock_model(Source)
      allow(Source).to receive(:new).and_return(@source)
    end

    def do_get
      get :new
    end

    it "should be successful" 


    it "should render new template" 


    it "should create an new source" 


    it "should not save the new source" 


    it "should assign the new source for the view" 

  end

  describe "handling GET /sources/1/edit" do

    before(:each) do
      @source = mock_model(Source)
      allow(Source).to receive(:find).and_return(@source)
    end

    def do_get
      get :edit, :id => "1"
    end

    it "should be successful" 


    it "should render edit template" 


    it "should find the source requested" 


    it "should assign the found Source for the view" 

  end

  describe "handling POST /sources" do

    before(:each) do
      @source = mock_model(Source, :to_param => "1")
      allow(Source).to receive(:new).and_return(@source)
    end

    describe "with successful save" do

      def do_post
        expect(@source).to receive(:update_attributes).and_return(true)
        post :create, :source => {}
      end

      it "should create a new source" 


      it "should redirect to the new source" 


    end

    describe "with failed save" do

      def do_post
        expect(@source).to receive(:update_attributes).and_return(false)
        allow(@source).to receive_messages(new_record?: true)
        post :create, :source => {}
      end

      it "should re-render 'new'" 


    end
  end

  describe "handling PUT /sources/1" do

    before(:each) do
      @source = mock_model(Source, :to_param => "1")
      allow(Source).to receive(:find).and_return(@source)
    end

    describe "with successful update" do

      def do_put
        expect(@source).to receive(:update_attributes).and_return(true)
        put :update, :id => "1"
      end

      it "should find the source requested" 


      it "should update the found source" 


      it "should assign the found source for the view" 


      it "should redirect to the source" 


    end

    describe "with failed update" do

      def do_put
        expect(@source).to receive(:update_attributes).and_return(false)
        put :update, :id => "1"
      end

      it "should re-render 'edit'" 


    end
  end

  describe "handling DELETE /sources/1" do

    before(:each) do
      @source = mock_model(Source, :destroy => true)
      allow(Source).to receive(:find).and_return(@source)
    end

    def do_delete
      delete :destroy, :id => "1"
    end

    it "should find the source requested" 


    it "should call destroy on the found source" 


    it "should redirect to the sources list" 

  end
end

end

