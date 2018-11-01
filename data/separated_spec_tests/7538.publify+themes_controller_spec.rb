# frozen_string_literal: true

require 'rails_helper'

describe Admin::ThemesController, type: :controller do
  render_views

  before do
    create(:blog)
    henri = create(:user, :as_admin)
    sign_in henri
  end

  describe 'test index' do
    before do
      get :index
    end

    it 'assigns @themes for the :index action' 

  end

  it 'redirects to :index after the :switchto action' 


  it 'returns success for the :preview action' 

end

