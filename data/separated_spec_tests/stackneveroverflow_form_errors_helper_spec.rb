# encoding: utf-8
require 'spec_helper'
require 'action_view'
require 'active_support'
require 'rspec/active_model/mocks'

require_relative '../../../app/helpers/form_errors_helper'

include ActionView::Helpers
include ActionView::Context
include FormErrorsHelper

describe FormErrorsHelper, :type => :helper do

  before do
    @base_errors = ['base error message', 'nasty error']
    @base_error = 'one base error'


    @title_errors = ["can't be blank", 'is too short (minimum is 5 characters)']
    @title_error = "can't be blank"

    @errors = double('errors')
    @new_post =  mock_model( 'Post' )
    allow(@new_post).to receive_messages(:errors => @errors)
    allow(self).to receive_messages(:post_path => '/post/1')
    allow(self).to receive_messages(:protect_against_forgery? => false)
    allow(self).to receive_messages(:polymorphic_path => '')

    @default_class = 'help-block'
    @default_error_class = 'has-error'
  end


  describe 'error[:base] is a string' do

    before do
      allow(@errors).to receive(:[]).with(:base).and_return(@base_error)
    end

    it 'should render base error on :base key' 


  end


  describe 'when there is only one error on base' do

    before do
      allow(@errors).to receive(:[]).with(:base).and_return(@base_error)
    end

    it 'should render base error on :base key' 


  end

  describe 'when there is only one error on title' do

    before do
      allow(@errors).to receive(:[]).with(:title).and_return(@title_error)
    end

    it 'should render base errors join with comma' 

  end



  describe 'when there is more than one error on title' do

    before do
      allow(@errors).to receive(:[]).with(:title).and_return(@title_errors)
    end

    it 'should render base errors join with comma' 

  end


  describe 'when there are no errors' do
    before do
      allow(@errors).to receive(:[]).with(:title).and_return(nil)
    end

    it 'should return nil' 

  end

  describe 'when :error_class option is passed' do
    let(:error_class) { 'has_warning' }

    before do
      allow(@errors).to receive(:[]).with(:title).and_return(@title_error)
    end

    it "should render with passed error class " 

  end

  describe 'when :error_class option is passed' do
    let(:span_class) { 'help-inline' }

    before do
      allow(@errors).to receive(:[]).with(:title).and_return(@title_error)
    end

    it "should render with passed error class " 


  end

end

