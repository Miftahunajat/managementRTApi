class ListPengeluaranController < ActionController::API
  def create
    pengeluaran = Pengeluaran.find_by(bulan: Bulan.by_name(params['nama_bulan']), tahun: params[:tahun])
    list_pengeluaran = ListPengeluaran.new(jumlah: params[:jumlah],
                        keterangan: params[:keterangan],
                        pengeluaran: pengeluaran
    )
    if list_pengeluaran.save
      render json: list_pengeluaran
    else
      render json: {}, status: :not_found
    end
  end

  def destroy
    pengeluaran = ListPengeluaran.find_by(id: params[:id])
    if !pengeluaran.nil? && pengeluaran.destroy
      render json: pengeluaran
    else
      render json: {}, status: :not_found
    end
  end

end
