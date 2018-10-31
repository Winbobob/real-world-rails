require 'rails_helper'

describe PagesHelper, type: :helper do
  describe 'render_page_content' do
    before do
      Page.find('system/unauthorized').update_attributes!(body: 'safe<script>notsafe</script>')
    end

    it 'should return sanitized content' 


    it 'should be html_safe' 


    it 'should return nil if no page found' 

  end
end

