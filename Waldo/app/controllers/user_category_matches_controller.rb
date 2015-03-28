class UserCategoryMatchesController < ApplicationController
  before_action :set_user_category_match, only: [:show, :edit, :update, :destroy]

  # GET /user_category_matches
  # GET /user_category_matches.json
  def index
    @user_category_matches = UserCategoryMatch.all
  end

  # GET /user_category_matches/1
  # GET /user_category_matches/1.json
  def show
  end

  # GET /user_category_matches/new
  def new
    @user_category_match = UserCategoryMatch.new
  end

  # GET /user_category_matches/1/edit
  def edit
  end

  # POST /user_category_matches
  # POST /user_category_matches.json
  def create
    @user_category_match = UserCategoryMatch.new(user_category_match_params)

    respond_to do |format|
      if @user_category_match.save
        format.html { redirect_to @user_category_match, notice: 'User category match was successfully created.' }
        format.json { render :show, status: :created, location: @user_category_match }
      else
        format.html { render :new }
        format.json { render json: @user_category_match.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_category_matches/1
  # PATCH/PUT /user_category_matches/1.json
  def update
    respond_to do |format|
      if @user_category_match.update(user_category_match_params)
        format.html { redirect_to @user_category_match, notice: 'User category match was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_category_match }
      else
        format.html { render :edit }
        format.json { render json: @user_category_match.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_category_matches/1
  # DELETE /user_category_matches/1.json
  def destroy
    @user_category_match.destroy
    respond_to do |format|
      format.html { redirect_to user_category_matches_url, notice: 'User category match was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_category_match
      @user_category_match = UserCategoryMatch.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_category_match_params
      params.require(:user_category_match).permit(:match_id, :user_category_id, :uc_id, :match_id)
    end
end
