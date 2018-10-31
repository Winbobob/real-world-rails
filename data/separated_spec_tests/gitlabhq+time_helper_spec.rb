require 'spec_helper'

describe TimeHelper do
  describe "#time_interval_in_words" do
    it "returns minutes and seconds" 

  end

  describe "#duration_in_numbers" do
    using RSpec::Parameterized::TableSyntax

    where(:duration, :formatted_string) do
      0                              | "00:00"
      1.second                       | "00:01"
      42.seconds                     | "00:42"
      2.minutes + 1.second           | "02:01"
      3.hours + 2.minutes + 1.second | "03:02:01"
      30.hours                       | "30:00:00"
    end

    with_them do
      it { expect(duration_in_numbers(duration)).to eq formatted_string }
    end
  end
end

