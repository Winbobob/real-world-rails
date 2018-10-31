require 'spec_helper'

describe Gitlab::Popen::Runner do
  subject { described_class.new }

  describe '#run' do
    it 'runs the command and returns the result' 

  end

  describe '#all_success_and_clean?' do
    it 'returns true when exit status is 0 and stderr is empty' 


    it 'returns false when exit status is not 0' 


    it 'returns false when exit stderr has something' 

  end

  describe '#all_success?' do
    it 'returns true when exit status is 0' 


    it 'returns false when exit status is not 0' 


    it 'returns true' 

  end

  describe '#all_stderr_empty?' do
    it 'returns true when stderr is empty' 


    it 'returns true when exit status is not 0' 


    it 'returns false when exit stderr has something' 

  end

  describe '#failed_results' do
    it 'returns [] when everything is passed' 


    it 'returns the result when exit status is not 0' 


    it 'returns [] when exit stderr has something' 

  end

  describe '#warned_results' do
    it 'returns [] when everything is passed' 


    it 'returns [] when exit status is not 0' 


    it 'returns the result when exit stderr has something' 

  end

  def run_command(
    command: 'command',
    stdout: 'stdout',
    stderr: '',
    exitstatus: 0,
    status: double(exitstatus: exitstatus, success?: exitstatus.zero?),
    duration: 0.1)

    result =
      Gitlab::Popen::Result.new(command, stdout, stderr, status, duration)

    allow(Gitlab::Popen)
      .to receive(:popen_with_detail)
      .and_return(result)

    subject.run([command]) do |cmd, &run|
      expect(cmd).to eq(command)

      cmd_result = run.call

      expect(cmd_result).to eq(result)
    end

    subject.results.first
  end
end

