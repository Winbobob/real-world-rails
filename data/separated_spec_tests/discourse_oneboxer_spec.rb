require 'rails_helper'
require_dependency 'oneboxer'

describe Oneboxer do

  it "returns blank string for an invalid onebox" 


  context "local oneboxes" do

    def link(url)
      url = "#{Discourse.base_url}#{url}"
      %{<a href="#{url}">#{url}</a>}
    end

    def preview(url, user = nil, category = nil, topic = nil)
      Oneboxer.preview("#{Discourse.base_url}#{url}",
        user_id: user&.id,
        category_id: category&.id,
        topic_id: topic&.id).to_s
    end

    it "links to a topic/post" 


    it "links to an user profile" 


    it "links to an upload" 


  end

  context ".onebox_raw" do
    it "should escape the onebox URL before processing" 

  end

end

