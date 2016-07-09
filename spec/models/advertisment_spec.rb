require 'rails_helper'

RSpec.describe Advertisment, type: :model do
    let (:advertisement) { Advertisment.create!}
    
    describe "attributes: do"
        it "Should repsond to title" do
            expect(advertisement).to respond_to(:title)
        end
        
        it "should respond to copy" do
            expect(advertisement).to respond_to(:copy)
        end
        
        it "should respond to price" do
            expect(advertisement).to respond_to(:price)
        end
    end
