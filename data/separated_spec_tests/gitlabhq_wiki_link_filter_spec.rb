require 'spec_helper'

describe Banzai::Filter::WikiLinkFilter do
  include FilterSpecHelper

  let(:namespace) { build_stubbed(:namespace, name: "wiki_link_ns") }
  let(:project)   { build_stubbed(:project, :public, name: "wiki_link_project", namespace: namespace) }
  let(:user) { double }
  let(:wiki) { ProjectWiki.new(project, user) }

  it "doesn't rewrite absolute links" 


  it "doesn't rewrite links to project uploads" 


  describe "invalid links" do
    invalid_links = ["http://:8080", "http://", "http://:8080/path"]

    invalid_links.each do |invalid_link|
      it "doesn't rewrite invalid invalid_links like #{invalid_link}" 

    end
  end
end

