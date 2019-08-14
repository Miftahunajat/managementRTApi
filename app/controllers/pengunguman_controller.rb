class PengungumanController < ActionController::API
  def index
    @pengunguman = Pengunguman.all
    render json: { items: @pengunguman }
  end


  def create
    @pengunguman = Pengunguman.new()
    @pengunguman.title = params[:title]
    @pengunguman.body = params[:body]
    @pengunguman.image_url = params[:file]
    @pengunguman.image_description = params[:content_desc]
    @pengunguman.tanggal = DateTime.now
    if @pengunguman.save
      render json: @pengunguman
    else
      render json: {}, status: :not_found
    end
  end
end