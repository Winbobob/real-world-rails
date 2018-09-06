# -*- encoding : utf-8 -*-
require 'spec_helper'

describe AlaveteliPro::PagesController do

  describe 'GET #show' do

    context 'when asked for an existing template' do

      before do
        get :show, id: 'legal'
      end

      it 'renders the template' 


      it 'returns http success' 


      it 'sets in_pro_area' 

    end

    context 'when asked for a template that does not exist' do

      it 'raises ActiveRecord::RecordNotFound' 

    end
  end
end

