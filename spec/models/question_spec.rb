require 'rails_helper'

RSpec.describe Question, type: :model do
  context "attribute" do
      let(:question) { Question.new(title: "New Question Title", body: "New Questionbody", resolved: false) }
          
          it "should respond to tittle" do
            expect(question).to respond_to(:title)
          end
          
          it "should respond to body" do
            expect(question).to respond_to(:body)
          end
          
          it "should respond to resolved"
            expect(question).to respond_to(:body)
          end
      end
