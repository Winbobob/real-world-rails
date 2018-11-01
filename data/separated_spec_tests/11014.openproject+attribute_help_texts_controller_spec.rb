require 'spec_helper'

describe AttributeHelpTextsController, type: :controller do
  let(:model) { FactoryBot.build :work_package_help_text }
  let(:relation_columns_allowed) { true }

  let(:find_expectation) do
    allow(AttributeHelpText)
      .to receive(:find)
      .with(1234.to_s)
      .and_return(model)
  end

  before do
    with_enterprise_token(relation_columns_allowed ? :attribute_help_texts : nil)

    expect(controller).to receive(:require_admin)
  end

  describe '#index' do
    before do
      allow(AttributeHelpText).to receive(:all).and_return [model]

      get :index
    end

    it 'is successful' 


    context 'with help texts disallowed by the enterprise token' do
      let(:relation_columns_allowed) { false }

      it 'returns 404' 

    end
  end

  describe '#edit' do
    before do
      find_expectation

      get :edit, params: { id: 1234 }
    end

    context 'when found' do
      it 'is successful' 

    end

    context 'with help texts disallowed by the enterprise token' do
      let(:relation_columns_allowed) { false }

      it 'returns 404' 

    end

    context 'when not found' do
      let(:find_expectation) do
        allow(AttributeHelpText)
          .to receive(:find)
          .with(1234.to_s)
          .and_raise(ActiveRecord::RecordNotFound)
      end

      it 'returns 404' 

    end
  end

  describe '#update' do
    let(:call) do
      put :update,
          params: {
            id: 1234,
            attribute_help_text: {
              help_text: 'my new help text'
            }
          }
    end

    before do
      find_expectation
    end

    context 'when save is success' do
      before do
        expect(model).to receive(:save).and_return(true)

        call
      end

      it 'edits the announcement' 

    end

    context 'when save is failure' do
      before do
        expect(model).to receive(:save).and_return(false)

        call
      end

      it 'fails to update the announcement' 

    end

    context 'when not found' do
      let(:find_expectation) do
        allow(AttributeHelpText)
          .to receive(:find)
          .with(1234.to_s)
          .and_raise(ActiveRecord::RecordNotFound)
      end

      before do
        call
      end

      it 'returns 404' 

    end

    context 'with help texts disallowed by the enterprise token' do
      let(:relation_columns_allowed) { false }

      before do
        call
      end

      it 'returns 404' 

    end
  end
end

