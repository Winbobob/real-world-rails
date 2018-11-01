require_relative '../helper'

describe "whereami" do
  it 'should work with methods that have been undefined' 


  it 'should work in objects with no method methods' 


  it 'should properly set _file_, _line_ and _dir_' 


  if RUBY_VERSION > "2.0.0"
    it 'should work with prepended methods' 

  end

  it 'should work in BasicObjects' 


  it 'should show description and correct code when __LINE__ and __FILE__ are outside @method.source_location' 


  it 'should show description and correct code when @method.source_location would raise an error' 


  # Now that we use stagger_output (paging output) we no longer get
  # the "From: " line, as we output everything in one go (not separate output.puts)
  # and so the user just gets a single `Error: Cannot open
  # "not.found.file.erb" for reading.`
  # which is good enough IMO. Unfortunately we can't test for it
  # though, as we don't hook stdout.
  #
  # it 'should display a description and error if reading the file goes wrong' do
  #   class Cor
  #     def blimey!
  #       eval <<-END, binding, "not.found.file.erb", 7
  #         Pad.tester = pry_tester(binding)
  #         Pad.tester.eval('whereami')
  #       END
  #     end
  #   end

  #   proc { Cor.new.blimey! }.should.raise(MethodSource::SourceNotFoundError)

  #   Pad.tester.last_output.should =~
  #     /From: not.found.file.erb @ line 7 Cor#blimey!:/
  #   Object.remove_const(:Cor)
  # end

  it 'should show code window (not just method source) if parameter passed to whereami' 


  it 'should show entire method when -m option used' 


  it 'should show entire file when -f option used' 


  describe "-c" do
    it 'should show class when -c option used, and locate correct candidate' 


    it 'should show class when -c option used, and locate correct superclass' 


    it 'should show class when -c option used, and binding is outside a method' 

  end

  it 'should not show line numbers or marker when -n switch is used' 


  it 'should use Pry.config.default_window_size for window size when outside a method context' 


  it "should work at the top level" 


  it "should work inside a class" 


  it "should work inside an object" 


end

