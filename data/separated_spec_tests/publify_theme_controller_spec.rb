require 'rails_helper'

describe ThemeController, type: :controller do
  render_views

  before { create(:blog, theme: 'plain') }

  it 'test_stylesheets' 


  it 'test_javascripts' 


  it 'test_malicious_path' 


  it 'renders 404 for missing file' 

end

