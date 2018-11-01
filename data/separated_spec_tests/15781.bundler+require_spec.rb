# frozen_string_literal: true

RSpec.describe "Bundler.require" do
  before :each do
    build_lib "one", "1.0.0" do |s|
      s.write "lib/baz.rb", "puts 'baz'"
      s.write "lib/qux.rb", "puts 'qux'"
    end

    build_lib "two", "1.0.0" do |s|
      s.write "lib/two.rb", "puts 'two'"
      s.add_dependency "three", "= 1.0.0"
    end

    build_lib "three", "1.0.0" do |s|
      s.write "lib/three.rb", "puts 'three'"
      s.add_dependency "seven", "= 1.0.0"
    end

    build_lib "four", "1.0.0" do |s|
      s.write "lib/four.rb", "puts 'four'"
    end

    build_lib "five", "1.0.0", :no_default => true do |s|
      s.write "lib/mofive.rb", "puts 'five'"
    end

    build_lib "six", "1.0.0" do |s|
      s.write "lib/six.rb", "puts 'six'"
    end

    build_lib "seven", "1.0.0" do |s|
      s.write "lib/seven.rb", "puts 'seven'"
    end

    build_lib "eight", "1.0.0" do |s|
      s.write "lib/eight.rb", "puts 'eight'"
    end

    build_lib "nine", "1.0.0" do |s|
      s.write "lib/nine.rb", "puts 'nine'"
    end

    build_lib "ten", "1.0.0" do |s|
      s.write "lib/ten.rb", "puts 'ten'"
    end

    gemfile <<-G
      path "#{lib_path}" do
        gem "one", :group => :bar, :require => %w[baz qux]
        gem "two"
        gem "three", :group => :not
        gem "four", :require => false
        gem "five"
        gem "six", :group => "string"
        gem "seven", :group => :not
        gem "eight", :require => true, :group => :require_true
        env "BUNDLER_TEST" => "nine" do
          gem "nine", :require => true
        end
        gem "ten", :install_if => lambda { ENV["BUNDLER_TEST"] == "ten" }
      end
    G
  end

  it "requires the gems" 


  it "allows requiring gems with non standard names explicitly" 


  it "allows requiring gems which are scoped by env" 


  it "allows requiring gems which are scoped by install_if" 


  it "raises an exception if a require is specified but the file does not exist" 


  it "displays a helpful message if the required gem throws an error" 


  it "doesn't swallow the error when the library has an unrelated error" 


  describe "with namespaced gems" do
    before :each do
      build_lib "jquery-rails", "1.0.0" do |s|
        s.write "lib/jquery/rails.rb", "puts 'jquery/rails'"
      end
      lib_path("jquery-rails-1.0.0/lib/jquery-rails.rb").rmtree
    end

    it "requires gem names that are namespaced" 


    it "silently passes if the require fails" 


    it "does not mangle explicitly given requires" 


    it "handles the case where regex fails" 


    it "doesn't swallow the error when the library has an unrelated error" 

  end

  describe "using bundle exec" do
    it "requires the locked gems" 

  end

  describe "order" do
    before(:each) do
      build_lib "one", "1.0.0" do |s|
        s.write "lib/one.rb", <<-ONE
          if defined?(Two)
            Two.two
          else
            puts "two_not_loaded"
          end
          puts 'one'
        ONE
      end

      build_lib "two", "1.0.0" do |s|
        s.write "lib/two.rb", <<-TWO
          module Two
            def self.two
              puts 'module_two'
            end
          end
          puts 'two'
        TWO
      end
    end

    it "works when the gems are in the Gemfile in the correct order" 


    describe "a gem with different requires for different envs" do
      before(:each) do
        build_gem "multi_gem", :to_bundle => true do |s|
          s.write "lib/one.rb", "puts 'ONE'"
          s.write "lib/two.rb", "puts 'TWO'"
        end

        install_gemfile <<-G
          gem "multi_gem", :require => "one", :group => :one
          gem "multi_gem", :require => "two", :group => :two
        G
      end

      it "requires both with Bundler.require(both)" 


      it "requires one with Bundler.require(:one)" 


      it "requires :two with Bundler.require(:two)" 

    end

    it "fails when the gems are in the Gemfile in the wrong order" 


    describe "with busted gems" do
      it "should be busted" 

    end
  end

  it "does not load rubygems gemspecs that are used", :rubygems => ">= 2.5.2" 


  it "does not load git gemspecs that are used", :rubygems => ">= 2.5.2" 

end

RSpec.describe "Bundler.require with platform specific dependencies" do
  it "does not require the gems that are pinned to other platforms" 


  it "requires gems pinned to multiple platforms, including the current one" 

end

