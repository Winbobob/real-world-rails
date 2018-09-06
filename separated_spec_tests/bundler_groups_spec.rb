# frozen_string_literal: true

RSpec.describe "bundle install with groups" do
  describe "installing with no options" do
    before :each do
      install_gemfile <<-G
        source "file://#{gem_repo1}"
        gem "rack"
        group :emo do
          gem "activesupport", "2.3.5"
        end
        gem "thin", :groups => [:emo]
      G
    end

    it "installs gems in the default group" 


    it "installs gems in a group block into that group" 


    it "installs gems with inline :groups into those groups" 


    it "sets up everything if Bundler.setup is used with no groups" 


    it "removes old groups when new groups are set up" 


    it "sets up old groups when they have previously been removed" 

  end

  describe "installing --without" do
    describe "with gems assigned to a single group" do
      before :each do
        gemfile <<-G
          source "file://#{gem_repo1}"
          gem "rack"
          group :emo do
            gem "activesupport", "2.3.5"
          end
          group :debugging, :optional => true do
            gem "thin"
          end
        G
      end

      it "installs gems in the default group" 


      it "does not install gems from the excluded group" 


      it "does not install gems from the previously excluded group" 


      it "does not say it installed gems from the excluded group" 


      it "allows Bundler.setup for specific groups" 


      it "does not effect the resolve" 


      it "still works on a different machine and excludes gems" 


      it "still works when BUNDLE_WITHOUT is set" 


      it "clears without when passed an empty list" 


      it "doesn't clear without when nothing is passed" 


      it "does not install gems from the optional group" 


      it "does install gems from the optional group when requested" 


      it "does install gems from the previously requested group" 


      it "does install gems from the optional groups requested with BUNDLE_WITH" 


      it "clears with when passed an empty list" 


      it "does remove groups from without when passed at --with", :bundler => "< 2" 


      it "does remove groups from with when passed at --without", :bundler => "< 2" 


      it "errors out when passing a group to with and without via CLI flags", :bundler => "< 2" 


      it "allows the BUNDLE_WITH setting to override BUNDLE_WITHOUT" 


      it "can add and remove a group at the same time" 


      it "does have no effect when listing a not optional group in with" 


      it "does have no effect when listing an optional group in without" 

    end

    describe "with gems assigned to multiple groups" do
      before :each do
        gemfile <<-G
          source "file://#{gem_repo1}"
          gem "rack"
          group :emo, :lolercoaster do
            gem "activesupport", "2.3.5"
          end
        G
      end

      it "installs gems in the default group" 


      it "installs the gem if any of its groups are installed" 


      describe "with a gem defined multiple times in different groups" do
        before :each do
          gemfile <<-G
            source "file://#{gem_repo1}"
            gem "rack"

            group :emo do
              gem "activesupport", "2.3.5"
            end

            group :lolercoaster do
              gem "activesupport", "2.3.5"
            end
          G
        end

        it "installs the gem w/ option --without emo" 


        it "installs the gem w/ option --without lolercoaster" 


        it "does not install the gem w/ option --without emo lolercoaster" 


        it "does not install the gem w/ option --without 'emo lolercoaster'" 

      end
    end

    describe "nesting groups" do
      before :each do
        gemfile <<-G
          source "file://#{gem_repo1}"
          gem "rack"
          group :emo do
            group :lolercoaster do
              gem "activesupport", "2.3.5"
            end
          end
        G
      end

      it "installs gems in the default group" 


      it "installs the gem if any of its groups are installed" 

    end
  end

  describe "when loading only the default group" do
    it "should not load all groups" 

  end

  describe "when locked and installed with --without" do
    before(:each) do
      build_repo2
      system_gems "rack-0.9.1" do
        install_gemfile <<-G, forgotten_command_line_options(:without => "rack")
          source "file://#{gem_repo2}"
          gem "rack"

          group :rack do
            gem "rack_middleware"
          end
        G
      end
    end

    it "uses the correct versions even if --without was used on the original" 


    it "does not hit the remote a second time" 

  end
end

