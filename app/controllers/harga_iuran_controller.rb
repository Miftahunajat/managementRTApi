class HargaIuranController < ActionController::API
  def index
    @harga_iuran = HargaIuran.all
    @harga_iuran = @harga_iuran.find_by(code: params['code']) unless params['code'].nil?
    render json: @harga_iuran
  end

  def update
    @harga_iuran = HargaIuran.find(params[:id])
    @harga_iuran.harga = params['harga'] if params['harga']
    if @harga_iuran.save
      render json: @harga_iuran
    else
      render json: {}, status: :not_found
    end
  end
end
