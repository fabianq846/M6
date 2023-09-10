class JobPostingsController < ApplicationController
  before_action :set_job_posting, only: %i[ show edit update destroy ]

  # GET /job_postings or /job_postings.json
  def index
    @job_postings = JobPosting.all
  end

  # GET /job_postings/1 or /job_postings/1.json
  def show
  end

  def apply
    @job_posting = JobPosting.find(params[:id])
    current_user.job_postings << @job_posting
  
    # Enviar notificación a Esteban
    # Aquí puedes implementar la notificación, ya sea por correo electrónico, notificación interna, etc.
    NotificationMailer.new_application(Application.last).deliver_now

    redirect_to @job_posting, notice: 'You have successfully applied!'
  end

  # GET /job_postings/new
  def new
    @application = Application.new(job_posting_id: params[:job_posting_id])
  end
  

  # GET /job_postings/1/edit
  def edit
  end

  # POST /job_postings or /job_postings.json
  def create
    @job_posting = JobPosting.new(job_posting_params)

    respond_to do |format|
      if @job_posting.save
        format.html { redirect_to job_posting_url(@job_posting), notice: "Job posting was successfully created." }
        format.json { render :show, status: :created, location: @job_posting }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @job_posting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /job_postings/1 or /job_postings/1.json
  def update
    respond_to do |format|
      if @job_posting.update(job_posting_params)
        format.html { redirect_to job_posting_url(@job_posting), notice: "Job posting was successfully updated." }
        format.json { render :show, status: :ok, location: @job_posting }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @job_posting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /job_postings/1 or /job_postings/1.json
  def destroy
    @job_posting.destroy

    respond_to do |format|
      format.html { redirect_to job_postings_url, notice: "Job posting was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job_posting
      @job_posting = JobPosting.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def job_posting_params
      params.require(:job_posting).permit(:title, :description)
    end
end
