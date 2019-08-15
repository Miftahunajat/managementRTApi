class PengeluaranController < ActionController::API
  def index
    @pengeluarans = Pengeluaran.all
    render json: @pengeluarans
  end

  def create
    pengeluaran = Pengeluaran.new(
      bulan_id: params[:bulan_id],
      tahun: params[:tahun],
      jumlah: params[:jumlah],
      keterangan: params[:keterangan]
    )
    if pengeluaran.save
      render json: pengeluaran
    else
      render json: {}, status: :not_found
    end
  end

  def pengeluaran_bulan_ini
    bulan = Bulan.find_by(nama_bulan: params[:nama_bulan])
    tahun = params[:tahun]
    Pengeluaran
    .select('bulan_id, tahun, SUM(jumlah) as jumlah')
    .group(:tahun, :bulan_id).having(tahun: tahun, bulan_id: bulan.id)

    byebug
    byebug
    render json: {}
  end

  def pengeluaran_per_tahun
    tahun = params[:tahun]
    bulans = Bulan.all
    pengeluarans = []
    bulans.each do |bulan|
      pengeluarans << Pengeluaran.where(bulan_id: bulan, tahun: tahun).first_or_create
    end
    render json: { items: pengeluarans }, include: [:list_pengeluarans, bulan: { only: :nama_bulan }], methods: :total
  end

  def total_pengeluaran
    render json: { total: ListPengeluaran.sum(:jumlah) }
  end
end
