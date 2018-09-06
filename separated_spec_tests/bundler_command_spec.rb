# frozen_string_literal: true

RSpec.describe "command plugins" do
  before do
    build_repo2 do
      build_plugin "command-mah" do |s|
        s.write "plugins.rb", <<-RUBY
          module Mah
            class Plugin < Bundler::Plugin::API
              command "mahcommand" # declares the command

              def exec(command, args)
                puts "MahHello"
              end
            end
          end
        RUBY
      end
    end

    bundle "plugin install command-mah --source file://#{gem_repo2}"
  end

  it "executes without arguments" 


  it "accepts the arguments" 


  it "raises error on redeclaration of command" 

end

