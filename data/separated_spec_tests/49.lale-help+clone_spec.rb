require 'rails_helper'


describe Task::Clone do

  let(:task) { create(:task, :with_location) }

  def cloned_task
    Task::Clone.run(task: task).result
  end

  describe '#run' do

    context "task has attributes" do

      def cloned_attribute_keys
        Task.new.attributes.reject do |key, _|
          %w(id created_at updated_at completed_at).include?(key)
        end.keys
      end

      it "copies the attributes" 

    end

    context "task has primary location" do

      it "copies the location" 


      it "is readonly" 

    end

  end
end

