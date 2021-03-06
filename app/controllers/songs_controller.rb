class SongsController < ApplicationController

	def index
		@songs = Song.all
		# byebug
	end

	def new
		@song = Song.new
	end

	def show
		@song = Song.find(params[:id])
	end	
	
	def create
		song = Song.create(song_params)
		# byebug
		redirect_to song_path(song)
	end

	def edit
		@song = Song.find(params[:id])
	end

	def update
		song = Song.find(params[:id])
		song.update(song_params)
		song.save
		redirect_to song_path(song)
	end

	def destroy
	end

	private

	def song_params
		params.require(:song).permit(:name, :artist_id, :genre_id)
	end
	
end