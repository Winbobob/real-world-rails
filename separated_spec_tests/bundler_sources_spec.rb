# frozen_string_literal: true

RSpec.describe "bundle install with gems on multiple sources" do
  # repo1 is built automatically before all of the specs run
  # it contains rack-obama 1.0.0 and rack 0.9.1 & 1.0.0 amongst other gems

  context "without source affinity" do
    before do
      # Oh no! Someone evil is trying to hijack rack :(
      # need this to be broken to check for correct source ordering
      build_repo gem_repo3 do
        build_gem "rack", repo3_rack_version do |s|
          s.write "lib/rack.rb", "RACK = 'FAIL'"
        end
      end
    end

    context "with multiple toplevel sources" do
      let(:repo3_rack_version) { "1.0.0" }

      before do
        gemfile <<-G
          source "file://localhost#{gem_repo3}"
          source "file://localhost#{gem_repo1}"
          gem "rack-obama"
          gem "rack"
        G
        bundle "config major_deprecations true"
      end

      it "warns about ambiguous gems, but installs anyway, prioritizing sources last to first", :bundler => "< 2" 


      it "errors when disable_multisource is set" 

    end

    context "when different versions of the same gem are in multiple sources" do
      let(:repo3_rack_version) { "1.2" }

      before do
        gemfile <<-G
          source "file://localhost#{gem_repo3}"
          source "file://localhost#{gem_repo1}"
          gem "rack-obama"
          gem "rack", "1.0.0" # force it to install the working version in repo1
        G
        bundle "config major_deprecations true"
      end

      it "warns about ambiguous gems, but installs anyway", :bundler => "< 2" 

    end
  end

  context "with source affinity" do
    context "with sources given by a block" do
      before do
        # Oh no! Someone evil is trying to hijack rack :(
        # need this to be broken to check for correct source ordering
        build_repo gem_repo3 do
          build_gem "rack", "1.0.0" do |s|
            s.write "lib/rack.rb", "RACK = 'FAIL'"
          end

          build_gem "rack-obama" do |s|
            s.add_dependency "rack"
          end
        end

        gemfile <<-G
          source "file://#{gem_repo3}"
          source "file://#{gem_repo1}" do
            gem "thin" # comes first to test name sorting
            gem "rack"
          end
          gem "rack-obama" # shoud come from repo3!
        G
      end

      it "installs the gems without any warning" 


      it "can cache and deploy" 

    end

    context "with sources set by an option" do
      before do
        # Oh no! Someone evil is trying to hijack rack :(
        # need this to be broken to check for correct source ordering
        build_repo gem_repo3 do
          build_gem "rack", "1.0.0" do |s|
            s.write "lib/rack.rb", "RACK = 'FAIL'"
          end

          build_gem "rack-obama" do |s|
            s.add_dependency "rack"
          end
        end

        gemfile <<-G
          source "file://#{gem_repo3}"
          gem "rack-obama" # should come from repo3!
          gem "rack", :source => "file://#{gem_repo1}"
        G
      end

      it "installs the gems without any warning" 

    end

    context "when a pinned gem has an indirect dependency" do
      before do
        build_repo gem_repo3 do
          build_gem "depends_on_rack", "1.0.1" do |s|
            s.add_dependency "rack"
          end
        end
      end

      context "when the indirect dependency is in the pinned source" do
        before do
          # we need a working rack gem in repo3
          update_repo gem_repo3 do
            build_gem "rack", "1.0.0"
          end

          gemfile <<-G
            source "file://#{gem_repo2}"
            source "file://#{gem_repo3}" do
              gem "depends_on_rack"
            end
          G
        end

        context "and not in any other sources" do
          before do
            build_repo(gem_repo2) {}
          end

          it "installs from the same source without any warning" 

        end

        context "and in another source" do
          before do
            # need this to be broken to check for correct source ordering
            build_repo gem_repo2 do
              build_gem "rack", "1.0.0" do |s|
                s.write "lib/rack.rb", "RACK = 'FAIL'"
              end
            end
          end

          context "when lockfile_uses_separate_rubygems_sources is set" do
            before do
              bundle! "config lockfile_uses_separate_rubygems_sources true"
              bundle! "config disable_multisource true"
            end

            it "installs from the same source without any warning" 

          end
        end
      end

      context "when the indirect dependency is in a different source" do
        before do
          # In these tests, we need a working rack gem in repo2 and not repo3
          build_repo gem_repo2 do
            build_gem "rack", "1.0.0"
          end
        end

        context "and not in any other sources" do
          before do
            gemfile <<-G
              source "file://#{gem_repo2}"
              source "file://#{gem_repo3}" do
                gem "depends_on_rack"
              end
            G
          end

          it "installs from the other source without any warning" 

        end

        context "and in yet another source" do
          before do
            gemfile <<-G
              source "file://localhost#{gem_repo1}"
              source "file://localhost#{gem_repo2}"
              source "file://localhost#{gem_repo3}" do
                gem "depends_on_rack"
              end
            G
          end

          it "installs from the other source and warns about ambiguous gems", :bundler => "< 2" 

        end

        context "and only the dependency is pinned" do
          before do
            # need this to be broken to check for correct source ordering
            build_repo gem_repo2 do
              build_gem "rack", "1.0.0" do |s|
                s.write "lib/rack.rb", "RACK = 'FAIL'"
              end
            end

            gemfile <<-G
              source "file://#{gem_repo3}" # contains depends_on_rack
              source "file://#{gem_repo2}" # contains broken rack

              gem "depends_on_rack" # installed from gem_repo3
              gem "rack", :source => "file://#{gem_repo1}"
            G
          end

          it "installs the dependency from the pinned source without warning", :bundler => "< 2" 

        end
      end
    end

    context "when a top-level gem has an indirect dependency" do
      context "when lockfile_uses_separate_rubygems_sources is set" do
        before do
          bundle! "config lockfile_uses_separate_rubygems_sources true"
          bundle! "config disable_multisource true"
        end

        before do
          build_repo gem_repo2 do
            build_gem "depends_on_rack", "1.0.1" do |s|
              s.add_dependency "rack"
            end
          end

          build_repo gem_repo3 do
            build_gem "unrelated_gem", "1.0.0"
          end

          gemfile <<-G
            source "file://#{gem_repo2}"

            gem "depends_on_rack"

            source "file://#{gem_repo3}" do
              gem "unrelated_gem"
            end
          G
        end

        context "and the dependency is only in the top-level source" do
          before do
            update_repo gem_repo2 do
              build_gem "rack", "1.0.0"
            end
          end

          it "installs all gems without warning" 

        end

        context "and the dependency is only in a pinned source" do
          before do
            update_repo gem_repo3 do
              build_gem "rack", "1.0.0" do |s|
                s.write "lib/rack.rb", "RACK = 'FAIL'"
              end
            end
          end

          it "does not find the dependency" 

        end

        context "and the dependency is in both the top-level and a pinned source" do
          before do
            update_repo gem_repo2 do
              build_gem "rack", "1.0.0"
            end

            update_repo gem_repo3 do
              build_gem "rack", "1.0.0" do |s|
                s.write "lib/rack.rb", "RACK = 'FAIL'"
              end
            end
          end

          it "installs the dependency from the top-level source without warning" 

        end
      end
    end

    context "with a gem that is only found in the wrong source" do
      before do
        build_repo gem_repo3 do
          build_gem "not_in_repo1", "1.0.0"
        end

        gemfile <<-G
          source "file://#{gem_repo3}"
          gem "not_in_repo1", :source => "file://#{gem_repo1}"
        G
      end

      it "does not install the gem" 

    end

    context "with an existing lockfile" do
      before do
        system_gems "rack-0.9.1", "rack-1.0.0", :path => :bundle_path

        lockfile <<-L
          GEM
            remote: file:#{gem_repo1}
            remote: file:#{gem_repo3}
            specs:
              rack (0.9.1)

          PLATFORMS
            ruby

          DEPENDENCIES
            rack!
        L

        gemfile <<-G
          source "file://#{gem_repo1}"
          source "file://#{gem_repo3}" do
            gem 'rack'
          end
        G
      end

      # Reproduction of https://github.com/bundler/bundler/issues/3298
      it "does not unlock the installed gem on exec" 

    end

    context "with a path gem in the same Gemfile" do
      before do
        build_lib "foo"

        gemfile <<-G
          gem "rack", :source => "file://#{gem_repo1}"
          gem "foo", :path => "#{lib_path("foo-1.0")}"
        G
      end

      it "does not unlock the non-path gem after install" 

    end
  end

  context "when an older version of the same gem also ships with Ruby" do
    before do
      system_gems "rack-0.9.1"

      gemfile <<-G
        source "file://#{gem_repo1}"
        gem "rack" # shoud come from repo1!
      G
    end

    it "installs the gems without any warning" 

  end

  context "when a single source contains multiple locked gems" do
    before do
      # 1. With these gems,
      build_repo4 do
        build_gem "foo", "0.1"
        build_gem "bar", "0.1"
      end

      # 2. Installing this gemfile will produce...
      gemfile <<-G
        source 'file://#{gem_repo1}'
        gem 'rack'
        gem 'foo', '~> 0.1', :source => 'file://#{gem_repo4}'
        gem 'bar', '~> 0.1', :source => 'file://#{gem_repo4}'
      G

      # 3. this lockfile.
      lockfile <<-L
        GEM
          remote: file:/Users/andre/src/bundler/bundler/tmp/gems/remote1/
          remote: file:/Users/andre/src/bundler/bundler/tmp/gems/remote4/
          specs:
            bar (0.1)
            foo (0.1)
            rack (1.0.0)

        PLATFORMS
          ruby

        DEPENDENCIES
          bar (~> 0.1)!
          foo (~> 0.1)!
          rack
      L

      bundle! :install, forgotten_command_line_options(:path => "../gems/system")

      # 4. Then we add some new versions...
      update_repo4 do
        build_gem "foo", "0.2"
        build_gem "bar", "0.3"
      end
    end

    it "allows them to be unlocked separately" 

  end

  context "re-resolving" do
    context "when there is a mix of sources in the gemfile" do
      before do
        build_repo3
        build_lib "path1"
        build_lib "path2"
        build_git "git1"
        build_git "git2"

        install_gemfile <<-G
          source "file://#{gem_repo1}"
          gem "rails"

          source "file://#{gem_repo3}" do
            gem "rack"
          end

          gem "path1", :path => "#{lib_path("path1-1.0")}"
          gem "path2", :path => "#{lib_path("path2-1.0")}"
          gem "git1",  :git  => "#{lib_path("git1-1.0")}"
          gem "git2",  :git  => "#{lib_path("git2-1.0")}"
        G
      end

      it "does not re-resolve" 

    end
  end

  context "when a gem is installed to system gems" do
    before do
      install_gemfile! <<-G
        source "file://#{gem_repo1}"
        gem "rack"
      G
    end

    context "and the gemfile changes" do
      it "is still able to find that gem from remote sources" 

    end
  end

  context "when a gem is available from multiple ambiguous sources", :bundler => "2" do
    it "raises, suggesting a source block" 

  end
end

