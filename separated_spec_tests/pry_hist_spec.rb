require_relative '../helper'

describe "hist" do
  before do
    Pry.history.clear
    @hist = Pry.history

    @str_output = StringIO.new
    @t = pry_tester :history => @hist do
      # For looking at what hist pushes into the input stack. The implementation
      # of this helper will definitely have to change at some point.
      def next_input
        @pry.input.string
      end
    end
  end

  it 'should replay history correctly (single item)' 


  it 'should replay a range of history correctly (range of items)' 


  # this is to prevent a regression where input redirection is
  # replaced by just appending to `eval_string`
  it 'should replay a range of history correctly (range of commands)' 


  it 'should grep for correct lines in history' 


  it 'should return last N lines in history with --tail switch' 


  it "should start from beginning if tail number is longer than history" 


  it 'should apply --tail after --grep' 


  it 'should apply --head after --grep' 


  # strangeness in this test is due to bug in Readline::HISTORY not
  # always registering first line of input
  it 'should return first N lines in history with --head switch' 


  # strangeness in this test is due to bug in Readline::HISTORY not
  # always registering first line of input
  it 'should show lines between lines A and B with the --show switch' 


  it "should store a call with `--replay` flag" 


  it "should not contain lines produced by `--replay` flag" 


  it "should raise CommandError when index of `--replay` points out to another `hist --replay`" 


  it "should disallow execution of `--replay <i>` when CommandError raised" 


  it "excludes Pry commands from the history with `-e` switch" 


  describe "sessions" do
    before do
      @old_file = Pry.config.history.file
      Pry.config.history.file = File.expand_path('spec/fixtures/pry_history')
      @hist.load
    end

    after do
      Pry.config.history.file = @old_file
    end

    it "displays history only for current session" 


    it "displays all history (including the current sesion) with `--all` switch" 


    it "should not display histignore words in history" 

  end
end

