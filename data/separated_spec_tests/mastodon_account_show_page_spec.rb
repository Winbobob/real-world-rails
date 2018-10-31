# frozen_string_literal: true

require 'rails_helper'

describe 'The account show page' do
  it 'Has an h-feed with correct number of h-entry objects in it' 


  it 'has valid opengraph tags' 


  def head_meta_content(property)
    head_section.meta("[@property='#{property}']")[:content]
  end

  def head_section
    Nokogiri::Slop(response.body).html.head
  end

  def h_feed_entries
    Nokogiri::HTML(response.body).search('.h-feed .h-entry')
  end
end

