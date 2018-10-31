require 'spec_helper'

describe TagSetsHelper do
  describe 'nomination_notes' do
    before(:each) do
      @limit = HashWithIndifferentAccess.new
      @limit[:fandom] = 3
      @limit[:character] = 3
      @limit[:relationship] = 3
      @limit[:freeform] = 3
    end

    context 'for nominations allowing only freeforms' do
      it 'should say you can nominate up to a certain amount' 

    end

    context 'for nominations allowing relationships' do
      it 'should have relationships info listed last' 

    end

    context 'for nominations allowing NO relationships' do
      it 'should not mention relationships' 

    end

    context 'for nominations allowing fandoms, NO characters,
        and NO relationships' do
      it 'should mention only fandoms' 

    end

    context 'for nominations allowing fandoms, relationships,
        and NO characters' do
      it 'should mentions fandoms and relationships' 

    end

    context 'for nominations allowing characters, relationships, NO fandoms' do
      it 'should mention characters and relationships' 

    end

    context 'for nominations allowing characters, NO relationships,
        NO fandoms' do
      it 'should mention only characters' 

    end

    context 'for nominations allowing relationships, NO characters,
        NO fandoms' do
      it 'should mention only relationships' 

    end
  end

  describe 'nomination_status' do
    before(:each) do
      @nomination = FactoryGirl.create(:tag_nomination)
    end

    context 'for valid nominations' do
      it 'should show basic information' 

    end

    context 'for approved nominations' do
      it 'should show correct class information' 

    end

    context 'for rejected nominations' do
      it 'should show correct class information' 

    end

    context 'for unreviewed nominations' do
      it 'should show correct class information' 

    end
  end

  describe 'nomination_tag_information' do
    before(:each) do
      @nominated_tag = FactoryGirl.create(:tag_nomination)
    end

    context 'for valid information' do
      it 'should show basic information' 

    end

    context 'for canonical tags' do
      it 'should show correct tag information for parented tags' 


      it 'should show correct tag information for unparented tags' 

    end

    context 'for synonym tags' do
      xit 'should show correct tag information for synonym tags' do
        # I've left this here so others can see what I was attempting to do.
        # It looks like the Fandom object is changing (being recreated) between
        # what it looks like here in this test, and when it shows up in the
        # 'nomination_tag_information' method in the tags_helper.rb file.
        @synonym = FactoryGirl.create(:tag_nomination)
        @synonym.synonym = true
        @synonym.canonical = false
        @nominated_tag.canonical = true
        @synonym.owned_tag_set.
          tags.last.merger = @nominated_tag.owned_tag_set.tags.last
        @synonym.tagname = @synonym.owned_tag_set.tags.last.name

        expect(helper.nomination_tag_information(@synonym)).
          to include("title=\"synonym\"").
          and include('This is a synonym of a canonical tag.').
          and include('non-canonical tag')
      end
    end

    context 'for exists tags' do
      it 'should show correct tag information for tags that exist' 

    end
  end

  describe 'tag_relation_to_list' do
    context 'for a single type of tag' do
      it 'should return a list of single-type tags' 

    end
  end
end

