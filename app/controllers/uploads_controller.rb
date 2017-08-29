class UploadsController < ApplicationController
  def index
    @uploads = Upload.all
  end

  def show
    @upload = Upload.find(params[:id])
  end

  def new
    s3 = Aws::S3::Resource.new
    @post = s3.bucket(ENV.fetch('AWS_BUCKET')).presigned_post(
      key: "uploads/#{Time.now.to_i}/${filename}",
      allow_any: ['utf8', 'authenticity_token'],
      success_action_status: "201",
    )
  end

  def create
    Upload.create!(upload_params)

    head :ok
  end

  private

  def upload_params
    params.require(:upload).permit(:path, :file_type, :last_modified)
  end
end
