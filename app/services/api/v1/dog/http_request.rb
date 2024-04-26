module Api
  module V1
    module Dog
      class HttpRequest
        def initialize(breed)
          @base_url = 'https://dog.ceo/api'
          @breed = breed.downcase
        end

        def fetch_image
          url = "#{@base_url}/breed/#{@breed}/images/random"
          response = Api::DogInformationProvider.new('https://dog.ceo').fetch_image(@breed);
          ::Dog::CreateIntr.run!(breed: @breed, image: response['message']) if response['status'] == 'success'
          return [ response['status'], response['message'], response['code']]
        end

      end
    end    
  end
end