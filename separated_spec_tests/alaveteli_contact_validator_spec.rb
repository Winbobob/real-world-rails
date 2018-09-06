# -*- encoding : utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ContactValidator do

  describe '.new' do

    let(:valid_params) do
      { :name => "Vinny Vanilli",
        :email => "vinny@localhost",
        :subject => "Why do I have such an ace name?",
        :message => "You really should know!!!\n\nVinny" }
    end

    it 'validates specified attributes' 


    it 'validates name is present' 


    it 'validates email is present' 


    it 'validates email format' 


    it 'validates subject is present' 


    it 'validates message is present' 


  end

end

