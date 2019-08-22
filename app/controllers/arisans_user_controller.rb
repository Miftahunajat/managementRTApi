class ArisansUserController < ActionController::API

  def index
    @arisans_user = ArisansUser.find_by(user_id: params[:user_id], arisan_id: params[:arisan_id])
    render json: @arisans_user, include: [:user, :arisan]
  end

  def ikut_arisan
    arisan_user = ArisansUser.find(params[:arisans_user_id])
    arisan_user.ikut = true
    if arisan_user.save!
      create_user_bayar_arisan_for_each_month(arisan_user, arisan_user.arisan)
      render json: arisan_user, include: :user_bayar_arisans
    else
      render json: {}, status: :not_found
    end
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

  def create_user_bayar_arisan_for_each_month(arisan_user, arisan)
    mulai = arisan.mulai
    selesai = arisan.selesai
    bln = Bulan.find(mulai.month)
    UserBayarArisan.where(
      arisans_user: arisan_user,
      bulan: bln,
      tahun: mulai.year,
      bayar: false
    ).first_or_create
    while (mulai = mulai.next_month) <= selesai || mulai.month <= selesai.month
      bln = Bulan.find(mulai.month)
      UserBayarArisan.where(
        arisans_user: arisan_user,
        bulan: bln,
        tahun: mulai.year,
        bayar: false
      ).first_or_create
    end
  end

  def detail_user_status
    arisan_user = ArisansUser.find(params[:arisans_user_id])
    arisan = arisan_user.arisan

    years = []
    mulai = arisan.mulai
    selesai = arisan.selesai
    years << mulai until (mulai = mulai.next_year) > selesai

    render json: {items: arisan_user.user_bayar_arisans.where(tahun: params['tahun']) }, include: { bulan: { only: :nama_bulan } }
  end

  def show
    @arisans_user = ArisansUser.find(params[:id])
    render json: @arisans_user, include: :arisan
  end


  def tarik_arisan
    arisan_user = ArisansUser.find(params[:arisans_user_id])
    arisan_user.tarik = true
    if arisan_user.save
      render json: arisan_user, include: :user_bayar_arisans
    else
      render json: {}, status: :not_found
    end
  end
end
