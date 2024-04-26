class ApplicationController < ActionController::Base

  def handle_invalid_param_error(error)
    render(json: { data: { error: 'Invalid param given', exception: error.message } }, status: :unprocessable_entity)
  end

  def handle_not_found_error(error)
    logger.error(message: 'Page Not Found', exception: error)
    render json: { data: { error: 'Page not found' } }, status: :not_found
  end

  def handle_unprocessable_content_error(error)
    logger.error(message: 'Unprocessable Content', exception: error)
    render json: { data: { error: 'Page not found' } }, status: :unprocessable_entity
  end

  def standard_error_handler
    yield
    rescue NotFoundError => e
      handle_not_found_error(e)
    rescue UnprocessableContent => e
      handle_unprocessable_content_error(e)
    rescue HetznerApiProvider::ParamsError => e
      handle_invalid_param_error(e)
    rescue StandardError => e
      logger.error({ exception: e.class, error: e })
      render json: { data: { error: standard_error_message } }, status: :internal_server_error
  end

end
