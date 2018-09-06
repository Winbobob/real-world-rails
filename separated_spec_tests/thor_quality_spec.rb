describe "The library itself" do
  def check_for_spec_defs_with_single_quotes(filename)
    failing_lines = []

    File.readlines(filename).each_with_index do |line, number|
      failing_lines << number + 1 if line =~ /^ *(describe|it|context) {1}'{1}/
    end

    "#{filename} uses inconsistent single quotes on lines #{failing_lines.join(', ')}" unless failing_lines.empty?
  end

  def check_for_tab_characters(filename)
    failing_lines = []
    File.readlines(filename).each_with_index do |line, number|
      failing_lines << number + 1 if line =~ /\t/
    end

    "#{filename} has tab characters on lines #{failing_lines.join(', ')}" unless failing_lines.empty?
  end

  def check_for_extra_spaces(filename)
    failing_lines = []
    File.readlines(filename).each_with_index do |line, number|
      next if line =~ /^\s+#.*\s+\n$/
      failing_lines << number + 1 if line =~ /\s+\n$/
    end

    "#{filename} has spaces on the EOL on lines #{failing_lines.join(', ')}" unless failing_lines.empty?
  end

  RSpec::Matchers.define :be_well_formed do
    failure_message do |actual|
      actual.join("\n")
    end

    match(&:empty?)
  end

  it "has no malformed whitespace" 


  it "uses double-quotes consistently in specs" 

end

