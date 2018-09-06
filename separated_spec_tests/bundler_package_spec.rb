# frozen_string_literal: true

RSpec.describe "bundle package" do
  context "with --gemfile" do
    it "finds the gemfile" 

  end

  context "with --all" do
    context "without a gemspec" do
      it "caches all dependencies except bundler itself" 

    end

    context "with a gemspec" do
      context "that has the same name as the gem" do
        before do
          File.open(bundled_app("mygem.gemspec"), "w") do |f|
            f.write <<-G
              Gem::Specification.new do |s|
                s.name = "mygem"
                s.version = "0.1.1"
                s.summary = ""
                s.authors = ["gem author"]
                s.add_development_dependency "nokogiri", "=1.4.2"
              end
            G
          end
        end

        it "caches all dependencies except bundler and the gemspec specified gem" 

      end

      context "that has a different name as the gem" do
        before do
          File.open(bundled_app("mygem_diffname.gemspec"), "w") do |f|
            f.write <<-G
              Gem::Specification.new do |s|
                s.name = "mygem"
                s.version = "0.1.1"
                s.summary = ""
                s.authors = ["gem author"]
                s.add_development_dependency "nokogiri", "=1.4.2"
              end
            G
          end
        end

        it "caches all dependencies except bundler and the gemspec specified gem" 

      end
    end

    context "with multiple gemspecs" do
      before do
        File.open(bundled_app("mygem.gemspec"), "w") do |f|
          f.write <<-G
            Gem::Specification.new do |s|
              s.name = "mygem"
              s.version = "0.1.1"
              s.summary = ""
              s.authors = ["gem author"]
              s.add_development_dependency "nokogiri", "=1.4.2"
            end
          G
        end
        File.open(bundled_app("mygem_client.gemspec"), "w") do |f|
          f.write <<-G
            Gem::Specification.new do |s|
              s.name = "mygem_test"
              s.version = "0.1.1"
              s.summary = ""
              s.authors = ["gem author"]
              s.add_development_dependency "weakling", "=0.0.3"
            end
          G
        end
      end

      it "caches all dependencies except bundler and the gemspec specified gems" 

    end
  end

  context "with --path", :bundler => "< 2" do
    it "sets root directory for gems" 

  end

  context "with --no-install" do
    it "puts the gems in vendor/cache but does not install them" 


    it "does not prevent installing gems with bundle install" 

  end

  context "with --all-platforms" do
    it "puts the gems in vendor/cache even for other rubies", :ruby => "2.1" 

  end

  context "with --frozen" do
    before do
      gemfile <<-G
        source "file://#{gem_repo1}"
        gem "rack"
      G
      bundle "install"
    end

    subject { bundle :package, forgotten_command_line_options(:frozen => true) }

    it "tries to install with frozen" 

  end
end

RSpec.describe "bundle install with gem sources" do
  describe "when cached and locked" do
    it "does not hit the remote at all" 


    it "does not hit the remote at all" 


    it "does not reinstall already-installed gems" 


    it "ignores cached gems for the wrong platform" 


    it "does not update the cache if --no-cache is passed" 

  end
end

