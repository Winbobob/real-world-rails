require 'rails_helper'

describe ApplicationHelper do
  it "parses dates" 


  it "shows required field marker help text with proper formatting" 


  describe '#avatar_uri' do
    context 'with a normal user' do
      before :each do
        @member = FactoryBot.build(:member, email: 'example@example.com', preferred_avatar_uri: nil)
      end

      it 'should render a gravatar uri' 


      it 'should render a gravatar uri for a given size' 

    end

    context 'with a user who specified a preferred avatar uri' do
      before :each do
        @member = FactoryBot.build(:member, email: 'example@example.com', preferred_avatar_uri: 'http://media.catmoji.com/post/ujg/cat-in-hat.jpg')
      end

      it 'should render a the specified uri' 

    end
  end

  describe '#localize_plural' do
    let(:post) { create(:post) }

    context 'with a populated collection' do
      context 'with one element' do
        before { create(:comment, post: post) }

        it 'returns a string with the quantity and the plural of the model' 

      end

      context 'with more than one element' do
        before { create_list(:comment, 2, post: post) }

        it 'returns a string with the quantity and the plural of the model' 

      end
    end

    context 'without a populated collection' do
      it 'returns a string with the quantity and the plural of the model' 

    end

    describe '#build_alert_classes' do
      context 'danger' do
        it 'works when :alert' 

        it 'works when :danger' 

        it 'works when :error' 

        it 'works when :validation_errors' 

        it 'includes base classes' 

        it 'does not include danger when info' 

      end

      context 'warning' do
        it 'works when :warning' 

        it 'works when :todo' 

        it 'includes base classes' 

        it 'does not include warning when info' 

      end

      context 'success' do
        it 'works when :notice' 

        it 'works when :success' 

        it 'includes base classes' 

        it 'does not include success when info' 

      end

      context 'info' do
        it 'works when :info' 

        it 'works when blank' 

        it 'includes base classes' 

        it 'does not include info when danger' 

      end
    end
  end
end

