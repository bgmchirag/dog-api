# frozen_string_literal: true

class Api::DogInformationProvider < Api::BaseHttpProvider


  def fetch_image(breed)
    response = api_get("api/breed/#{breed}/images/random")
    JSON.parse(response.body)
  rescue StandardError => e
    { status: 'error', message: e.message, code: 500 }
  end

  private

end
