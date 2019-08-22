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

  def all_user_status
    arisan = Arisan.find(params[:arisan_id])
    arisan_users = arisan.arisans_users
    render json: { items: arisan_users }, methods: :sudah_membayar, include:{ user: {only: :alamat}}
  end

  # def all_user_status
  #   arisan = Arisan.find(params[:arisan_id])
  #   render json: arisan, methods: [
  #     :peserta,
  #     :peserta_verifikasi,
  #     :peserta_belum_membayar,
  #     :peserta_sudah_membayar,
  #     :peserta_sudah_ditarik
  #   ]
  # end

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
      render json: { items: arisans }, include: {arisans_users: {include: :user, methods: :sudah_membayar}}, methods: :peserta
    end

    private

    def detail_arisan_user params
      bulan = Bulan.find_by(nama_bulan: params['nama_bulan'])
      UserBayarArisan
        .joins(:arisans_user)
        .where(arisans_users: {user_id: params[:user_id], arisan_id: params[:arisan_id]})
        .where(tahun: params['tahun'])
    end
end
