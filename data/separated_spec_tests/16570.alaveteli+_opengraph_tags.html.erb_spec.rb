require 'spec_helper'

describe 'general/_opengraph_tags.html.erb' do

  def render_view
    render :partial => 'general/opengraph_tags'
  end

  describe 'displaying the opengraph logo', feature: :alaveteli_pro do
    before do
      assign(:in_pro_area, true)
    end

    it 'shows pro version of the logo if it is available' 


    it 'shows standard version of the logo if the pro version is not found' 


  end

end

