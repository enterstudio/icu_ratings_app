module Admin
  class FidePlayerFilesController < ApplicationController
    authorize_resource

    def index
      @fide_player_files = FidePlayerFile.search(params, admin_fide_player_files_path)
      render :results if request.xhr?
    end

    def show
      @fide_player_file = FidePlayerFile.find(params[:id])
      if created_at = @fide_player_file.try(:created_at)
        @next = FidePlayerFile.where("created_at > ?", created_at).order("created_at ASC").first
        @prev = FidePlayerFile.where("created_at < ?", created_at).order("created_at DESC").first
      end
    end

    def new
      @fide_player_file = FidePlayerFile.new
    end

    def create
      params[:fide_player_file][:user_id] = session[:user_id]
      @fide_player_file = FidePlayerFile.new(fpf_params)
      if @fide_player_file.save
        redirect_to [:admin, @fide_player_file], notice: "File was successfully analysed."
      else
        flash.now[:alert] = @fide_player_file.errors.full_messages.join("; ")
        render action: "new"
      end
    end

    def destroy
      @fide_player_file = FidePlayerFile.find(params[:id])
      if @fide_player_file.db_updated?
        redirect_to [:admin, @fide_player_file], alert: "Sorry, but you can't delete the record of a file upload which resulted in any DB updates"
      else
        @fide_player_file.destroy
        redirect_to admin_fide_player_files_path, notice: "Report for #{@fide_player_file.created_at.strftime("%Y-%m-%d %H:%M")} successfully deleted"
      end
    end

    private

    def fpf_params
      params.require(:fide_player_file).permit(:file, :update, :user_id)
    end
  end
end
