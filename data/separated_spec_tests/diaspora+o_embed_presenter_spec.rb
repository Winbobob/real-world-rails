# frozen_string_literal: true

describe OEmbedPresenter do
  before do
   @oembed = OEmbedPresenter.new(FactoryGirl.create(:status_message))
  end

  it 'is a hash' 


  context 'required options from oembed spec' do
    it 'supports maxheight + maxwidth(required)' 

  end

  describe '#iframe_html' do
    it 'passes the height options to post_iframe_url' 

  end

  describe '.id_from_url' do
    it 'takes a long post url and gives you the id' 


    it 'takes a short post url and gives you the id' 

  end
end

