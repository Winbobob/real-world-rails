require 'rails_helper'

describe 'layouts/default.html.erb', type: :view do
  with_each_theme do |theme, view_path|
    describe theme ? "with theme #{theme}" : 'without a theme' do
      before(:each) do
        assign(:keywords, %w(foo bar))
        assign(:auto_discovery_url_atom, '')
        assign(:auto_discovery_url_rss, '')
        @controller.view_paths.unshift(view_path) if theme
      end

      it 'has keyword meta tag when use_meta_keyword set to true' 


      it 'does not have keyword meta tag when use_meta_keyword set to false' 

    end
  end
end

