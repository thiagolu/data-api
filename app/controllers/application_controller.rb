class ApplicationController < ActionController::API
  before_action :validate_api_request

  API_TOKEN = '123qwe'

  def import
    render status: 200, json: { it_works: params[:file].read }
  end
  
  
  def status
    render status: 200, json: { it_works: 'works' }
  end
  
  private

  def validate_api_request
    return render status: 500 unless API_TOKEN == request.headers['Authorization']
  end
end
