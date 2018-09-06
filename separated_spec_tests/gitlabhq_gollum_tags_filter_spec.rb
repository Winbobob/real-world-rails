require 'spec_helper'

describe Banzai::Filter::GollumTagsFilter do
  include FilterSpecHelper

  let(:project) { create(:project) }
  let(:user) { double }
  let(:project_wiki) { ProjectWiki.new(project, user) }

  describe 'validation' do
    it 'ensure that a :project_wiki key exists in context' 

  end

  context 'linking internal images' do
    it 'creates img tag if image exists' 


    it 'does not creates img tag if image does not exist' 

  end

  context 'linking external images' do
    it 'creates img tag for valid URL' 


    it 'does not creates img tag for invalid URL' 

  end

  context 'linking external resources' do
    it "the created link's text will be equal to the resource's text" 


    it "the created link's text will be link-text" 

  end

  context 'linking internal resources' do
    it "the created link's text includes the resource's text and wiki base path" 


    it "the created link's text will be link-text" 

  end

  context 'table of contents' do
    it 'replaces [[<em>TOC</em>]] with ToC result' 


    it 'handles an empty ToC result' 

  end
end

