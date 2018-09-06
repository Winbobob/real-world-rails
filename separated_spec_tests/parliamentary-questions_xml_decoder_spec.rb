require 'spec_helper'

describe PQA::XMLDecoder do
  describe "#decode_questions" do
    let(:xml) {
      date      = DateTime.parse('28/02/2014')
      questions = 3.times.map { |n|
        PQA::QuestionBuilder.updated("q-#{n}", date + n.day)
      }
      PQA::XMLEncoder.encode_questions(questions)
    }

    let(:xml_no_question) {
      "<questions/>"
    }

    let(:questions) {
      PQA::XMLDecoder.decode_questions(xml)
    }

    context "when the supplied XML contains no <question> element" do
      it "returns an empty list" 

    end

    context "when the supplied XML contains some <question> elements" do
      it "parses questions with the correct uin values" 


      it "correctly parses dates" 

    end

    describe "#decode_answer_response" do
      let(:xml) {
        <<-EOS
        <?xml version="1.0" encoding="utf-8"?>
        <AnswerResponse xmlns="http://data.parliament.uk/QnA/2013/02">
          <AnswerPreviewUrl>https://wqa.parliament.uk/Questions/Details/33367</AnswerPreviewUrl>
        </AnswerResponse>
        EOS
      }

      describe "#response" do
        it "parses xml and returns an AnswerResponse instance" 

      end
    end
  end
end

