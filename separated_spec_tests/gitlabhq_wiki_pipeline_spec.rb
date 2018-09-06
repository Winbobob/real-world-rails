require 'rails_helper'

describe Banzai::Pipeline::WikiPipeline do
  describe 'TableOfContents' do
    it 'replaces the tag with the TableOfContentsFilter result' 


    it 'is case-sensitive' 


    it 'handles an empty pipeline result' 

  end

  describe "Links" do
    let(:namespace) { create(:namespace, name: "wiki_link_ns") }
    let(:project)   { create(:project, :public, name: "wiki_link_project", namespace: namespace) }
    let(:project_wiki) { ProjectWiki.new(project, double(:user)) }
    let(:page) { build(:wiki_page, wiki: project_wiki, page: OpenStruct.new(url_path: 'nested/twice/start-page')) }

    { "when GitLab is hosted at a root URL" => '/',
      "when GitLab is hosted at a relative URL" => '/nested/relative/gitlab' }.each do |test_name, relative_url_root|
      context test_name do
        before do
          allow(Gitlab.config.gitlab).to receive(:relative_url_root).and_return(relative_url_root)
        end

        describe "linking to pages within the wiki" do
          context "when creating hierarchical links to the current directory" do
            it "rewrites non-file links to be at the scope of the current directory" 


            it "rewrites file links to be at the scope of the current directory" 

          end

          context "when creating hierarchical links to the parent directory" do
            it "rewrites non-file links to be at the scope of the parent directory" 


            it "rewrites file links to be at the scope of the parent directory" 

          end

          context "when creating hierarchical links to a sub-directory" do
            it "rewrites non-file links to be at the scope of the sub-directory" 


            it "rewrites file links to be at the scope of the sub-directory" 

          end

          describe "when creating non-hierarchical links" do
            it 'rewrites non-file links to be at the scope of the wiki root' 


            it "rewrites file links to be at the scope of the current directory" 


            it 'rewrites links with anchor' 

          end

          describe "when creating root links" do
            it 'rewrites non-file links to be at the scope of the wiki root' 


            it 'rewrites file links to be at the scope of the wiki root' 

          end
        end

        describe "linking to pages outside the wiki (absolute)" do
          it "doesn't rewrite links" 

        end
      end
    end
  end
end

