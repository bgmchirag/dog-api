require 'rails_helper'

RSpec.describe Image, type: :model do

  before(:each) do
    @dog = FactoryBot.create(:dog)
  end
    
  subject {
    described_class.new(
      url: "Anything",
      dog_id: @dog.id
    )
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a url" do
    subject.url = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a dog" do
    subject.dog_id = nil
    expect(subject).to_not be_valid
  end

  describe Dog do
    it "should have many images" do
      dog = Dog.reflect_on_association(:images)
      expect(dog.macro).to eq(:has_many)
    end
  end

end
