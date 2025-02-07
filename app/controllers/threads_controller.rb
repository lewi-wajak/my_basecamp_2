class ThreadsController < ApplicationController
  before_action :set_thread, only: %i[ show edit update destroy ]

  # GET /threads or /threads.json
  def index
    @threads = Thread.all
  end

  # GET /threads/1 or /threads/1.json
  def show
  end

  # GET /threads/new
  def new
    @thread = Thread.new
  end

  # GET /threads/1/edit
  def edit
  end

  # POST /threads or /threads.json
  def create
    @thread = Thread.new(thread_params)

    respond_to do |format|
      if @thread.save
        format.html { redirect_to @thread, notice: "Thread was successfully created." }
        format.json { render :show, status: :created, location: @thread }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @thread.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /threads/1 or /threads/1.json
  def update
    respond_to do |format|
      if @thread.update(thread_params)
        format.html { redirect_to @thread, notice: "Thread was successfully updated." }
        format.json { render :show, status: :ok, location: @thread }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @thread.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /threads/1 or /threads/1.json
  def destroy
    @thread.destroy!

    respond_to do |format|
      format.html { redirect_to threads_path, status: :see_other, notice: "Thread was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_thread
      @thread = Thread.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def thread_params
      params.expect(thread: [ :title, :project_id, :user_id ])
    end
end
