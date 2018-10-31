require 'spec_helper'

describe ControllerWithCrossProjectAccessCheck do
  let(:user) { create(:user) }

  before do
    sign_in user
  end

  render_views

  context 'When reading cross project is not allowed' do
    before do
      allow(Ability).to receive(:allowed).and_call_original
      allow(Ability).to receive(:allowed?)
                          .with(user, :read_cross_project, :global)
                          .and_return(false)
    end

    describe '#requires_cross_project_access' do
      controller(ApplicationController) do
        # `described_class` is not available in this context
        include ControllerWithCrossProjectAccessCheck # rubocop:disable RSpec/DescribedClass

        requires_cross_project_access :index, show: false,
                                              unless: -> { unless_condition },
                                              if: -> { if_condition }

        def index
          render nothing: true
        end

        def show
          render nothing: true
        end

        def unless_condition
          false
        end

        def if_condition
          true
        end
      end

      it 'renders a 403 with trying to access a cross project page' 


      it 'is skipped when the `if` condition returns false' 


      it 'is skipped when the `unless` condition returns true' 


      it 'correctly renders an action that does not require cross project access' 

    end

    describe '#skip_cross_project_access_check' do
      controller(ApplicationController) do
        # `described_class` is not available in this context
        include ControllerWithCrossProjectAccessCheck # rubocop:disable RSpec/DescribedClass

        requires_cross_project_access

        skip_cross_project_access_check index: true, show: false,
                                        unless: -> { unless_condition },
                                        if: -> { if_condition }

        def index
          render nothing: true
        end

        def show
          render nothing: true
        end

        def edit
          render nothing: true
        end

        def unless_condition
          false
        end

        def if_condition
          true
        end
      end

      it 'renders a success when the check is skipped' 


      it 'is executed when the `if` condition returns false' 


      it 'is executed when the `unless` condition returns true' 


      it 'does not skip the check on an action that is not skipped' 


      it 'does not skip the check on an action that was not defined to skip' 

    end
  end
end

