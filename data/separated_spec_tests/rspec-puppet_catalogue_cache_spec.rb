require 'spec_helper'

describe 'test::bare_class' do
  describe 'cache between adjacent examples' do
    catalogue_id = nil

    it 'records the initial catalogue ID' 


    it 'should contain the same catalogue ID' 

  end

  describe 'cache multiple catalogues' do
    catalogue_ids = {}

    (1..10).each do |i|
      context "iteration #{i}" do
        let(:facts) do
          { 'iteration' => i }
        end

        it 'records the initial catalogue ID' 

      end
    end

    (1..10).each do |i|
      context "iteration #{i}" do
        let(:facts) do
          { 'iteration' => i }
        end

        it 'should contain the same catalogue ID' 

      end
    end
  end

  describe 'limits number of cached catalogues' do
    catalogue_ids = {}

    (1..20).each do |i|
      context "iteration #{i}" do
        let(:facts) do
          { 'iteration' => i }
        end

        it 'records the initial catalogue ID' 

      end
    end

    (1..4).each do |i|
      context "iteration #{i}" do
        let(:facts) do
          { 'iteration' => i }
        end

        it 'should receive a new catalogue ID' 

      end
    end

    (9..20).each do |i|
      context "iteration #{i}" do
        let(:facts) do
          { 'iteration' => i }
        end

        it 'should contain the same catalogue ID' 

      end
    end
  end
end

