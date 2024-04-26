require 'rails_helper'

RSpec.describe Dog::CreateIntr do
  describe '#execute' do
    let(:breed) { 'Test' }
    let(:image) { 'Image url' }
    subject(:create_dog) do
      described_class.run(
        breed: breed,
        image: image
      )
    end

    subject(:invalid_create_dog) do
      described_class.run(
        breed: nil,
        image: nil
      )
    end

    context 'with valid attributes' do
      it 'creates a new dog' do
        expect { create_dog }.to change(Dog, :count).by(1)
      end

      it 'returns a successful result' do
        expect(create_dog).to be_valid
      end

      it 'sets the breed attribute correctly' do
        expect(create_dog.breed).to eq(breed)
      end
    end

    context 'with invalid attributes' do
      it 'creates a new dog' do
        expect { invalid_create_dog }.to change(Dog, :count).by(0)
      end

      it 'returns a unsuccessful result' do
        expect(invalid_create_dog).to be_invalid
      end

      it 'sets the breed attribute nil' do
        expect(invalid_create_dog.breed).to eq(nil)
      end
    end

  end
end