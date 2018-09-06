require 'rails_helper'

RSpec.describe Visit::IntegrityChecker do
  before do
    class VisitTestController
      include Visit::IntegrityChecker

      def visit
        Visit.new(visit_id: 12345,
                  prisoner: Prisoner.new(
                    prison_name: 'Rochester',
                    number: 1234))
      end

      def flash
        {}
      end

      def redirect_to(_)
      end

      def edit_prisoner_details_path
      end
    end
  end

  subject { VisitTestController.new }

  context 'checking' do
    describe '#ensure_visit_integrity' do
      context 'fails' do
        before do
          allow(subject).to receive(:required_information?).
            and_return(false)
        end

        it 'generates an alert' 


        it 'redirects' 

      end
    end
  end

  describe '#required_information?' do
    context 'returns false when a visit' do
      it 'is missing a prisoner' 


      it 'has a prisoner without a prison name' 

    end
  end

  context 'logging' do
    describe '#log_any_missing_information' do
      it 'gets called by #ensure_visit_integrity' 


      context 'logs visits' do
        it 'that are missing a prisoner' 


        it 'that have a prisoner without a prison name' 


        it 'that are missing a prison' 


        it 'that have a prisoner with a missing prisoner number' 


        it 'that have a prison with no slots' 

      end
    end
  end
end

