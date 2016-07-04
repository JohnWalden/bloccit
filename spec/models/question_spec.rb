require 'rails_helper'

RSpec.describe Question, type: :model do
  let(:question) {Question.create!(title: "New Post Title", body: "New Post Body", resoved: false) }
  describe "attributes" do
      it "has title and body attributes, and is not resolved" do
          expect(question).to have_attributes(title: "New Post Title", body: "New Post Body", resoved: false)
      end
  end
end
