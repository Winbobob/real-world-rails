# encoding: utf-8
require 'spec_helper'
require_relative '../../../app/helpers/modal_helper'

include ActionView::Helpers
include ActionView::Context
include ModalHelper

describe ModalHelper, :type => :helper do
  header_with_close    = { :show_close => true, :dismiss => 'modal', :title => 'Modal header' }
  header_without_close = { :show_close => false, :title => 'Modal header' }
  options              = { :id => "modal",
												 	 :header => header_with_close,
                           :body   => { content: 'This is the body' },
                           :footer => { content: content_tag(:button, 'Save', :class => 'btn') }
  }

  it 'returns a complete modal' 


  it 'returns a modal header with a close button if show_close is true' 


  it 'renders a modal header without a close button' 


	it 'renders a close button' 


  it 'renders a modal toggle button' 


  it 'renders a cancel button' 

end

BASIC_MODAL = <<-HTML
<div class=\"bootstrap-modal modal fade\" id=\"modal\"><div class=\"modal-dialog \"><div class=\"modal-content\"><div class=\"modal-header\"><button class=\"close\" data-dismiss=\"modal\" aria-hidden=\"true\">&times;</button><h4 class=\"modal-title\">Modal header</h4></div><div class=\"modal-body\">This is the body</div><div class=\"modal-footer\"><button class="btn">Save</button></div></div></div></div>
HTML

MODAL_HEADER_WITHOUT_CLOSE = <<-HTML
<div class="modal-header"><h4 class=\"modal-title\">Modal header</h4></div>
HTML

MODAL_HEADER_WITH_CLOSE = <<-HTML
<div class="modal-header"><button class="close" data-dismiss="modal" aria-hidden=\"true\">&times;</button><h4 class=\"modal-title\">Modal header</h4></div>
HTML

MODAL_TOGGLE = <<-HTML
<a class="btn btn-default" data-toggle="modal" href="#modal">Save</a>
HTML

MODAL_CANCEL_BUTTON = <<-HTML
<a class="btn bootstrap-modal-cancel-button" data-dismiss="modal" href="#modal">Cancel</a>
HTML


