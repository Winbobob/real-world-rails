# frozen_string_literal: true

RSpec.describe "bundle install with :allow_offline_install" do
  before do
    bundle "config allow_offline_install true"
  end

  context "with no cached data locally" do
    it "still installs" 


    it "still fails when the network is down" 

  end

  context "with cached data locally" do
    it "will install from the compact index" 


    def break_git_remote_ops!
      FileUtils.mkdir_p(tmp("broken_path"))
      File.open(tmp("broken_path/git"), "w", 0o755) do |f|
        f.puts strip_whitespace(<<-RUBY)
          #!/usr/bin/env ruby
          if %w(fetch --force --quiet --tags refs/heads/*:refs/heads/*).-(ARGV).empty? || %w(clone --bare --no-hardlinks --quiet).-(ARGV).empty?
            warn "git remote ops have been disabled"
            exit 1
          end
          ENV["PATH"] = ENV["PATH"].sub(/^.*?:/, "")
          exec("git", *ARGV)
        RUBY
      end

      old_path = ENV["PATH"]
      ENV["PATH"] = "#{tmp("broken_path")}:#{ENV["PATH"]}"
      yield if block_given?
    ensure
      ENV["PATH"] = old_path if block_given?
    end

    it "will install from a cached git repo" 

  end
end

