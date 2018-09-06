require_relative '../helper'

describe "watch expression" do

  # Custom eval that will:
  # 1) Create an instance of pry that can use for multiple calls
  # 2) Exercise the after_eval hook
  # 3) Return the output
  def eval(expr)
    output = @tester.eval expr
    @tester.pry.hooks.exec_hook :after_eval, nil, @tester.pry
    output
  end

  before do
    @tester = pry_tester
    @tester.pry.hooks.clear_event_hooks(:after_eval)
    eval "watch --delete"
  end

  it "registers the after_eval hook" 


  it "prints no watched expressions" 


  it "watches an expression" 


  it "watches a local variable" 


  it "prints when an expression changes" 


  it "prints when an expression is mutated" 


  it "doesn't print when an expresison remains the same" 


  it "continues to work if you start a second pry instance" 


  describe "deleting expressions" do
    before do
      eval 'watch :keeper'
      eval 'watch :delete'
      eval 'watch -d 2'
    end

    it "keeps keeper" 


    it "deletes delete" 

  end
end

