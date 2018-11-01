# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Rails::HttpPositionalArguments do
  context 'rails 4', :rails4, :config do
    subject(:cop) { described_class.new(config) }

    it 'does not register an offense for get method' 


    it 'does not register an offense for post method' 


    it 'does not register an offense for patch method' 


    it 'does not register an offense for put method' 


    it 'does not register an offense for delete method' 


    it 'does not register an offense for head method' 


    it 'does not register an offense for process method' 


    [
      'params: { user_id: @user.id }',
      'xhr: true',
      'session: { foo: \'bar\' }',
      'format: :json'
    ].each do |keyword_args|
      describe "when using keyword args #{keyword_args}" do
        let(:source) do
          "get :new, #{keyword_args}"
        end

        it 'does not register an offense' 

      end
    end

    describe '.get' do
      it 'does not register an offense' 


      describe 'no params' do
        it 'does not register an offense' 

      end
    end

    describe '.patch' do
      it 'does not register an offense' 

    end

    describe '.post' do
      it 'does not register an offense' 

    end

    %w[get post patch put head delete].each do |keyword|
      it 'does not register an offense when keyword is used ' \
        'in a chained method call' do
        expect_no_offenses("@user.#{keyword}.id = ''")
      end
    end
  end

  context 'rails 5 and above', :rails5 do
    subject(:cop) { described_class.new }

    it 'registers an offense for get method' 


    it 'registers an offense for post method' 


    it 'registers an offense for patch method' 


    it 'registers an offense for put method' 


    it 'registers an offense for delete method' 


    it 'registers an offense for head method' 


    it 'accepts non HTTP methods' 


    describe 'when using process' do
      it 'does not register an offense' 

    end

    [
      'method: :get',
      'params: { user_id: @user.id }',
      'xhr: true',
      'session: { foo: \'bar\' }',
      'format: :json',
      'headers: {}',
      'body: "foo"',
      'flash: {}',
      'as: :json',
      'env: "test"'
    ].each do |keyword_args|
      describe "when using keyword args #{keyword_args}" do
        it 'does not register an offense' 

      end
    end

    describe '.get' do
      it 'registers an offense' 


      it 'autocorrects offense' 


      describe 'no params' do
        it 'does not register an offense' 

      end
    end

    describe '.patch' do
      it 'autocorrects offense' 

    end

    describe '.post' do
      it 'autocorrects offense' 

    end

    %w[head post get patch put delete].each do |keyword|
      it 'does not register an offense when keyword' 

    end

    it 'auto-corrects http action when method' 


    it 'auto-corrects http action when symbol' 


    it 'maintains parentheses when auto-correcting' 


    it 'maintains quotes when auto-correcting' 


    it 'does add session keyword when session is used' 


    it 'does not duplicate brackets when hash is already supplied' 


    it 'auto-corrects http action when params is a method call' 


    it 'auto-corrects http action when parameter matches ' \
      'special keyword name' do
      new_source = autocorrect_source(<<-RUBY)
        post :create, id: 7, comment: { body: "hei" }
      RUBY

      expect(new_source).to eq(<<-RUBY)
        post :create, params: { id: 7, comment: { body: "hei" } }
      RUBY
    end

    it 'auto-corrects http action when format keyword included but not alone' 


    it 'auto-corrects http action when params is a lvar' 


    it 'auto-corrects http action when params and action name ' \
      'are method calls' do
      new_source = autocorrect_source('post user_attrs, params')
      expect(new_source).to eq('post user_attrs, params: params')
    end

    it 'auto-corrects http action when params is a method call with chain' 

  end
end

