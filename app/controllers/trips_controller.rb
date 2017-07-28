class TripsController < ApplicationController
  before_action :set_trip, only: [:show, :edit, :update, :destroy, :search]

  # GET /trips
  # GET /trips.json
  def index
    @trips = Trip.all
  end

  # GET /trips/1
  # GET /trips/1.json
  def show
    @trip = Trip.find(params[:id])
    @itinerary = Itinerary.new trip_id: @trip.id
  end



  # GET /trips/new
  def new
    @trip = Trip.new
  end

  # GET /trips/1/edit
  def edit
  end

  # POST /trips
  # POST /trips.json
  def create
    p params
    @trip = Trip.new(
        group_id: params[:group_id],
        city: params[:trip][:city],
        state: params[:trip][:state],
        country: params[:trip][:country],
        zipcode: params[:trip][:zipcode]
      )
    @trip.latitude = Geocoder.coordinates(@trip.address)[0]
    @trip.longitude = Geocoder.coordinates(@trip.address)[1]

    respond_to do |format|
      if @trip.save
        format.html { redirect_to group_trip_url(@trip.group, @trip), notice: 'Trip was successfully created.' }
        format.json { render :show, status: :created, location: group_trip_url(@trip.group, @trip) }
      else
        format.html { render :new }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end
  end

  def search
    uri = URI( 'http://api.acehopper.com/v1/attraction/search' )
    uri.query = URI.encode_www_form(
      distance: params[:distance],
      lat: @trip.latitude,
      lon: @trip.longitude,
      limit: '30',
      query: params[:search],
      sort: params[:sort],
      key: '0AUJEJ9UHQARHUPOG39997HX9K30GVLR0JS4KG1UBV1',# ENV['APE_HOPPER_KEY'],
      secret: 'Q9YAIBODGO6MSIQYDOIFHACRKDG8KQAE9TT2VGOUGJC'
    )
    result = Net::HTTP.get_response( uri ).body
    result = result.sub(/^[^\}]*(?:\}(?: |\r|\n)*){2}/, '')
    render json: result, only: :response

    # respond_to do |format|
    #   format.json { render json: Net::HTTP.get_response( uri ).body }
    # end
  end

  # PATCH/PUT /trips/1
  # PATCH/PUT /trips/1.json
  def update
    respond_to do |format|
      if @trip.update(trip_params)
        format.html { redirect_to @trip, notice: 'Trip was successfully updated.' }
        format.json { render :show, status: :ok, location: @trip }
      else
        format.html { render :edit }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trips/1
  # DELETE /trips/1.json
  def destroy
    @trip.destroy
    respond_to do |format|
      format.html { redirect_to trips_url, notice: 'Trip was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trip
      @trip = Trip.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def trip_params
      params.require(:trip).permit(:city, :state, :country, :longitude, :latitude, :zipcode)
    end
end
