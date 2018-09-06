# frozen_string_literal: true

RSpec.describe "bundle init" do
  it "generates a Gemfile", :bundler => "< 2" 


  it "generates a gems.rb", :bundler => "2" 


  context "when a Gemfile already exists", :bundler => "< 2" do
    before do
      create_file "Gemfile", <<-G
        gem "rails"
      G
    end

    it "does not change existing Gemfiles" 


    it "notifies the user that an existing Gemfile already exists" 

  end

  context "when gems.rb already exists", :bundler => ">= 2" do
    before do
      create_file("gems.rb", <<-G)
        gem "rails"
      G
    end

    it "does not change existing Gemfiles" 


    it "notifies the user that an existing gems.rb already exists" 

  end

  context "when a Gemfile exists in a parent directory", :bundler => "< 2" do
    let(:subdir) { "child_dir" }

    it "lets users generate a Gemfile in a child directory" 

  end

  context "when the dir is not writable by the current user" do
    let(:subdir) { "child_dir" }

    it "notifies the user that it can not write to it" 

  end

  context "when a gems.rb file exists in a parent directory", :bundler => ">= 2" do
    let(:subdir) { "child_dir" }

    it "lets users generate a Gemfile in a child directory" 

  end

  context "given --gemspec option", :bundler => "< 2" do
    let(:spec_file) { tmp.join("test.gemspec") }

    it "should generate from an existing gemspec" 


    context "when gemspec file is invalid" do
      it "notifies the user that specification is invalid" 

    end
  end

  context "when init_gems_rb setting is enabled" do
    before { bundle "config init_gems_rb true" }

    context "given --gemspec option", :bundler => "< 2" do
      let(:spec_file) { tmp.join("test.gemspec") }

      before do
        File.open(spec_file, "w") do |file|
          file << <<-S
            Gem::Specification.new do |s|
            s.name = 'test'
            s.add_dependency 'rack', '= 1.0.1'
            s.add_development_dependency 'rspec', '1.2'
            end
          S
        end
      end

      it "should generate from an existing gemspec" 


      it "prints message to user" 

    end
  end
end

