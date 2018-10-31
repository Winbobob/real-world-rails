# frozen_string_literal: true

RSpec.describe "require 'bundler/gem_tasks'" do
  before :each do
    bundled_app("foo.gemspec").open("w") do |f|
      f.write <<-GEMSPEC
        Gem::Specification.new do |s|
          s.name = "foo"
        end
      GEMSPEC
    end
    bundled_app("Rakefile").open("w") do |f|
      f.write <<-RAKEFILE
        $:.unshift("#{bundler_path}")
        require "bundler/gem_tasks"
      RAKEFILE
    end
  end

  it "includes the relevant tasks" 


  it "adds 'pkg' to rake/clean's CLOBBER" 

end

