class ItinerariesController < ApplicationController
  before_action :set_itinerary, only: [:show, :edit, :update, :destroy]
  before_action :set_trip
  # GET /itineraries
  # GET /itineraries.json
  def index
     @itineraries = Itinerary.where(start: params[:start]..params[:end])
  end

  # GET /itineraries/1
  # GET /itineraries/1.json
  def show
    # @trip = Trip.find(params[:id])---Set_trip already
  end

  # GET /itineraries/new
  def new
    if params[:itinerary]
      @itinerary = Itinerary.new(title: params[:itinerary][:title], description: params[:itinerary][:description])
    else
      @itinerary = Itinerary.new
    end
  end

  # GET /itineraries/1/edit
  def edit
  end

  # POST /itineraries
  # POST /itineraries.json
  def create
    @itinerary = Itinerary.new(itinerary_params)
    @itinerary.trip_id = @trip.id
    respond_to do |format|
      if @itinerary.save
        format.html { redirect_to group_trip_itineraries_url(@trip.group, @trip), notice: 'Itinerary was successfully created.' }
        format.json { render :show, status: :created, location: @itinerary }
      else
        format.html { render :new }
        format.json { render json: @itinerary.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /itineraries/1
  # PATCH/PUT /itineraries/1.json
  def update
    respond_to do |format|
      if @itinerary.update(itinerary_params)
        format.html { redirect_to group_trip_itinerary_path(@trip.group, @trip, @itinerary), notice: 'Itinerary was successfully updated.' }
        format.json { render :show, status: :ok, location: group_trip_itinerary_path(@trip.group, @trip, @itinerary) }
      else
        format.html { render :edit }
        format.json { render json: @itinerary.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /itineraries/1
  # DELETE /itineraries/1.json
  def destroy
    @itinerary.destroy
    respond_to do |format|
      format.html { redirect_to group_trip_itineraries_url(@trip.group, @trip), notice: 'Itinerary was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_itinerary
      @itinerary = Itinerary.find(params[:id])
    end

    def set_trip
      @trip = Trip.find(params[:trip_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def itinerary_params
      params.require(:itinerary).permit(:title, :description, :date_range, :start_time, :end_time, :color)
    end
end
