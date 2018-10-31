# frozen_string_literal: true

RSpec.describe "bundler/inline#gemfile" do
  def script(code, options = {})
    requires = ["bundler/inline"]
    requires.unshift File.expand_path("../../support/artifice/" + options.delete(:artifice) + ".rb", __FILE__) if options.key?(:artifice)
    requires = requires.map {|r| "require '#{r}'" }.join("\n")
    @out = ruby("#{requires}\n\n" + code, options)
  end

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
  end

  it "requires the gems" 


  it "lets me use my own ui object" 


  it "raises an exception if passed unknown arguments" 


  it "does not mutate the option argument" 


  it "installs quietly if necessary when the install option is not set" 


  it "installs quietly from git if necessary when the install option is not set" 


  it "allows calling gemfile twice" 


  it "installs inline gems when a Gemfile.lock is present" 


  it "installs inline gems when BUNDLE_GEMFILE is set to an empty string" 


  it "installs inline gems when BUNDLE_BIN is set" 

end

