require 'rails_helper'

RSpec.describe MarkdownEditorsController, type: :controller do
  render_views

  let!(:participant) { create :participant }

  before do
    sign_in participant
  end

  describe "GET #index" do
    it "assigns the requested markdown_editor_controller as @markdown_editor_controller" 

  end

end

