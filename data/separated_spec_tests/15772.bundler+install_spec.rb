# frozen_string_literal: true

RSpec.describe "bundler plugin install" do
  before do
    build_repo2 do
      build_plugin "foo"
      build_plugin "kung-foo"
    end
  end

  it "shows proper message when gem in not found in the source" 


  it "installs from rubygems source" 


  it "installs multiple plugins" 


  it "uses the same version for multiple plugins" 


  it "works with different load paths" 


  context "malformatted plugin" do
    it "fails when plugins.rb is missing" 


    it "fails when plugins.rb throws exception on load" 

  end

  context "git plugins" do
    it "installs form a git source" 


    it "installs form a local git source" 


    it "raises an error when both git and local git sources are specified" 

  end

  context "Gemfile eval" do
    it "installs plugins listed in gemfile" 


    it "accepts plugin version" 


    it "accepts git sources" 

  end

  context "inline gemfiles" do
    it "installs the listed plugins" 

  end

  describe "local plugin" do
    it "is installed when inside an app" 


    context "conflict with global plugin" do
      before do
        update_repo2 do
          build_plugin "fubar" do |s|
            s.write "plugins.rb", <<-RUBY
              class Fubar < Bundler::Plugin::API
                command "shout"

                def exec(command, args)
                  puts "local_one"
                end
              end
            RUBY
          end
        end

        # inside the app
        gemfile "source 'file://#{gem_repo2}'\nplugin 'fubar'"
        bundle "install"

        update_repo2 do
          build_plugin "fubar", "1.1" do |s|
            s.write "plugins.rb", <<-RUBY
              class Fubar < Bundler::Plugin::API
                command "shout"

                def exec(command, args)
                  puts "global_one"
                end
              end
            RUBY
          end
        end

        # outside the app
        Dir.chdir tmp
        bundle "plugin install fubar --source file://#{gem_repo2}"
      end

      it "inside the app takes precedence over global plugin" 


      it "outside the app global plugin is used" 

    end
  end
end

