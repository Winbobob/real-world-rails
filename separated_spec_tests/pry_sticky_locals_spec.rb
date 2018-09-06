require_relative 'helper'

describe "Sticky locals (_file_ and friends)" do
  it 'locals should all exist upon initialization' 


  it 'locals should still exist after cd-ing into a new context' 


  it 'locals should keep value after cd-ing (_pry_)' 


  describe '_ex_' do
    it 'returns the last exception without wrapping it in a LastException' 


    it 'keeps its value after cd-ing' 

  end

  it 'locals should keep value after cd-ing (_file_ and _dir_)' 


  it 'locals should return last result (_)' 


  it 'locals should return second last result (__)' 


  describe "User defined sticky locals" do
    describe "setting as Pry.config option" do
      it 'should define a new sticky local for the session (normal value)' 


      it 'should define a new sticky local for the session (proc)' 


    end

    describe "passing in as hash option when creating pry instance" do
      it 'should define a new sticky local for the session (normal value)' 


      it 'should define multiple sticky locals' 



      it 'should define a new sticky local for the session (as Proc)' 

    end

    describe "hash option value should override config value" do
      it 'should define a new sticky local for the session (normal value)' 

    end

    it 'should create a new sticky local' 


    it 'should still exist after cd-ing into new binding' 


    it 'should provide different values for successive block invocations' 

  end

end

