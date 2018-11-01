require "rails_helper"

RSpec.describe LinkTag, type: :liquid_template do
  let(:user) { create(:user, username: "username45", name: "Chase Danger", profile_image: nil) }
  let(:article) do
    create(:article, user_id: user.id, title: "test this please", tags: "tag1 tag2 tag3")
  end
  let(:org) { create(:organization) }
  let(:org_user) { create(:user, organization_id: org.id) }
  let(:org_article) do
    create(:article, user_id: org_user.id, title: "test this please", tags: "tag1 tag2 tag3",
                     organization_id: org.id)
  end

  def generate_new_liquid(slug)
    Liquid::Template.register_tag("link", LinkTag)
    Liquid::Template.parse("{% link #{slug} %}")
  end

  def correct_link_html(article)
    tags = article.tag_list.map { |t| "<span class='ltag__link__tag'>##{t}</span>" }.reverse.join
    <<-HTML
      <div class='ltag__link'>
        <a href='#{article.user.path}' class='ltag__link__link'>
          <div class='ltag__link__pic'>
            <img src='#{ProfileImage.new(article.user).get(150)}' alt='#{article.user.username} image'/>
          </div></a>
          <a href='#{article.path}' class='ltag__link__link'>
            <div class='ltag__link__content'>
              <h2>#{ActionController::Base.helpers.strip_tags(article.title)}</h2>
              <h3>#{article.user.name}</h3>
              <div class='ltag__link__taglist'>#{tags}</div>
            </div>
        </a>
      </div>
    HTML
  end

  it "raises an error when invalid" 


  it "renders a proper link tag" 


  it "also tries to look for article by organization if failed to find by username" 


  it "renders with a leading slash" 


  it "renders with a trailing slash" 


  it "renders with both leading and trailing slashes" 


  it "renders with a full link" 


  it "renders with a full link with a trailing slash" 

end

