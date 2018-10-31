# frozen_string_literal: true

RSpec.describe "bundle viz", :ruby => "1.9.3", :bundler => "< 2", :if => Bundler.which("dot") do
  let(:ruby_graphviz) do
    graphviz_glob = base_system_gems.join("cache/ruby-graphviz*")
    Pathname.glob(graphviz_glob).first
  end

  before do
    system_gems ruby_graphviz
  end

  it "graphs gems from the Gemfile" 


  it "graphs gems that are prereleases" 


  context "with another gem that has a graphviz file" do
    before do
      build_repo4 do
        build_gem "graphviz", "999" do |s|
          s.write("lib/graphviz.rb", "abort 'wrong graphviz gem loaded'")
        end
      end

      system_gems ruby_graphviz, "graphviz-999", :gem_repo => gem_repo4
    end

    it "loads the correct ruby-graphviz gem" 

  end

  context "--without option" do
    it "one group" 


    it "two groups" 

  end
end

