# frozen_string_literal: true

require 'rails_helper'

describe Admin::SidebarController, type: :controller do
  let!(:blog) { create(:blog) }

  before do
    henri = create(:user, :as_admin)
    sign_in henri
  end

  describe '#index' do
    context 'when rendering' do
      render_views

      it 'renders the sidebar configuration' 

    end
  end

  describe '#update' do
    it 'updates content' 

  end

  describe '#sortable' do
    render_views

    it 'creates new sidebars in the current blog' 


    it 'renders template for js response' 

  end
end

