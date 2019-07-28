class PaintingsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_painting, only: [:show, :edit, :update, :destroy]


  def painting_albums
      @paintings = current_user.paintings.paginate(:page => params[:page], :per_page => 6)
   end

  def index
    @paintings = Painting.all.order(created_at: :desc).visible
  end

  def show
  end

  def new
    @painting = Painting.new
  end

  def edit
  end

  def update
    @painting = Painting.find(params[:id])
    @painting.update_attributes(public: params[:painting][:public])
  end


  def create
    @painting = Painting.new(painting_params)

    respond_to do |format|
      if @painting.save
        format.html { redirect_to @painting, notice: 'Album was successfully created.' }
        format.json { render :show, status: :created, location: @painting }
      else
        format.html { render :new }
        format.json { render json: @painting.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_painting
      @painting = Painting.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def painting_params
      params.require(:painting).permit( :user_id, :name, :public, photos:[] )
    end
end
