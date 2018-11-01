require_relative '_lib'

describe RestClient::Resource do
  before do
    @resource = RestClient::Resource.new('http://some/resource', :user => 'jane', :password => 'mypass', :headers => {'X-Something' => '1'})
  end

  context "Resource delegation" do
    it "GET" 


    it "HEAD" 


    it "POST" 


    it "PUT" 


    it "PATCH" 


    it "DELETE" 


    it "overrides resource headers" 

  end

  it "can instantiate with no user/password" 


  it "is backwards compatible with previous constructor" 


  it "concatenates urls, inserting a slash when it needs one" 


  it "concatenates urls, using no slash if the first url ends with a slash" 


  it "concatenates urls, using no slash if the second url starts with a slash" 


  it "concatenates even non-string urls, :posts + 1 => 'posts/1'" 


  it "offers subresources via []" 


  it "transports options to subresources" 


  it "passes a given block to subresources" 


  it "the block should be overrideable" 


  # Test fails on jruby 9.1.[0-5].* due to
  # https://github.com/jruby/jruby/issues/4217
  it "the block should be overrideable in ruby 1.9 syntax",
      :unless => (RUBY_ENGINE == 'jruby' && JRUBY_VERSION =~ /\A9\.1\.[0-5]\./) \
  do
    block1 = proc {|r| r}
    block2 = ->(r) {}

    parent = RestClient::Resource.new('http://example.com', &block1)
    expect(parent['posts', &block2].block).to eq block2
    expect(parent['posts', &block2].block).not_to eq block1
  end

  it "prints its url with to_s" 


  describe 'block' do
    it 'can use block when creating the resource' 


    it 'can use block when executing the resource' 


    it 'execution block override resource block' 


  end
end

