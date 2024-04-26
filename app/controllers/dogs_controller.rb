class DogsController < ApplicationController
 
  before_action :set_breed, only: :create

  def create
    status, response, code = Api::V1::Dog::HttpRequest.new(@breed).fetch_image
    render :new, status: :ok, locals: { response: response, breed: @breed, status: status, code: code }
  end

  private
  
  def set_breed
    @breed = params[:dog][:breed] || 'hound'
  end  
  
end
