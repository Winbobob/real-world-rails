# -*- encoding : utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe HighlightHelper do
  include HighlightHelper

  describe '#highlight_and_excerpt' do

    it 'excerpts text and highlights phrases' 


    it 'excerpts text and highlights matches' 


    context 'multiple matches' do

      it 'highlights multiple matches' 


      it 'bases the split on the first match' 


    end

  end

  describe '#highlight_matches' do

    it 'highlights' 


    it 'sanitizes input' 


    it 'doesnt sanitize when the sanitize option is false' 


    it 'highlights using regexp' 


    it 'accepts regex' 


    it 'highlights multiple phrases in one pass' 


    it 'highlights with html' 


    it 'doesnt modify the options hash' 


    it 'highlights with a block' 


  end

  describe '#excerpt' do

    it 'excerpts' 


    it 'is not html safe' 


    it 'excerpts borderline cases' 


    it 'excerpts with regex' 


    it 'excerpts with omission' 


    it 'excerpts with utf8' 


    it 'doesnt modify the options hash' 


    it 'excerpts with separator' 


  end

end

