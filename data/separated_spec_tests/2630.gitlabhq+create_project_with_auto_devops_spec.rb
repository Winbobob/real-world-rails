# frozen_string_literal: true

require 'pathname'

module QA
  context 'Configure', :orchestrated, :kubernetes do
    describe 'Auto DevOps support' do
      after do
        @cluster&.remove!
      end

      [true, false].each do |rbac|
        context "when rbac is #{rbac ? 'enabled' : 'disabled'}" do
          it 'user creates a new project and runs auto devops' 

        end
      end
    end
  end
end

