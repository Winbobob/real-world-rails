module Concurrent
  module Concern

    RSpec.describe Observable do

      let (:described_class) do
        Class.new do
          include Observable
          public :observers, :observers=
        end
      end

      let(:observer_set) { double(:observer_set) }
      subject { described_class.new }

      before(:each) do
        subject.observers = observer_set
      end

      it 'does not initialize set by by default' 


      it 'uses the given observer set' 


      it 'delegates #add_observer' 


      it 'delegates #with_observer' 


      it 'delegates #delete_observer' 


      it 'delegates #delete_observers' 


      it 'delegates #count_observers' 

    end
  end
end

