class UserController < ActionController::API
  def keluarga
    @user = User.find(params[:user_id])
    users = User.where(user_kk_id: @user.user_kk_id)
    render json: {items: users}
  end


  def index
    @user = User.all
    render json: {items: @user}
  end

  def all_kk_user
    @user = User.all
    @user = @user.where('id = user_kk_id')
    render json: {items: @user}
    # User.all.joins("LEFT JOIN iurans ON users.id = iurans.user_id").all
  end

  def all_kk_user_with_iuran
    @user = User.where('users.id = users.user_kk_id')
                .joins("LEFT JOIN iurans ON users.id = iurans.user_id")
                .select('*,users.user_kk_id as id, iurans.sosial as sosial')
    render json: {items: @user}
  end

  def show
    @user = User.find(params[:id])
    render json: @user, include: :roles
  end


  def update
    @user = User.find(params[:id])
    @user.nama = params['nama'] if params['nama']
    @user.password = params['password'] if params['password']
    @user.alamat = params['alamat'] if params['alamat']
    @user.no_hp = params['no_hp'] if params['no_hp']
    if @user.save
      render json: @user, include: :roles
    else
      render json: {}, status: :not_found
    end
  end


  def login
    nama = params['nama']
    password = params['password']
    user = User.find_by_nama_password(nama, password)
    if user.nil?
      render json: {}, status: :not_found
    else
      render json: user, include: :roles
    end
    # render :json => @programs, :include => {:insurer => {:only => :name}}, :except => [:created_at, :updated_at]
  end

  def all_iuran
    bulan = Bulan.find_by(nama_bulan: params['bulan'])
    user = User.find(params[:user_id])
    iuran = user.iurans.find_by(bulan: bulan, tahun: params['tahun'])
    result = {}
    if iuran.nil?
      result[:iuran_sampah_bulan_ini] = false
      result[:iuran_sosial_bulan_ini] = false
    else
      result[:iuran_sampah_bulan_ini] = iuran.sampah
      result[:iuran_sosial_bulan_ini] = iuran.sosial
    end
    arisan = user.arisans_user.first
    if arisan.nil?
      result[:iuran_arisan] = 2
    else
      bayar_arisan = arisan.user_bayar_arisans.find_by(bulan: bulan, tahun: params['tahun'])
      result[:iuran_arisan] = bayar_arisan.try(:bayar) == true ? 1 : 0
    end

    render json: result
    # render :json => @programs, :include => {:insurer => {:only => :name}}, :except => [:created_at, :updated_at]
  end

  def iuran_sosial_sampah
    user = User.find(params[:user_id])
    iurans = user.iurans.where(tahun: params['tahun'])
    result = {}
    result_array = []
    for bulan in Bulan.all
      result_iuran = {}
      item_iuran = iurans.find_by(bulan: bulan)
      result_iuran[:bulan] = bulan.nama_bulan
      result_iuran[:iuran_sosial] = item_iuran.try(:sosial) == true
      result_iuran[:iuran_sampah] = item_iuran.try(:sampah) == true
      result_iuran[:tahun] =  params['tahun']
      result_array << result_iuran
    end
    render json: {nama: user.nama, iuran_per_tahun: result_array}
  end

  def update_iuran
    user = User.find(params[:user_id])
    tahun = params['tahun']
    bulan = Bulan.find_by(nama_bulan: params['bulan'])
    iuran = user.iurans.where(tahun: tahun, bulan: bulan).first_or_create
    if params['type'] == 'sosial'
      iuran.update(sosial: params['bayar'])
    else
      iuran.update(sampah: params['bayar'])
    end
    render json: iuran
  end


  def all_arisan_daftar_ikut
    arisans = Arisan.where(jenis_kelamin_id: params['jenis_kelamin_id'], tutup: false)
    arisans.each { |x| x.user_id = params[:user_id]}
    render json: {items: arisans}, methods: :user_ikut
  end
end
