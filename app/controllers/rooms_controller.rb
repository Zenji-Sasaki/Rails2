class RoomsController < ApplicationController
  before_action :search
 
  def index
    @search = Room.ransack(params[:q])
    @rooms = @search.result
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(params.require(:room).permit(:name, :introduction, :fee, :address, :image, :user_id))
    if @room.save
      flash[:notice] = "ルームを登録しました。"
      redirect_to root_path
    else
      flash[:alert] = "ルームを登録できませんでした。"
      render "new"
    end
  end

  def show
    @room = Room.find(params[:id])
  end

  def edit
    @room = Room.find(params[:id])
  end

  def update
  end

  def destroy
    @room = Room.find_by(params[:id])
    @room.destroy
    redirect_to root_path
  end

  def search
    @q = Room.ransack(params[:q])
  end

  def home
    @rooms = Room.all
  end

  def post
    @rooms = Room.all
  end
end
