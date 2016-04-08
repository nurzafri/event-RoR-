class OccasionsController < ApplicationController
  before_action :set_occasion, only: [:show, :edit, :update, :destroy]
  before_action :check_owner, except: [:all, :show, :index, :new, :create]
  before_action :authenticate_user!, except: [:show]

  # GET /occasions
  # GET /occasions.json
  def index
    if current_user.organization.nil?
      redirect_to new_organization_path
    else
      @occasions = current_user.organization.occasions
    end
  end

  def all
    @occasions = Occasion.all
  end

  # GET /occasions/1
  # GET /occasions/1.json
  def show
  end

  # GET /occasions/new
  def new
    @occasion = current_user.organization.occasions.new
    @occasion.user = current_user
  end

  # GET /occasions/1/edit
  def edit
  end

  # POST /occasions
  # POST /occasions.json
  def create
    @occasion = current_user.organization.occasions.new(occasion_params)
    @occasion.user = current_user

    respond_to do |format|
      if @occasion.save
        format.html { redirect_to @occasion, notice: 'Occasion was successfully created.' }
        format.json { render :show, status: :created, location: @occasion }
      else
        format.html { render :new }
        format.json { render json: @occasion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /occasions/1
  # PATCH/PUT /occasions/1.json
  def update
    respond_to do |format|
      if @occasion.update(occasion_params)
        format.html { redirect_to @occasion, notice: 'Occasion was successfully updated.' }
        format.json { render :show, status: :ok, location: @occasion }
      else
        format.html { render :edit }
        format.json { render json: @occasion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /occasions/1
  # DELETE /occasions/1.json
  def destroy
    @occasion.destroy
    respond_to do |format|
      format.html { redirect_to occasions_url, notice: 'Occasion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_occasion
      @occasion = Occasion.find(params[:id])
    end

    def check_owner
      unless current_user == @occasion.user 
        redirect_to @occasion
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def occasion_params
      params.require(:occasion).permit(:name, :description, :venue, :date, :time_start, :time_end, :latitude, :longitude, :user_id)
    end
end
