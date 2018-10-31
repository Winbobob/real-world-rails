# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Rails::ApplicationRecord do
  let(:msgs) { ['Models should subclass `ApplicationRecord`.'] }

  context 'rails 4', :rails4, :config do
    subject(:cop) { described_class.new(config) }

    it 'allows ApplicationRecord to be defined' 


    it 'allows models that subclass ActiveRecord::Base' 


    it 'allows a single-line class definitions' 


    it 'allows namespaced models that subclass ActiveRecord::Base' 


    it 'allows models defined using nested constants' 


    it 'allows models defined using Class.new' 


    it 'allows nested models defined using Class.new' 


    it 'allows anonymous models' 


    it 'allows ApplicationRecord defined using Class.new' 

  end

  context 'rails 5', :rails5 do
    subject(:cop) { described_class.new }

    it 'allows ApplicationRecord to be defined' 


    it 'corrects models that subclass ActiveRecord::Base' 


    it 'corrects single-line class definitions' 


    it 'corrects namespaced models that subclass ActiveRecord::Base' 


    it 'corrects models defined using nested constants' 


    it 'corrects models defined using Class.new' 


    it 'corrects nested models defined using Class.new' 


    it 'corrects anonymous models' 


    it 'allows ApplicationRecord defined using Class.new' 

  end
end

