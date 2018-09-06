require 'spec_helper'

describe Oauth::ApplicationsController do
  describe 'index' do
    context 'current user present' do
      it 'renders' 

    end
    context 'no current user present' do
      it 'redirects' 

    end
  end

  describe 'create' do
    it 'creates an application and adds the v2 accessor to it' 

  end

  describe 'edit' do
    it 'renders if owned by user' 


    it 'renders if superuser' 


    it 'redirects if no user present' 


    it 'redirects if not owned by user' 

  end

  describe 'update' do
    it 'renders if owned by user' 


    it "doesn't update if not users" 

  end
end

