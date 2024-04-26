class Dog::CreateIntr < ActiveInteraction::Base
  string :breed, :image

  validates :breed, presence: true

  def execute
    dog = Dog.find_or_initialize_by(breed: inputs[:breed])
    dog.images.build(url: inputs[:image])

    unless dog.save
      errors.merge!(dog.errors)
    end

    dog
  end
end