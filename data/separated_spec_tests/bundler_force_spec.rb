# frozen_string_literal: true

RSpec.describe "bundle install" do
  %w[force redownload].each do |flag|
    describe_opts = {}
    describe_opts[:bundler] = "< 2" if flag == "force"
    describe "with --#{flag}", describe_opts do
      before :each do
        gemfile <<-G
          source "file://#{gem_repo1}"
          gem "rack"
        G
      end

      it "re-installs installed gems" 


      it "works on first bundle install" 


      context "with a git gem" do
        let!(:ref) { build_git("foo", "1.0").ref_for("HEAD", 11) }

        before do
          gemfile <<-G
            gem "foo", :git => "#{lib_path("foo-1.0")}"
          G
        end

        it "re-installs installed gems" 


        it "works on first bundle install" 

      end
    end
  end
end

