# frozen_string_literal: true

require "spec_helper"

describe "alchemy/admin/pictures/show.html.erb" do
  let(:image) do
    fixture_file_upload(
      File.expand_path('../../../fixtures/animated.gif', __dir__),
      'image/gif'
    )
  end

  let(:picture) do
    create(:alchemy_picture, {
      image_file: image,
      name: 'animated',
      image_file_name: 'animated.gif'
    })
  end

  before do
    allow(view).to receive(:admin_picture_path).and_return("/path")
    allow(view).to receive(:render_message) {}
    allow(view).to receive(:search_filter_params) { {} }
    view.extend Alchemy::Admin::FormHelper
  end

  it "displays picture in original format" 


  it "separates the tags with a comma" 

end

