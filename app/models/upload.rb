class Upload < ApplicationRecord
  def signed_url
    signer.presigned_url(
      :get_object,
      bucket: ENV.fetch('AWS_BUCKET'),
      key: path
    )
  end

  private

  def signer
    @signer ||= Aws::S3::Presigner.new
  end
end
