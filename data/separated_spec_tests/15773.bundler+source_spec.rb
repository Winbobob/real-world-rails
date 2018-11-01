# frozen_string_literal: true

RSpec.describe "bundler source plugin" do
  describe "plugins dsl eval for #source with :type option" do
    before do
      update_repo2 do
        build_plugin "bundler-source-psource" do |s|
          s.write "plugins.rb", <<-RUBY
              class OPSource < Bundler::Plugin::API
                source "psource"
              end
          RUBY
        end
      end
    end

    it "installs bundler-source-* gem when no handler for source is present" 


    it "enables the plugin to require a lib path" 


    context "with an explicit handler" do
      before do
        update_repo2 do
          build_plugin "another-psource" do |s|
            s.write "plugins.rb", <<-RUBY
                class Cheater < Bundler::Plugin::API
                  source "psource"
                end
            RUBY
          end
        end
      end

      context "explicit presence in gemfile" do
        before do
          install_gemfile <<-G
            source "file://#{gem_repo2}"

            plugin "another-psource"

            source "file://#{lib_path("gitp")}", :type => :psource do
            end
          G
        end

        it "completes successfully" 


        it "installs the explicit one" 


        it "doesn't install the default one" 

      end

      context "explicit default source" do
        before do
          install_gemfile <<-G
            source "file://#{gem_repo2}"

            plugin "bundler-source-psource"

            source "file://#{lib_path("gitp")}", :type => :psource do
            end
          G
        end

        it "completes successfully" 


        it "installs the default one" 

      end
    end
  end
end

