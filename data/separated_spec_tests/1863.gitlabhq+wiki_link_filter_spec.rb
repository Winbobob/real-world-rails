require 'spec_helper'

describe Banzai::Filter::WikiLinkFilter do
  include FilterSpecHelper

  let(:namespace) { build_stubbed(:namespace, name: "wiki_link_ns") }
  let(:project)   { build_stubbed(:project, :public, name: "wiki_link_project", namespace: namespace) }
  let(:user) { double }
  let(:wiki) { ProjectWiki.new(project, user) }
  let(:repository_upload_folder) { Wikis::CreateAttachmentService::ATTACHMENT_PATH }

  it "doesn't rewrite absolute links" 


  it "doesn't rewrite links to project uploads" 


  describe "when links point to the #{Wikis::CreateAttachmentService::ATTACHMENT_PATH} folder" do
    context 'with an "a" html tag' do
      it 'rewrites links' 

    end

    context 'with "img" html tag' do
      let(:path) { "#{wiki.wiki_base_path}/#{repository_upload_folder}/a.jpg" }

      context 'inside an "a" html tag' do
        it 'rewrites links' 

      end

      context 'outside an "a" html tag' do
        it 'rewrites links' 

      end
    end

    context 'with "video" html tag' do
      it 'rewrites links' 

    end
  end

  describe "invalid links" do
    invalid_links = ["http://:8080", "http://", "http://:8080/path"]

    invalid_links.each do |invalid_link|
      it "doesn't rewrite invalid invalid_links like #{invalid_link}" 

    end
  end
end

