class TestpagesController < ApplicationController
  before_action :set_testpage, only: [:show, :edit, :update, :destroy]

  # GET /testpages
  # GET /testpages.json
  def index
    @testpages = Testpage.all
  end

  # GET /testpages/1
  # GET /testpages/1.json
  def show
  end

  # GET /testpages/new
  def new
    @testpage = Testpage.new
  end

  # GET /testpages/1/edit
  def edit
  end

  # POST /testpages
  # POST /testpages.json
  def create
    @testpage = Testpage.new(testpage_params)

    respond_to do |format|
      if @testpage.save
        format.html { redirect_to @testpage, notice: 'Testpage was successfully created.' }
        format.json { render :show, status: :created, location: @testpage }
      else
        format.html { render :new }
        format.json { render json: @testpage.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /testpages/1
  # PATCH/PUT /testpages/1.json
  def update
    respond_to do |format|
      if @testpage.update(testpage_params)
        format.html { redirect_to @testpage, notice: 'Testpage was successfully updated.' }
        format.json { render :show, status: :ok, location: @testpage }
      else
        format.html { render :edit }
        format.json { render json: @testpage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /testpages/1
  # DELETE /testpages/1.json
  def destroy
    @testpage.destroy
    respond_to do |format|
      format.html { redirect_to testpages_url, notice: 'Testpage was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_testpage
      @testpage = Testpage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def testpage_params
      params.require(:testpage).permit(:title, :url)
    end
end
