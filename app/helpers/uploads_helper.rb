require_dependency 'upload_url'

module UploadsHelper
  def small_image(upload)
    image_tag(upload_url.small_url(upload.path))
  end

  def large_image(upload)
    image_tag(upload_url.large_url(upload.path))
  end

  private

  def upload_url
    @upload_url ||= UploadURL.new
  end
end
