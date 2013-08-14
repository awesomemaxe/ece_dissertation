  class DissTrackersController < ApplicationController
  before_action :set_diss_tracker, only: [:show, :edit, :update, :destroy]

  #-------------------------------------------------
# Use search conditions by search params for column names. 
# This allows urls like "contacts/list?company_id=5".
  def collection
    conditions = conditions_from_params
    @collection ||= end_of_association_chain.find(:all, :conditions => conditions)
  end
 
# Builds search conditions by search params for column names.
  def conditions_from_params
    conditions = nil
    params.reject {|key, value| [:controller, :action, :id].include?(key.to_sym)}.each do |key, value|
      next unless model.column_names.include?(key)
      if value.is_a?(Array)
        conditions = merge_conditions(conditions, ["#{model_name.to_s.pluralize}.#{key.to_s} in (?)", value])
      else
        conditions = merge_conditions(conditions, ["#{model_name.to_s.pluralize}.#{key.to_s} = ?", value])
      end
    end
    conditions
  end
 
  def merge_conditions(*conditions)
    c = conditions.find_all {|c| not c.nil? and not c.empty? }
    c.empty? ? nil : c.collect{|c| model.send(:sanitize_sql, c)}.join(' AND ')
  end

  #---------------------------------------------

  # GET /diss_trackers
  # GET /diss_trackers.json
  def index
    logger.info("----------Debugging------------")
    logger.info("        temp:      #{request.GET}")
    if request.GET.to_a.empty?
    @diss_trackers = DissTracker.all
  
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @diss_trackers }
      format.xml { render xml: @diss_trackers } 
    end
    else
    @diss_trackers = DissTracker.where(request.GET)
    logger.info(" Recieving request.")
    logger.info("        diss:      #{@diss_trackers}")
  end
end

  # GET /diss_trackers/1
  # GET /diss_trackers/1.json
  def show
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @diss_tracker }
      format.xml { render xml: @diss_tracker }
  end

  end

  # GET /diss_trackers/new
  def new
    @diss_tracker = DissTracker.new

      respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @diss_tracker }
      format.xml { render xml: @diss_tracker }
  end
  end

  # GET /diss_trackers/1/edit
  def edit

  end

  # POST /diss_trackers
  # POST /diss_trackers.json
  def create
    @diss_tracker = DissTracker.new(diss_tracker_params)

    respond_to do |format|
      if @diss_tracker.save
        format.html { redirect_to @diss_tracker, notice: 'Diss tracker was successfully created.' }
        format.json { render action: 'show', status: :created, location: @diss_tracker }
        format.xml { render xml: @diss_tracker, status: :created, location: @diss_tracker }
      else
        format.html { render action: 'new' }
        format.json { render json: @diss_tracker.errors, status: :unprocessable_entity }
        format.xml { render xml: @diss_tracker.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /diss_trackers/1
  # PATCH/PUT /diss_trackers/1.json
  def update
    respond_to do |format|
      if @diss_tracker.update(diss_tracker_params)
        format.html { redirect_to @diss_tracker, notice: 'Diss tracker was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @diss_tracker.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /diss_trackers/1
  # DELETE /diss_trackers/1.json
  def destroy
    @diss_tracker.destroy
    respond_to do |format|
      format.html { redirect_to diss_trackers_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_diss_tracker
      @diss_tracker = DissTracker.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def diss_tracker_params
      params.require(:diss_tracker).permit(:UID, :last_name, :first_name, :titile, :chair, :advisor, :reader2, :reader3, :reader4, :reader5, :data_approved)
    end
end
