class CodesController < ApplicationController
  def index
    @codes = client.codes.list
    @files = Dir.glob('workers/*.worker')
  end

  def upload
    code_from_workerfile = IronWorkerNG::Code::Base.new(:workerfile => params[:filename])
    client.codes.create(code_from_workerfile)
    redirect_to codes_path
  end

  def download
    send_data client.codes.download(params[:id])
  end

  def revisions
    @revisions = client.codes.revisions(params[:id])
  end

end
