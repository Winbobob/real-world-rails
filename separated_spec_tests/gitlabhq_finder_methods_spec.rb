require 'spec_helper'

describe FinderMethods do
  let(:finder_class) do
    Class.new do
      include FinderMethods

      attr_reader :current_user

      def initialize(user)
        @current_user = user
      end

      def execute
        Project.all
      end
    end
  end

  let(:user) { create(:user) }
  let(:finder) { finder_class.new(user) }
  let(:authorized_project) { create(:project) }
  let(:unauthorized_project) { create(:project) }

  before do
    authorized_project.add_developer(user)
  end

  describe '#find_by!' do
    it 'returns the project if the user has access' 


    it 'raises not found when the project is not found' 


    it 'raises not found the user does not have access' 

  end

  describe '#find' do
    it 'returns the project if the user has access' 


    it 'raises not found when the project is not found' 


    it 'raises not found the user does not have access' 

  end

  describe '#find_by' do
    it 'returns the project if the user has access' 


    it 'returns nil when the project is not found' 


    it 'returns nil when the user does not have access' 

  end
end

