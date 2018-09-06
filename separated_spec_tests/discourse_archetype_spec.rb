# encoding: utf-8

require 'rails_helper'
require 'archetype'

describe Archetype do

  context 'default archetype' do

    it 'has an Archetype by default' 


    it 'has an id of default' 


    context 'duplicate' do

      before do
        @old_size = Archetype.list.size
        Archetype.register(Archetype.default)
      end

      it 'does not add the same archetype twice' 


    end

  end

  context 'register an archetype' do

    it 'has one more element' 


  end

end

