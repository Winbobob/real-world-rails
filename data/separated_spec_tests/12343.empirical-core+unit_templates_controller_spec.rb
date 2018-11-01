require 'rails_helper'

describe  Teachers::UnitTemplatesController, type: :controller do
  it { should use_before_action :is_teacher? }
  it { should use_before_action :redirect_to_public_index_if_no_unit_template_found }

  include_context "Unit Assignments Variables"

  before do
    session[:user_id] = teacher.id
  end

  let(:parsed_body) { JSON.parse(response.body) }

  describe '#index, format: :json' do
    it 'responds with list of unit_templates' 

  end

  describe '#fast_assign' do
    context 'creates a new unit' do
      it "can create new units and classroom activities" 

    end
  end

  # no route for this action
  # describe '#show' do
  #   let!(:unit_template) { create(:unit_template) }
  #
  #   context 'when teacher' do
  #     it 'should set the content and unit template' do
  #       get :show, id: unit_template.id
  #       expect(assigns(:content)).to eq "Try out the #{unit_template.name} Activity Pack I’m using at Quill.org"
  #       expect(assigns(:unit_template_id)).to eq unit_template.id
  #     end
  #
  #     it 'should render show' do
  #       expect(response).to render_template :show
  #     end
  #   end
  #
  #   context 'when not teacher' do
  #     let(:student) { create(:student) }
  #
  #     before do
  #       allow(controller).to receive(:current_user) { student }
  #     end
  #
  #     it 'should render public show' do
  #       get :show, id: unit_template.id
  #       expect(response).to render_template "public_show"
  #     end
  #   end
  # end

  describe '#count' do
    it 'should set the count' 

  end

  describe '#profile_info' do
    before do
      allow_any_instance_of(UnitTemplate).to receive(:get_cached_serialized_unit_template) { {} }
    end

    it 'should render the correct json' 

  end
  
  describe '#assigned_info' do
    it 'should render the correct json' 

  end
end

