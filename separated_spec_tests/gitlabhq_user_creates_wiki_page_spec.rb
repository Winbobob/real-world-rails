require "spec_helper"

describe "User creates wiki page" do
  let(:user) { create(:user) }

  before do
    project.add_master(user)
    sign_in(user)

    visit(project_wikis_path(project))
  end

  context "when wiki is empty" do
    context "in a user namespace" do
      let(:project) { create(:project, :wiki_repo, namespace: user.namespace) }

      it "shows validation error message" 


      it "shows non-escaped link in the pages list", :js do
        click_link("New page")

        page.within("#modal-new-wiki") do
          fill_in(:new_wiki_path, with: "one/two/three-test")

          click_on("Create page")
        end

        page.within(".wiki-form") do
          fill_in(:wiki_content, with: "wiki content")

          click_on("Create page")
        end

        expect(current_path).to include("one/two/three-test")
        expect(page).to have_xpath("//a[@href='/#{project.full_path}/wikis/one/two/three-test']")
      end

      it "has `Create home` as a commit message" 


      it "creates a page from the home page" 


      it "creates ASCII wiki with LaTeX blocks", :js do
        stub_application_setting(plantuml_url: "http://localhost", plantuml_enabled: true)

        ascii_content = <<~MD
          :stem: latexmath

          [stem]
          ++++
          \\sqrt{4} = 2
          ++++

          another part

          [latexmath]
          ++++
          \\beta_x \\gamma
          ++++

          stem:[2+2] is 4
        MD

        find("#wiki_format option[value=asciidoc]").select_option

        fill_in(:wiki_content, with: ascii_content)

        page.within(".wiki-form") do
          click_button("Create page")
        end

        page.within ".wiki" do
          expect(page).to have_selector(".katex", count: 3).and have_content("2+2 is 4")
        end
      end
    end

    context "in a group namespace", :js do
      let(:project) { create(:project, :wiki_repo, namespace: create(:group, :public)) }

      it "has `Create home` as a commit message" 


      it "creates a page from from the home page" 

    end
  end

  context "when wiki is not empty", :js do
    before do
      create(:wiki_page, wiki: create(:project, :wiki_repo, namespace: user.namespace).wiki, attrs: { title: "home", content: "Home page" })
    end

    context "in a user namespace" do
      let(:project) { create(:project, :wiki_repo, namespace: user.namespace) }

      context "via the `new wiki page` page" do
        it "creates a page with a single word" 


        it "creates a page with spaces in the name" 


        it "creates a page with hyphens in the name" 

      end

      it "shows the autocompletion dropdown" 

    end

    context "in a group namespace" do
      let(:project) { create(:project, :wiki_repo, namespace: create(:group, :public)) }

      context "via the `new wiki page` page" do
        it "creates a page" 

      end
    end
  end
end

