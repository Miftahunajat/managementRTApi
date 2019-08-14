class ArisanController < ActionController::API

  def update
    @arisan = Arisan.find(params[:id])
      if @arisan.update(tutup: params[:tutup])
        render json: @arisan
      else
        render json: {}, status: :not_found
      end
  end

  def show
    @arisan = Arisan.find(params[:id])
    render json: @arisan
  end



  def detail_user_status
    arisan = Arisan.find(params[:arisan_id])
    user = User.find(params[:user_id])
    arisan_user = ArisansUser.find_by(arisan: arisan, user: user)

    years = []
    mulai = arisan.mulai
    selesai = arisan.selesai
    years << mulai until (mulai = mulai.next_year) > selesai

    render json: {items: arisan_user.user_bayar_arisans.where(tahun: params['tahun']) }, include: { bulan: { only: :nama_bulan } }
  end

  def daftar_arisan
    arisan = Arisan.find(params[:arisan_id])
    user = User.find(params[:user_id])
    arisan_user = ArisansUser.new(arisan: arisan, user: user)
    if arisan_user.save
      render json: arisan_user
    else
      render json: {}, status: :not_found
    end
  end

  def ikut_arisan
    arisan = Arisan.find(params[:arisan_id])
    user = User.find(params[:user_id])
    arisan_user = ArisansUser.find_by(arisan: arisan, user: user)
    arisan_user.ikut = true
    if arisan_user.save
      create_user_bayar_arisan_for_each_month(arisan_user, arisan)
      render json: arisan_user, include: :user_bayar_arisans
    else
      render json: {}, status: :not_found
    end
  end

  def tarik_arisan
    arisan = Arisan.find(params[:arisan_id])
    user = User.find(params[:user_id])
    arisan_user = ArisansUser.find_by(arisan: arisan, user: user)
    arisan_user.tarik = true
    if arisan_user.save
      render json: arisan_user, include: :user_bayar_arisans
    else
      render json: {}, status: :not_found
    end
  end

  def all_user_status
    arisan = Arisan.find(params[:arisan_id])
    render json: arisan, methods: [
      :peserta,
      :peserta_verifikasi,
      :peserta_belum_membayar,
      :peserta_sudah_membayar,
      :peserta_sudah_ditarik
    ]
  end

  def create
        arisan = Arisan.new(nama: params[:nama],
                            selesai: Date.parse(params['selesai']),
                            iuran: params[:iuran],
                            mulai: Date.today,
                            jenis_kelamin_id: params['jenis_kelamin_id']
        )
        if arisan.save
          render json: arisan, methods: :peserta
        else
          render json: {}, status: :not_found
        end
    end

    def index
      arisans = Arisan.all
      arisans = arisans.where(jenis_kelamin_id: params['jenis_kelamin_id'], tutup: false)
      render json: { items: arisans }, methods: :peserta
    end

    private

    def detail_arisan_user params
      bulan = Bulan.find_by(nama_bulan: params['nama_bulan'])
      UserBayarArisan
        .joins(:arisans_user)
        .where(arisans_users: {user_id: params[:user_id], arisan_id: params[:arisan_id]})
        .where(tahun: params['tahun'])
    end

    def create_user_bayar_arisan_for_each_month(arisan_user, arisan)
      mulai = arisan.mulai
      selesai = arisan.selesai
      bln = Bulan.find(mulai.month)
      UserBayarArisan.create(
        arisans_user: arisan_user,
        bulan: bln,
        tahun: mulai.year,
        bayar: false
      )
      while (mulai = mulai.next_month) <= selesai
        bln = Bulan.find(mulai.month)
        UserBayarArisan.where(
          arisans_user: arisan_user,
          bulan: bln,
          tahun: mulai.year,
          bayar: false
        ).first_or_create
      end
    end
end
