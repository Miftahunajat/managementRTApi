class TahunController < ActionController::API
  def index
    @tahun = Tahun.all
    render json: {items: @tahun}
  end
end
