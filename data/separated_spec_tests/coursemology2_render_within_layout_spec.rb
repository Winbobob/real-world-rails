# frozen_string_literal: true
require 'rails_helper'

RSpec.describe 'Extension: render within_layout', type: :view do
  let(:views_directory) do
    path = Pathname.new("#{__dir__}/../fixtures/libraries/render_within_layout")
    path.realpath
  end

  before do
    controller.prepend_view_path views_directory
  end

  it 'properly nests' 

end

