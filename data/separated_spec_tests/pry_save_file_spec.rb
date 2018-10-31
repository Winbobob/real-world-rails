require_relative '../helper'

describe "save-file" do
  before do
    @tf = Tempfile.new(["pry", ".py"])
    @path = @tf.path
    @t = pry_tester
  end

  after do
    @tf.close(true)
  end

  describe "-f" do
    it 'should save a file to a file' 

  end

  describe "-i" do
    it 'should save input expressions to a file (single expression)' 


    it "should display a success message on save" 


    it 'should save input expressions to a file (range)' 


    it 'should save multi-ranged input expressions' 

  end

  describe "saving methods" do
    before do
      @o = Object.new
      def @o.baby
        :baby
      end
      def @o.bang
        :bang
      end

      @t = pry_tester(@o)
    end

    describe "single method" do
      it 'should save a method to a file' 


      it "should display a success message on save" 


      it 'should save a method to a file truncated by --lines' 

    end

    # TODO: do we want to reintroduce this spec??
    #
    # describe "multiple method" do
    #   it 'should save multiple methods to a file' do
    #     @t.eval "save-file #{@path} -m baby -m bang"

    #     File.read(@path).should == Pry::Method.from_obj(@o, :baby).source +
    #       Pry::Method.from_obj(@o, :bang).source
    #   end

    #   it 'should save multiple methods to a file trucated by --lines' do
    #     @t.eval "save-file #{@path} -m baby -m bang --lines 2..-2"

    #     # must add 1 as first line of method is 1
    #     File.read(@path).should == (Pry::Method.from_obj(@o, :baby).source +
    #       Pry::Method.from_obj(@o, :bang).source).lines.to_a[1..-2].join
    #   end

    #   it 'should save multiple methods to a file trucated by --lines 1 ' \
    #      '(single parameter, not range)' do
    #     @t.eval "save-file #{@path} -m baby -m bang --lines 1"

    #     # must add 1 as first line of method is 1
    #     File.read(@path).should == (Pry::Method.from_obj(@o, :baby).source +
    #       Pry::Method.from_obj(@o, :bang).source).lines.to_a[0]
    #   end
    # end
  end

  describe "overwrite by default (no --append)" do
    it 'should overwrite specified file with new input' 

  end

  describe "--append" do
    it 'should append to end of specified file' 

  end

  describe "saving commands" do
    it 'should save a command to a file', expect_failure: [:rbx] do
      @t.eval "save-file --to '#{@path}' show-source"
      cmd_source = Pry.config.commands["show-source"].source
      expect(File.read(@path)).to eq(cmd_source)
    end
  end

  # TODO: reintroduce these specs at some point?
  #
  # describe "combined options" do
  #   before do
  #     @o = Object.new
  #     def @o.baby
  #       :baby
  #     end

  #     @t = pry_tester(@o)
  #   end

  #   it 'should save input cache and a method to a file (in that order)' do
  #     @t.eval ":horse_nostrils"
  #     @t.eval "save-file -i 1 -m baby #{@path}"

  #     File.read(@path).should == ":horse_nostrils\n" +
  #       Pry::Method.from_obj(@o, :baby).source
  #   end

  #   it 'should select a portion to save using --lines' do
  #     @t.eval ":horse_nostrils"
  #     @t.eval "save-file -i 1 -m baby #{@path} --lines 2..-2"

  #     str = ":horse_nostrils\n" + Pry::Method.from_obj(@o, :baby).source
  #     File.read(@path).should == str.lines.to_a[1..-2].join
  #   end
  # end
end

