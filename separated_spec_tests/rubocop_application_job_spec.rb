# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Rails::ApplicationJob do
  let(:msgs) { ['Jobs should subclass `ApplicationJob`.'] }

  context 'rails 4', :rails4, :config do
    subject(:cop) { described_class.new(config) }

    it 'allows ApplicationJob to be defined' 


    it 'allows jobs that subclass ActiveJob::Base' 


    it 'allows a single-line class definitions' 


    it 'allows namespaced jobs that subclass ActiveJob::Base' 


    it 'allows jobs defined using nested constants' 


    it 'allows jobs defined using Class.new' 


    it 'allows nested jobs defined using Class.new' 


    it 'allows anonymous jobs' 


    it 'allows ApplicationJob defined using Class.new' 

  end

  context 'rails 5', :rails5 do
    subject(:cop) { described_class.new }

    it 'allows ApplicationJob to be defined' 


    it 'corrects jobs that subclass ActiveJob::Base' 


    it 'corrects single-line class definitions' 


    it 'corrects namespaced jobs that subclass ActiveJob::Base' 


    it 'corrects jobs defined using nested constants' 


    it 'corrects jobs defined using Class.new' 


    it 'corrects nested jobs defined using Class.new' 


    it 'corrects anonymous jobs' 


    it 'allows ApplicationJob defined using Class.new' 

  end
end

