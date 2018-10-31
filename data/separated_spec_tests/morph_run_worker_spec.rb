require 'spec_helper'

describe RunWorker do
  it 'should call the runner' 


  it 'should do nothing if the run does not exist anymore' 


  context do
    before :each do
      Morph::DockerUtils.find_all_containers_with_label_and_value(Morph::Runner.run_label_key, '123456').each do |c|
        c.delete
      end
    end
    after :each do
      Morph::DockerUtils.find_all_containers_with_label_and_value(Morph::Runner.run_label_key, '123456').each do |c|
        c.delete
      end
    end

    it 'should raise an exception if we already have the maximum number of running containers' 


    it 'should not raise an exception if we are finishing off an already running container', docker: true do
      run = Run.create!(id: 123456)
      expect(Morph::Runner).to receive(:available_slots).and_return(0)
      container = Docker::Container.create(
        'Cmd' => ['ls'],
        'Image' => 'openaustralia/buildstep',
        'Labels' => {Morph::Runner.run_label_key => '123456'}
      )
      expect{RunWorker.new.perform(run.id)}.not_to raise_error
    end
  end
end

