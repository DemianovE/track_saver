class TracksController < ApplicationController
  def index
    @tracks = Track.all
  end

  def show
    @track = Track.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render file: "#{Rails.root}/public/404.html", layout: false, status: :not_found
  end

  def new
    @track = Track.new
  end

  def create
    name = params[:track][:name]
    file = params[:track][:file].read

    if File.extname(params[:track][:file]).casecmp('.gpx') == 0

      # read and process GPX file
      file = Nokogiri::XML(file)
      startdate = file.xpath('//metadata/time').text

      # add new record with conversion of 'startdate' to DateTime format
      @track = Track.new(name: name, startdate: DateTime.parse(startdate))

      if @track.save
          flash[:success] = "Created GPX track"
          redirect_to tracks_path
      else
          render :new, status: :unprocessable_entity
      end
    else
      flash[:error] = "Unsupported file type"
      redirect_to new_track_url
    end
  end

  private 
    def track_parameters
      params.require(:track).permit(:name, :file)
    end
end
