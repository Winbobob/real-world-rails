require File.dirname(__FILE__) + '/../spec_helper'

describe PageTitleHelper do
  include PageTitleHelper

  def enki_config
    {:title => 'Blog Title'}
  end

  describe '#posts_title with no tag' do
    it 'is the site title' 

  end

  describe '#posts_title with tag' do
    it 'is the titlelized tag name plus the site title' 

  end

  describe '#post_title' do
    it 'is the post title plus the site title' 

  end

  describe '#archives_title' do
    it 'is "Archives" plus the site title' 

  end

  describe '#page_title' do
    it 'is the page title plus the site title' 

  end

  describe '#html_title' do
    it 'uses the given string when present' 


    it 'defaults to the configured title if nothing is supplied' 

  end
end

