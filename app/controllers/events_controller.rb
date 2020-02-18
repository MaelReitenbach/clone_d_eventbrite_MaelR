class EventsController < ApplicationController
before_action :authenticate_user!, only: [:new, :create]
  def index
  
  end

  def show
    @event = Event.find(params['id'])
    @attendance = Attendance.where(event: @event)
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(
      title: params[:title],
      start_date: params[:start_date],
      duration: params[:duration],
      location: params[:location],
      price: params[:price],
      description: params[:description],
      administrator_id: current_user.id
      )
    if @event.save
      redirect_to action: 'index'
      flash.alert = "L'évènement a été créé !"
    else
      render 'new'
    end
  end



end
