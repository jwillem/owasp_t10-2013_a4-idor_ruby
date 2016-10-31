class RevenueController < ApplicationController
  def index

  end

  def download
    begin
      name = params[:name]
      path = Rails.root.join('resources', name)
      file = File.new(path)
      send_file file, :disposition => 'attachement'
    rescue
      redirect_to 'revenue#index'
    end
  end










  def download2
    begin
      name = params[:name]
      path = build_path(name)
      file = File.new(path)
      send_file file, :disposition => 'attachement'
    rescue
      redirect_to 'revenue#index'
    end
  end

  private

  def build_path(name)
    filename =
        if whitelist.has_key?(name)
          whitelist[name]
        else
          # default
          "overview.pdf"
        end
    Rails.root.join('resources', filename)
  end

  def whitelist 
    {
      "2014.pdf" => "2014.pdf",
      "1" => "2015.pdf",
      "xyz123" => "2016.pdf"
    }
  end

end
