class UserController < ActionController::API
  def index
    @user = User.all
    render json: {items: @user}
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

  def update
    @object = Object.find(params[:id])
      if @object.update_attributes(params[:object])
        flash[:success] = "Object was successfully updated"
        redirect_to @object
      else
        flash[:error] = "Something went wrong"
        render 'edit'
      end
  end

end
