# -*- encoding : utf-8 -*-
require 'spec_helper'

describe 'alaveteli_pro/public_bodies/_search_result.html.erb' do
  let(:public_body) do
    FactoryGirl.create(:public_body, notes: "Some notes about the body",
                                     info_requests_visible_count: 1)
  end

  let(:result) do
    {
      name: public_body.name,
      notes: public_body.notes,
      info_requests_visible_count: public_body.info_requests_visible_count
    }
  end

  def render_view
    render partial: 'alaveteli_pro/public_bodies/search_result', locals: { result: result }
  end

  it "includes the body name" 


  it "includes the body notes" 


  it "truncates the body notes to 150 chars" 


  it "includes the number of requests made" 


  it "pluralizes the number of requests made" 

end

