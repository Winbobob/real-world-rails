# frozen_string_literal: true

require 'rails_helper'

describe TrainingController do
  let(:user) { create(:user) }
  let(:library_id) { 'students' }
  let(:module_id)  { TrainingModule.all.first.slug }

  describe 'show' do
    before  { allow(controller).to receive(:current_user).and_return(user) }
    subject { get :show, params: request_params }
    let(:request_params) { { library_id: library_id } }
    context 'library is legit' do
      it 'sets the library' 

    end
    context 'not a real library' do
      let(:library_id) { 'lolnotareallibrary' }
      it 'raises a module not found error' 

    end
  end

  describe '#training_module' do
    let(:request_params) do
      {
        library_id: library_id,
        module_id: module_id
      }
    end
    before { allow(controller).to receive(:current_user).and_return(user) }
    subject { get :training_module, params: request_params }
    context 'module is legit' do
      it 'sets the presenter' 

    end
    context 'not a real module' do
      let(:module_id) { 'lolnotarealmodule' }
      it 'raises a module not found error' 

    end
  end

  describe '#reload' do
    context 'for all modules' do
      let(:subject) { get :reload, params: { module: 'all' } }
      it 'returns the result upon success' 


      it 'displays an error message upon failure' 

    end

    context 'for a single module, from wiki' do
      let(:subject) { get :reload, params: { module: 'plagiarism' } }
      it 'returns the result upon success' 


      it 'displays an error message if the module does not exist' 

    end
  end

  # Make sure default trainings get reloaded
  after(:all) { TrainingModule.load_all }
end

