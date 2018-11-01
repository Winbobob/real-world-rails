# frozen_string_literal: true

require 'rails_helper'
require "#{Rails.root}/lib/article_utils"

class MockWiktionary
  def self.project
    'wiktionary'
  end
end

describe ArticleUtils do
  describe '.format_article_title' do
    it 'capitalizes the first letter and replace spaces with underscores' 


    it 'does not mess with letters other than the first' 


    it 'handles non-ASCII characters' 


    it 'does not capitalize wiktionary titles' 

  end
end

