# -*- encoding : utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe AttachmentToHTML::View do

  let(:adapter) do
    double(:adapter,
           :body => '<p>hello</p>',
           :title => 'An attachment.txt',
           :success? => true)
  end

  let(:view) { AttachmentToHTML::View.new(adapter) }

  let(:default_template) do
    "#{ Rails.root }/lib/attachment_to_html/template.html.erb"
  end

  describe '.template' do

    after(:each) do
      AttachmentToHTML::View.template = nil
    end

    it 'has a default template location' 


  end

  describe '.template=' do

    after(:each) do
      AttachmentToHTML::View.template = nil
    end

    it 'allows a global template to be set' 


  end

  describe :new do

    it 'sets the title on initialization' 


    it 'sets the body on initialization' 


    it 'sets a default template if none is specified' 


    it 'allows a template to be set through an option' 


  end

  describe :title= do

    it 'allows the title to be set' 


  end

  describe :body= do

    it 'allows the body to be set' 


  end

  describe :template= do

    it 'allows the template to be set' 


  end

  describe :wrapper do

    it 'is set to wrapper by default' 


  end

  describe :wrapper= do

    it 'allows the wrapper div to be customised' 


  end

  # Need to remove all whitespace to assert equal because
  # ERB adds additional indentation after ERB tags
  describe :render do

    it 'renders the contents in to the template' 


    it 'allows the dynamic injection of content' 


  end

end

