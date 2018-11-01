require 'spec_helper'

include HpricotSearch

describe 'shared/_pagination.html.erb', :type => :view do
  before :each do
    @page = 1
    @per_page = 10
    @total_rows = 100
  end

  subject do
    @children = (1 .. [@per_page, @total_rows].min).to_a.map { Child.new }
    @results = WillPaginate::Collection.create(@page, @per_page, @total_rows) do |pager|
      pager.replace @children
    end

    render :partial => 'shared/pagination', :locals => {:results => @results}
    rendered
  end

  before :each do
    Rails.application.routes.stub :url_for => '#'
  end

  describe 'pagination info box' do
    it 'no records' 


    it '1 record' 


    it 'less records than page' 


    it 'more records than page' 


    it 'next page' 

  end

  describe 'pagination links' do
    it 'no records' 


    it 'less records than page' 


    it 'disable previous link' 


    it 'enable previous link' 


    it 'disable next link' 


    it 'enable next link' 


    it 'highlight current page' 

  end
end

