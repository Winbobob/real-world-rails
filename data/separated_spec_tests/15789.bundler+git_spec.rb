# frozen_string_literal: true

RSpec.describe "bundle lock with git gems" do
  before :each do
    build_git "foo"

    install_gemfile <<-G
      gem 'foo', :git => "#{lib_path("foo-1.0")}"
    G
  end

  it "doesn't break right after running lock" 


  it "locks a git source to the current ref" 


  it "provides correct #full_gem_path" 

end

