class PlaylistsController < ApplicationController
  before_action :set_playlist, only: [:show, :edit, :update, :destroy]

  # GET /playlists
  # GET /playlists.json
  def index
    @playlists = Playlist.all
  end

  def deno 
    @playlists = Playlist.where('"playlists"."topic_id" = 5').order('duration ASC')
  end

  def html 
    @playlists = Playlist.where('"playlists"."topic_id" = 2').order('duration ASC')
  end

  def javascript 
    @playlists = Playlist.where('"playlists"."topic_id" = 1 AND "playlists"."completed" = 0').order('sequence ASC')
  end

  def python 
    @playlists = Playlist.where('"playlists"."topic_id" = 3').order('duration ASC')
  end

  def rails 
    @playlists = Playlist.where('"playlists"."topic_id" = 4').order('duration ASC')
  end

  # GET /playlists/1.json
  def show
  end

  # GET /playlists/new
  def new
    @playlist = Playlist.new
  end

  # GET /playlists/1/edit
  def edit
  end

  # POST /playlists
  # POST /playlists.json
  def create
    @playlist = Playlist.new(playlist_params)

    respond_to do |format|
      if @playlist.save
        format.html { redirect_to @playlist, notice: 'Playlist was successfully created.' }
        format.json { render :show, status: :created, location: @playlist }
      else
        format.html { render :new }
        format.json { render json: @playlist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /playlists/1
  # PATCH/PUT /playlists/1.json
  def update
    respond_to do |format|
      if @playlist.update(playlist_params)
        format.html { redirect_to @playlist, notice: 'Playlist was successfully updated.' }
        format.json { render :show, status: :ok, location: @playlist }
      else
        format.html { render :edit }
        format.json { render json: @playlist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /playlists/1
  # DELETE /playlists/1.json
  def destroy
    @playlist.destroy
    respond_to do |format|
      format.html { redirect_to playlists_url, notice: 'Playlist was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_playlist
      @playlist = Playlist.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def playlist_params
      params.require(:playlist).permit(:topic_id, :channel_id, :title, :url, :total_episode, :finish_episode, :completed, :duration, :image_url, :views, :last_updated, :sequence, :rating)
    end
end
