# encoding: utf-8
require_relative '../../../simplecov_helper'
require_relative '../../../../app/controllers/carto/api/presenter_cache'

class Carto::Api::FakeModel
  attr_reader :id

  def initialize(id = rand(100000))
    @id = id
  end
end

class Carto::Api::FakePresenter
  def initialize(model)
    @model = model
  end

  def to_poro
    { id: @model.id }
  end
end

describe Carto::Api::PresenterCache do

  describe '#get_poro' do

    let(:cache) { Carto::Api::PresenterCache.new }

    let(:fake_model) { Carto::Api::FakeModel.new }
    let(:fake_model_b) { Carto::Api::FakeModel.new }
    let(:fake_model_idless) { Carto::Api::FakeModel.new(nil) }

    let(:fake_presenter) { Carto::Api::FakePresenter.new(fake_model) }
    let(:fake_presenter_b) { Carto::Api::FakePresenter.new(fake_model_b) }

    it 'throws an error if no block is provided' 


    it 'returns block presenter.to_poro for non-cached models' 


    it 'returns cached presenter.to_poro for cached classes and ids' 


    it 'raises error with nil models' 


    it 'does not cache if model.id is nil' 


    it 'raises error for nil presenters' 


    it 'does not raise error for nil presenter if it was cached' 


  end

end

