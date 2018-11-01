require "rails_helper"

RSpec.describe YoutubeTag, type: :liquid_template do
  describe "#id" do
    let(:valid_id_no_time) { "dQw4w9WgXcQ" }

    let(:valid_ids_with_time) do
      %w(
        QASbw8_0meM?t=8h12m26s
        QASbw8_0meM?t=6h34m
        QASbw8_0meM?t=7h
        QASbw8_0meM?t=1h57s
        dQw4w9WgXcQ?t=4m45s
        dQw4w9WgXcQ?t=5m
        dQw4w9WgXcQ?t=8s
      )
    end

    let(:invalid_id) { Faker::Lorem.characters(rand(12..100)) }

    def parsed_id(id)
      return id unless id.include?("?t=")
      id_array = id.split("?t=")
      time_hash = {
        h: id_array[1].scan(/\d+h/)[0]&.delete("h").to_i,
        m: id_array[1].scan(/\d+m/)[0]&.delete("m").to_i,
        s: id_array[1].scan(/\d+s/)[0]&.delete("s").to_i
      }
      time_string = ((time_hash[:h] * 3600) + (time_hash[:m] * 60) + time_hash[:s]).to_s
      "#{id_array[0]}?start=#{time_string}"
    end

    def generate_new_liquid(id)
      Liquid::Template.register_tag("youtube", YoutubeTag)
      Liquid::Template.parse("{% youtube #{id} %}")
    end

    def generate_iframe(id)
      "<iframe "\
        "width=\"710\" "\
        "height=\"399\" "\
        "src=\"https://www.youtube.com/embed/#{parsed_id(id)}\" "\
        "allowfullscreen> "\
      "</iframe>"
    end

    it "accepts a valid YouTube ID with no starting time" 


    it "accepts valid YouTube IDs with starting times" 


    it "accepts YouTube ID with no start time and an empty space" 


    it "accepts YouTube IDs with start times and one empty space" 


    it "raises an error for invalid IDs" 

  end
end

