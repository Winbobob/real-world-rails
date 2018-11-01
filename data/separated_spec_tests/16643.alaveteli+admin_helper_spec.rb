# -*- encoding : utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe AdminHelper do

  include AdminHelper
  include ERB::Util

  describe '#comment_visibility' do

    it 'shows the status of a visible comment' 


    it 'shows the status of a hidden comment' 


  end

  describe '#sort_order_humanized' do

    it 'returns the humanized value if one is available' 


    it 'returns the titleized value if a humanized value is not available' 


    it 'accepts a Symbol argument' 


  end

  describe '#comment_both_links' do

    let(:comment) { FactoryBot.create(:comment) }

    it 'includes a link to the comment on the site' 


    it 'includes a link to admin edit page for the comment' 


  end

  describe '#highlight_allow_new_responses_from' do

    context 'anybody' do
      subject { highlight_allow_new_responses_from('anybody') }

      it 'does not highlight the default case' 


    end

    context 'authority_only' do
      subject { highlight_allow_new_responses_from('authority_only') }

      it 'adds a warning highlight' 


    end

    context 'nobody' do
      subject { highlight_allow_new_responses_from('nobody') }

      it 'adds a stronger warning highlight' 


    end

    context 'an unhandled string' do
      subject { highlight_allow_new_responses_from('unhandled') }

      it 'does not highlight an unhandled string' 


    end

  end

end

