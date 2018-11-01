# frozen_string_literal: true

require 'rails_helper'

describe ArticleHelper, type: :helper do
  before(:all) do
    # Create some articles in different namespaces
    @article = build(:article,
                     title: 'Selfie',
                     namespace: 0,
                     views_updated_at: '2014-12-31'.to_date)
    @sandbox = build(:article, namespace: 2, title: 'Ragesoss/sandbox')
    @draft = build(:article, namespace: 118, title: 'My_Awesome_Draft!!!')
  end

  describe '.article_url' do
    it 'gets the url for an article' 

  end

  describe '.full_title' do
    it 'gets the title including namespace prefix for an article' 

  end

  describe '.rating_display' do
    it 'displays bplus as b class' 


    it 'displays a/ga as a class' 


    it 'displays rated lists as basic lists' 

  end
end

