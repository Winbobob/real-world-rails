# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "alaveteli_pro/info_request_batches/_authority_list.html.erb" do
  let(:html_body) { FactoryBot.create(:public_body, name: "One & Two") }
  let(:other_body) { FactoryBot.create(:public_body) }
  let(:other_body_2) { FactoryBot.create(:public_body) }
  let(:public_bodies) { [html_body, other_body, other_body_2] }
  let(:template) do
    "alaveteli_pro/info_request_batches/authority_list.html.erb"
  end

  def render_html_partial(public_bodies)
    render partial: template, locals: { public_bodies: public_bodies }
  end

  it "escapes HTMLEntities in public body names" 


  context "when there's more than one body" do
    before do
      render_html_partial(public_bodies)
    end

    it "pluralises the message" 

  end

  context "when there's only one body" do
    before do
      render_html_partial([other_body])
    end

    it "singularises the message" 

  end

  context "when there are no bodies" do
    before do
      render_html_partial([])
    end

    it "says there are no bodies" 

  end
end

