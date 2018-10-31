# frozen_string_literal: true

RSpec.describe "hook plugins" do
  before do
    build_repo2 do
      build_plugin "before-install-plugin" do |s|
        s.write "plugins.rb", <<-RUBY
          Bundler::Plugin::API.hook "before-install-all" do |deps|
            puts "gems to be installed \#{deps.map(&:name).join(", ")}"
          end
        RUBY
      end
    end

    bundle "plugin install before-install-plugin --source file://#{gem_repo2}"
  end

  it "runs after a rubygem is installed" 

end

