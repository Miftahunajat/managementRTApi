class TestController < ActionController::API
  def index
    obj = { success: true, message: 'Tembak Berhasil' }
    render json: obj
  end
end
