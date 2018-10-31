require 'spec_helper'

describe FinderWithCrossProjectAccess do
  let(:finder_class) do
    Class.new do
      prepend FinderWithCrossProjectAccess
      include FinderMethods

      requires_cross_project_access if: -> { requires_access? }

      attr_reader :current_user

      def initialize(user)
        @current_user = user
      end

      def execute
        Issue.all
      end
    end
  end

  let(:user) { create(:user) }
  subject(:finder) { finder_class.new(user) }
  let!(:result) { create(:issue) }

  before do
    result.project.add_maintainer(user)
  end

  def expect_access_check_on_result
    expect(finder).not_to receive(:requires_access?)
    expect(Ability).to receive(:allowed?).with(user, :read_issue, result).and_call_original
  end

  context 'when the user cannot read cross project' do
    before do
      allow(Ability).to receive(:allowed?).and_call_original
      allow(Ability).to receive(:allowed?).with(user, :read_cross_project)
                          .and_return(false)
    end

    describe '#execute' do
      it 'returns a issue if the check is disabled' 


      it 'returns an empty relation when the check is enabled' 


      it 'only queries once when check is enabled' 


      it 'only queries once when check is disabled' 

    end

    describe '#find' do
      it 'checks the accessibility of the subject directly' 


      it 'returns the issue' 

    end

    describe '#find_by' do
      it 'checks the accessibility of the subject directly' 

    end

    describe '#find_by!' do
      it 'checks the accessibility of the subject directly' 


      it 're-enables the check after the find failed' 

    end
  end

  context 'when the user can read cross project' do
    before do
      allow(Ability).to receive(:allowed?).and_call_original
      allow(Ability).to receive(:allowed?).with(user, :read_cross_project)
                          .and_return(true)
    end

    it 'returns the result' 

  end
end

