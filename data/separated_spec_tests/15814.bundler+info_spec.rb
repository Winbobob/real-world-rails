# frozen_string_literal: true

RSpec.describe "bundle info" do
  context "info from specific gem in gemfile" do
    before do
      install_gemfile <<-G
        source "file://#{gem_repo1}"
        gem "rails"
      G
    end

    it "prints information about the current gem" 


    context "given a gem that is not installed" do
      it "prints missing gem error" 

    end

    context "given a default gem shippped in ruby" do
      it "prints information about the default gem", :if => (RUBY_VERSION >= "2.0") do
        bundle "info rdoc"
        expect(out).to include("* rdoc")
        expect(out).to include("Default Gem: yes")
      end
    end

    context "when gem does not have homepage" do
      before do
        build_repo1 do
          build_gem "rails", "2.3.2" do |s|
            s.executables = "rails"
            s.summary = "Just another test gem"
          end
        end
      end

      it "excludes the homepage field from the output" 

    end

    context "given --path option" do
      it "prints the path to the gem" 

    end
  end
end

