class TripCommentsController < ApplicationController
  before_action :set_trip_comment, only: [:show, :edit, :update, :destroy]

  # GET /trip_comments
  # GET /trip_comments.json
  def index
    @trip_comments = TripComment.all
  end

  # GET /trip_comments/1
  # GET /trip_comments/1.json
  def show
  end

  # GET /trip_comments/new
  def new
    @trip_comment = TripComment.new
  end

  # GET /trip_comments/1/edit
  def edit
  end

  # POST /trip_comments
  # POST /trip_comments.json
  def create
    @trip_comment = TripComment.new(trip_comment_params)

    respond_to do |format|
      if @trip_comment.save
        format.html { redirect_to @trip_comment, notice: 'Trip comment was successfully created.' }
        format.json { render :show, status: :created, location: @trip_comment }
      else
        format.html { render :new }
        format.json { render json: @trip_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trip_comments/1
  # PATCH/PUT /trip_comments/1.json
  def update
    respond_to do |format|
      if @trip_comment.update(trip_comment_params)
        format.html { redirect_to @trip_comment, notice: 'Trip comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @trip_comment }
      else
        format.html { render :edit }
        format.json { render json: @trip_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trip_comments/1
  # DELETE /trip_comments/1.json
  def destroy
    @trip_comment.destroy
    respond_to do |format|
      format.html { redirect_to trip_comments_url, notice: 'Trip comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trip_comment
      @trip_comment = TripComment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def trip_comment_params
      params.require(:trip_comment).permit(:body, :user_id, :trip_id)
    end
end
