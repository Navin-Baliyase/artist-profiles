class PaintingsController < ApplicationController
  def index
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_album
      @album = Painting.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def painting_params
      params.require(:painting).permit( :user_id, :name, :public, photos:[] )
    end
end
