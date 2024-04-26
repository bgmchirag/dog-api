require 'rails_helper'

RSpec.describe Dog, type: :model do
  subject {
    described_class.new(
      breed: "Anything"
    )
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a breed" do
    subject.breed = nil
    expect(subject).to_not be_valid
  end

  describe Dog do
    it "should have many images" do
      dog = Dog.reflect_on_association(:images)
      expect(dog.macro).to eq(:has_many)
    end
  end

end
