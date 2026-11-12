class CsrfTokensController < ApplicationController
  def show
    render json: { token: form_authenticity_token }
  end
end
