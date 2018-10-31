require "rails_helper"

RSpec.describe DevCommentTag, type: :liquid_template do
  let(:user)        { create(:user) }
  let(:article)     { create(:article, user_id: user.id) }
  let(:comment)     { create(:comment, user_id: user.id, commentable_id: article.id) }

  setup             { Liquid::Template.register_tag("devcomment", DevCommentTag) }

  def generate_comment_tag(id_code)
    Liquid::Template.parse("{% devcomment #{id_code} %}")
  end

  context "when given valid id_code" do
    it "fetches the target comment" 


    it "raise error if comment does not exist" 

  end

  it "rejects invalid id_code" 

end

