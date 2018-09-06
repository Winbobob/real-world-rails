# frozen_string_literal: true

if defined?(Encoding) && Encoding.default_external.name != "UTF-8"
  # An approximation of ruby -E UTF-8, since it works on 1.8.7
  Encoding.default_external = Encoding.find("UTF-8")
end

RSpec.describe "The library itself" do
  def check_for_debugging_mechanisms(filename)
    debugging_mechanisms_regex = /
      (binding\.pry)|
      (debugger)|
      (sleep\s*\(?\d+)|
      (fit\s*\(?("|\w))
    /x

    failing_lines = []
    File.readlines(filename).each_with_index do |line, number|
      if line =~ debugging_mechanisms_regex && !line.end_with?("# ignore quality_spec\n")
        failing_lines << number + 1
      end
    end

    return if failing_lines.empty?
    "#{filename} has debugging mechanisms (like binding.pry, sleep, debugger, rspec focusing, etc.) on lines #{failing_lines.join(", ")}"
  end

  def check_for_git_merge_conflicts(filename)
    merge_conflicts_regex = /
      <<<<<<<|
      =======|
      >>>>>>>
    /x

    failing_lines = []
    File.readlines(filename).each_with_index do |line, number|
      failing_lines << number + 1 if line =~ merge_conflicts_regex
    end

    return if failing_lines.empty?
    "#{filename} has unresolved git merge conflicts on lines #{failing_lines.join(", ")}"
  end

  def check_for_tab_characters(filename)
    failing_lines = []
    File.readlines(filename).each_with_index do |line, number|
      failing_lines << number + 1 if line =~ /\t/
    end

    return if failing_lines.empty?
    "#{filename} has tab characters on lines #{failing_lines.join(", ")}"
  end

  def check_for_extra_spaces(filename)
    failing_lines = []
    File.readlines(filename).each_with_index do |line, number|
      next if line =~ /^\s+#.*\s+\n$/
      next if %w[LICENCE.md].include?(line)
      failing_lines << number + 1 if line =~ /\s+\n$/
    end

    return if failing_lines.empty?
    "#{filename} has spaces on the EOL on lines #{failing_lines.join(", ")}"
  end

  def check_for_expendable_words(filename)
    failing_line_message = []
    useless_words = %w[
      actually
      basically
      clearly
      just
      obviously
      really
      simply
    ]
    pattern = /\b#{Regexp.union(useless_words)}\b/i

    File.readlines(filename).each_with_index do |line, number|
      next unless word_found = pattern.match(line)
      failing_line_message << "#{filename}:#{number.succ} has '#{word_found}'. Avoid using these kinds of weak modifiers."
    end

    failing_line_message unless failing_line_message.empty?
  end

  def check_for_specific_pronouns(filename)
    failing_line_message = []
    specific_pronouns = /\b(he|she|his|hers|him|her|himself|herself)\b/i

    File.readlines(filename).each_with_index do |line, number|
      next unless word_found = specific_pronouns.match(line)
      failing_line_message << "#{filename}:#{number.succ} has '#{word_found}'. Use more generic pronouns in documentation."
    end

    failing_line_message unless failing_line_message.empty?
  end

  RSpec::Matchers.define :be_well_formed do
    match(&:empty?)

    failure_message do |actual|
      actual.join("\n")
    end
  end

  it "has no malformed whitespace" 


  it "does not include any leftover debugging or development mechanisms" 


  it "does not include any unresolved merge conflicts" 


  it "maintains language quality of the documentation" 


  it "maintains language quality of sentences used in source code" 


  it "documents all used settings" 


  it "can still be built" 


  it "does not contain any warnings" 

end

