require 'rails_helper'

describe 'theme API' do
  let(:default_params) { { format: :json } }
  let(:theme) { create :theme }

  describe 'GET show' do
    it 'returns the theme for an admin' 


    it 'returns the theme for a user' 


    it 'returns the theme for a guest' 

  end

  describe 'PUT update' do
    before(:each) do
      @theme = create :theme
      @params = {
        name: 'Theme name',
        description: 'Theme description',
        config: {
          global: [{
            type: 'style',
            label: 'Primary Background ',
            selector: 'primary-background',
            rule: 'background-color',
            value: '#EBEBEB'
          }],
          link: [{
            type: 'style',
            label: 'Link Primary ',
            selector: 'link',
            rule: 'color',
            value: '#2464CC'
          }],
          button: [{
            type: 'mixin',
            label: 'Primary Button Text',
            selector: 'button-primary-text',
            rule: 'button-variant',
            value: '#FFFFFF'
          }],
          navigation: [{
            type: 'style',
            label: 'Primary Background ',
            selector: 'nav-primary-background',
            rule: 'background-color',
            value: '#33394D'
          }],
          region: [{
            type: 'style',
            label: 'Header Background ',
            selector: 'region-header-background',
            rule: 'background-color',
            value: '#FFFFFF'
          }],
          tables: [{
            type: 'style',
            label: 'Header Background ',
            selector: 'table-header-background',
            rule: 'background-color',
            value: '#414042'
          }],
          tags: [{
            type: 'style',
            label: 'Primary Background ',
            selector: 'tag-primary-background',
            rule: 'background-color',
            value: '#14855F'
          }],
          modal: [{
            type: 'style',
            label: 'Header Background ',
            selector: 'modal-header-background',
            rule: 'background-color',
            value: '#23A27E'
          }]
        }
      }
    end

    it 'allows an admin to make updates' 


    it 'prevents updates for a user' 


    it 'prevents updates for a guest' 

  end
end

