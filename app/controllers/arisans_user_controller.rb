class ArisansUserController < ActionController::API

  def index
    @arisans_user = ArisansUser.find_by(user_id: params[:user_id], arisan_id: params[:arisan_id])
    render json: @arisans_user, include: [:user, :arisan]
  end

  def update_arisan
    arisan_user = ArisansUser.find(params[:arisans_user_id])
    tahun = params['tahun']
    bulan = Bulan.find_by(nama_bulan: params['bulan'])

    user_bayar_arisan = UserBayarArisan.find_by(
      arisans_user: arisan_user,
      tahun: tahun,
      bulan: bulan
    )
    if user_bayar_arisan.nil?
      render json: {}, status: :not_found
    else
      user_bayar_arisan.update(bayar: params['bayar'])
      render json: user_bayar_arisan
    end
  end
end
