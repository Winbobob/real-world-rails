require 'spec_helper'

describe Less::Parser do

  cwd = Pathname(__FILE__).dirname

  it "instantiates" 


  describe "simple usage" do
    it "parse less into a tree" 


    it "accepts options when assembling the parse tree" 

  end

  it "throws a ParseError if the lesscss is bogus" 


  it "passes exceptions from the less compiler" 


  describe "when configured with source mapping" do
    subject { Less::Parser.new(:filename => 'one.less', :paths => [ cwd.join('one'), cwd.join('two') ], :dumpLineNumbers => 'mediaquery') }

    it "prints source maps" 


  end

  describe "when configured with multiple load paths" do
    subject { Less::Parser.new :paths => [ cwd.join('one'), cwd.join('two'), cwd.join('faulty') ] }

    it "will load files from both paths" 


    it "passes exceptions from less imported less files" 


    it "will track imported files" 


    it "reports type, line, column and filename of (parse) error" 


  end

  describe "when load paths are specified in as default options" do
    before do
      Less.paths << cwd.join('one')
      Less.paths << cwd.join('two')
      @parser = Less::Parser.new
    end
    after do
      Less.paths.clear
    end

    it "will load files from default load paths" 

  end

  describe "relative urls" do

    it "keeps relative imports when true" 


    it "does not keep relative imports when false" 


  end

  # NOTE: runs JS tests from less.js it's a replacement for less-test.js
  describe "less-test", :integration => true do

    TEST_LESS_DIR = File.expand_path('../../lib/less/js/test/less', File.dirname(__FILE__))
    TEST_CSS_DIR =  File.expand_path('../../lib/less/js/test/css' , File.dirname(__FILE__))

    before :all do
      # functions.less test expects these exposed :
      Less.tree.functions[:add] = lambda do |*args| # function (a, b)
        a, b = args[-2], args[-1]
        Less.tree['Dimension'].new(a['value'] + b['value'])
        # return new(less.tree.Dimension)(a.value + b.value);
      end
      Less.tree.functions[:increment] = lambda do |*args| # function (a)
        a = args[-1]
        Less.tree['Dimension'].new(a['value'] + 1)
        # return new(less.tree.Dimension)(a.value + 1);
      end
      Less.tree.functions[:_color] = lambda do |*args| # function (str)
        str = args[-1]
        if str.value == 'evil red'
        # if (str.value === "evil red")
          Less.tree['Color'].new('600')
          # return new(less.tree.Color)("600")
        end
      end
    end

    after :all do
      Less.tree.functions[:add] = nil
      Less.tree.functions[:increment] = nil
      Less.tree.functions[:_color] = nil
    end

    Dir.glob(File.join(TEST_LESS_DIR, '*.less')).each do |less_file|

      base_name = File.basename(less_file, '.less')
      css_file = File.join(TEST_CSS_DIR, "#{base_name}.css")
      raise "missing css file: #{css_file}" unless File.exists?(css_file)

      less_content = File.read(less_file)
      case base_name
        when 'javascript'
          # adjust less .eval line :
          #   title: `process.title`;
          # later replaced by line :
          #   title: `typeof process.title`;
          # with something that won't fail (since we're not in Node.JS)
          less_content.sub!('process.title', '"node"')
      end

      it "#{base_name}.less" 


    end

  end

end

