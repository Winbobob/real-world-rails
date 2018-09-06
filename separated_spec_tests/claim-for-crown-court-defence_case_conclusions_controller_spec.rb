require 'rails_helper'

RSpec.describe CaseConclusionsController, type: :controller do

  let(:params)          { { litigator_type: 'new', elected_case: 'false', transfer_stage_id: 30 } }
  let(:transfer_detail) { build :transfer_detail, litigator_type: 'new', elected_case: false, transfer_stage_id: 10 }

  describe 'GET index' do

    context 'basics' do
      before { get :index, params: params, xhr: true }

      it 'should assign @transfer_details' 


      it 'should render the index template' 

    end

    context 'for new litigator_type' do
      before { get :index, params: params, xhr: true }

      it 'should assign @transfer_stage_label_text to say start' 


      it 'should assign @transfer_date_label_text to say started' 

    end

    context 'for original litigator type' do
      before do
        params[:litigator_type] = 'original'
        get :index, params: params, xhr: true
      end
      it 'should assign @transfer_stage_label_text to say stop' 


      it 'should assign @transfer_date_label_text to say stopped' 

    end
  end

end

