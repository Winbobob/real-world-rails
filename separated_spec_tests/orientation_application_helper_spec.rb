require "rails_helper"

RSpec.describe ApplicationHelper do
  include ApplicationHelper

  describe "#markdown(text)" do
    let(:article) { create(:article) }

    it "converts the explicit markdown link to HTML" 


    it "converts the implicit markdown slug link (to an invalid article) to HTML" 


    it "converts the implicit markdown slug link (to an invalid article) in a list item to HTML" 


    it "converts the implicit markdown slug link (to a valid article) to HTML" 


    it "converts the implicit markdown title link (to a valid article) to HTML" 

  end
end

