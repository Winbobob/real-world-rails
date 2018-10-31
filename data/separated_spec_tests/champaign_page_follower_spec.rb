# frozen_string_literal: true
require 'rails_helper'

describe PageFollower do
  include Rails.application.routes.url_helpers

  let(:page_id) { 1 }
  let(:follow_up_page_id) { 2 }
  let(:follow_up_layout_id) { 3 }

  describe 'follow_up_path' do
    describe 'plan is :with_liquid' do
      let(:plan) { :with_liquid }

      describe 'while liquid_layout is blank' do
        it 'returns page path when page is passed' 


        it 'returns nil when page is blank' 

      end

      describe 'while liquid_layout is passed' do
        it 'returns liquid_layout path when page is passed' 


        it 'returns liquid_layout path when page is blank' 

      end
    end

    describe 'plan is :with_page' do
      let(:plan) { :with_page }

      describe 'while page is blank' do
        it 'returns nil when liquid_layout is blank' 


        it 'returns liquid_layout path when liquid_layout is passed' 

      end

      describe 'while page is passed' do
        it 'returns page path when liquid_layout is passed' 


        it 'returns page path when liquid_layout is passed and plan is a string' 


        it 'returns page path when liquid_layout is blank' 

      end
    end

    describe 'extra params' do
      let(:plan) { :with_page }

      describe 'are not in URL if the extra_params parameter' do
        it 'is not passed' 


        it 'is nil' 


        it 'is blank' 

      end

      describe 'when passed' do
        it 'ignores unknown parameters' 


        it 'passes bucket through' 


        it 'passes member_id through' 


        it 'passes member_id through and ignores unknown parameters' 


        it 'passes bucket and member_id through' 

      end
    end

    describe 'plan is anything else' do
      it 'raises error if plan is :with_link' 


      it 'raises error if plan is blank' 

    end
  end

  describe 'new_from_page' do
    let(:other_page) { instance_double('Page', slug: 'bleep-bloop') }
    let(:page) do
      instance_double(
        'Page',
        follow_up_plan: 'with_liquid',
        slug: 'astro-droid',
        follow_up_liquid_layout_id: 3,
        follow_up_page: other_page
      )
    end

    it 'calls with page attributes' 


    it 'returns the instance for call chaining' 

  end
end

