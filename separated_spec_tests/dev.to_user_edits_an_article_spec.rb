require "rails_helper"

describe "Editing with an editor" do
  let(:user) { create(:user) }
  let(:dir) { "../support/fixtures/sample_article.txt" }
  let(:template) { File.read(File.join(File.dirname(__FILE__), dir)) }
  let(:article) do
    create(:article,
           user_id: user.id,
           body_markdown: template.gsub("false", "true"),
           body_html: "")
  end

  before do
    sign_in user
  end

  it "user click the edit-post button", js: true, retry: 3 do
    link = "/#{user.username}/#{article.slug}"
    visit link
    find("#action-space").click
    expect(page).to have_current_path(link + "/edit")
  end

  it "user preview their edit post" 


  it "user update their post" 

end

