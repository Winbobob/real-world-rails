require 'ostruct'

describe Radiant::Taggable, "when included in a class or module" do

  class TaggedClass
    include Radiant::Taggable
  end

  module TaggedModule
    include Radiant::Taggable
  end

  it "should add tag definition methods to the class" 


  it "should turn tag definitions into methods" 


  it "should store tag descriptions filtered without Textile, so that translations can be applied" 


  it "should associate a tag description with the tag definition that follows it" 


  # This has been moved to the admin/references_helper
  #
  # it "should normalize leading whitespace in a tag description" do
  #   Radiant::Taggable::Util.should_receive(:strip_leading_whitespace).twice.with("   Blah blah\n blah blah").and_return("blah")
  #   [TaggedClass, TaggedModule].each do |c|
  #     c.desc "   Blah blah\n blah blah"
  #   end
  # end
end

describe Radiant::Taggable, "when included in a module with defined tags" do

  module MyTags
    include Radiant::Taggable

    desc %{This tag renders the text "just a test".}
    tag "test" do
      "just a test"
    end

    desc %{This tag implements "Hello, world!".}
    tag "hello" do |tag|
      "Hello, #{ tag.attr['name'] || 'world' }!"
    end

    tag "page_index_path" do |tag|
      admin_pages_path
    end
  end

  class TestObject
    include Radiant::Taggable

    desc %{Yet another test}
    tag "test" do
      "My new test"
    end

    include MyTags
  end

  before :each do
    @object = TestObject.new
    @tag_binding = OpenStruct.new('attr' => {"name" => "John"})
  end

  it "should have a collection of defined tags" 


  it "should add tags to an included class" 


  it "should merge tag descriptions with an included class" 


  it "should render a defined tag on an instance of an included class" 


  it "should render a defined tag on an instance of an included class with a given tag binding" 


  it "should render a url helper called in a tag definition" 


end

describe Radiant::Taggable, "when included in a module with defined tags which is included in the Page model" do
  #dataset :users_and_pages, :file_not_found

  module CustomTags
    include Radiant::Taggable

    tag "param_value" do |tag|
      params[:sample_param]
    end
  end

  Page.send :include, CustomTags

  it 'should render a param value used in a tag' 


  private
    def page(symbol = nil)
      if symbol.nil?
        @page ||= pages(:assorted)
      else
        @page = pages(symbol)
      end
    end
end

describe Radiant::Taggable, "when included in a module with deprecated tags" do

  class OldTestObject
    include Radiant::Taggable

    desc %{This is an exciting new tag}
    tag "new_hotness" do "Dreadful film."; end

    desc %{This tag is deprecated but still renders the text "just an old test".}
    deprecated_tag "old_testy" do "just an old test"; end

    desc %{This tag deprecated in favour of the tag 'new_hotness'.}
    deprecated_tag "old_busted", substitute: 'new_hotness', version: '9.0'
  end

  before :each do
    @object = OldTestObject.new
    @tag_binding = double('tag_binding')
    allow(@tag_binding).to receive(:attr).and_return({name: 'testy'})
    allow(@tag_binding).to receive(:block).and_return(nil)
  end

  it "should have a collection of defined tags" 


  ::ActiveSupport::Deprecation.silence do
    describe 'rendering a deprecated tag with no substitute' do
      it "should warn and render" 

    end

    describe 'rendering a deprecated tag with substitution' do
      it "should warn and substitute" 

    end

    describe 'rendering a deprecated tag with an expiry deadline' do
      it "should warn with deadline" 

    end
  end
end

describe Radiant::Taggable::Util do
  it "should normalize leading whitespace" 

end

