require "rails_helper"

RSpec.describe UserTag, type: :liquid_template do
  let(:user)  { create(:user) }

  setup       { Liquid::Template.register_tag("user", UserTag) }

  def generate_user_tag(id_code)
    Liquid::Template.parse("{% user #{id_code} %}")
  end

  context "when given valid id_code" do
    it "renders the proper user name" 


    it "renders image html" 

  end

  it "rejects invalid id_code" 

end

