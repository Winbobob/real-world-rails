# -*- encoding : utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe PublicBodyHelper do
  include PublicBodyHelper

  describe '#public_body_not_requestable_reasons' do

    before do
      @body = FactoryGirl.build(:public_body)
    end

    it 'returns an empty array if there are no reasons' 


    it 'includes a reason if the law does not apply to the authority' 


    it 'includes a reason if the body no longer exists' 


    it 'links to the request page if the body has no contact email' 


    it 'returns the reasons in order of importance' 


  end


  describe '#type_of_authority' do

    it 'falls back to "A public authority"' 


    it 'handles Unicode' 


    it 'constructs the correct string if there are tags which are not categories' 



    context 'when associated with one category' do

      it 'returns the description wrapped in an anchor tag' 

    end

    context 'when associated with several categories' do

      it 'joins the category descriptions and capitalizes the first letter' 


    end

    context 'when in a non-default locale' do

      it 'creates the anchor href in the correct locale' 


    end

  end

end

