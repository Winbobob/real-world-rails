require 'rails_helper'

describe PublifyTime do
  describe 'delta' do
    it 'returns nil when nil year, nil month and nil day' 


    it 'returns year when year given' 


    it 'returns year and month when year and month given' 


    it 'returns year, month and day when year, month and day given' 


    it 'returns year, when year given type string' 


    it 'returns year and month when year and month given type string' 


    it 'returns year, month and day when year, month and day given type string' 


    it 'returns nil when year, month and day are not numeric' 

  end

  describe 'delta_like' do
    it 'given year' 


    it 'given year month' 


    it 'given year month day' 

  end
end

describe 'find Article date range ' do
  let!(:blog) { create(:blog) }

  before do
    @timezone = Time.zone
  end

  after do
    Time.zone = @timezone
  end

  describe 'UTC' do
    before do
      Time.zone = 'UTC'

      @a = FactoryGirl.build(:article)
      @a.published_at = '1 Jan 2013 01:00 UTC'
      @a.save!

      params = @a.permalink_url.gsub("#{@a.blog.base_url}/", '').split('/')
      @year = params[0]
      @month = params[1]
      @day = params[2]
    end

    it 'delta given year' 


    it 'delta given year month' 


    it 'delta given year month day' 


    it 'delta_like given year' 


    it 'delta_like given year month' 


    it 'delta_like given year month day' 

  end

  describe 'JST(+0900) ' do
    before do
      Time.zone = 'Tokyo'

      @a = FactoryGirl.build(:article)
      @a.published_at = '1 Jan 2013 01:00 +0900'
      @a.save!

      params = @a.permalink_url.gsub("#{@a.blog.base_url}/", '').split('/')
      @year = params[0]
      @month = params[1]
      @day = params[2]
    end

    it 'delta given year' 


    it 'delta given year month' 


    it 'delta given year month day' 


    it 'delta_like given year' 


    it 'delta_like given year month' 


    it 'delta_like given year month day' 

  end
end

