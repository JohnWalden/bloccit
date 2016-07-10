require 'rails_helper'

RSpec.describe Add, type: :model do
  let (:add) {Add.create!}
  
  describe "attributes" do
      it "should respond to title" do
          expect(add).to respond_to(:title)
      end
      
      it "should respond to copy" do
          expect(add).to respond_to(:copy)
      end
      
      it "should repsond to price" do
          expect(add).to respond_to(:price)
      end
  end
end
