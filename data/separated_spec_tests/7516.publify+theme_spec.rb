# frozen_string_literal: true

require 'rails_helper'

describe Theme, type: :model do
  let(:blog) { build_stubbed :blog }
  let(:default_theme) { blog.current_theme }

  describe '#layout' do
    it 'returns "layouts/default" by default' 


    # FIXME: Test pages layout
  end

  describe '#name' do
    it "returns the theme's name (default: plain)" 

  end

  describe '#description' do
    it 'returns the contents of the corresponding markdown file' 

  end

  describe '.find_all' do
    let(:theme_directories) do
      Dir.glob(File.join(engine_root, 'themes/[a-zA-Z0-9]*')).select do |file|
        File.readable? "#{file}/about.markdown"
      end
    end

    it 'finds all the installed themes' 


    it 'includes the default theme' 

  end
end

