class ReservationsController < ApplicationController
  
  def index
    @reservations = Reservation.all
  end

  def new
    @reservation = Reservation.new(params.permit(:start_date, :end_date, :how_many_people, :total_fee, @room_id))
    @room = Room.find(params[:room_id])
    @user_id = current_user.id
    if @reservation.start_date < Date.today
      flash[:alert] = "開始日は本日以降の日付を選択してください。"
      render "rooms/show"
    elsif @reservation.end_date < @reservation.start_date
      flash[:alert] = "終了日は開始日以降の日付を選択してください。"
      render "rooms/show"
    elsif @reservation.how_many_people <= 0
      flash[:alert] = "人数は1人以上選択してください。"
      render "rooms/show"
    end
    @reservation.total_day = (@reservation.end_date - @reservation.start_date)
    @reservation.total_fee = @room.fee * @reservation.how_many_people * @reservation.total_day
    
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @room = Room.find(params[:reservation][:room_id])
    if @reservation.save
      flash[:notice] = "予約完了しました。"
      redirect_to :reservations
    else
      flash[:alert] = "予約できませんでした。"
      render "new"
    end
  end

  private
  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :how_many_people, :total_fee, :user_id, :room_id)
  end

end
