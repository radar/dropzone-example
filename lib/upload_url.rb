class UploadURL
  def initialize
    @client = Imgix::Client.new(
      host: "#{ENV.fetch("IMGIX_SUBDOMAIN")}.imgix.net",
      secure_url_token: ENV.fetch("IMGIX_TOKEN")
    )
  end

  def small_url(path)
    @client.path(path).to_url(w: 250, h: 250, fit: 'crop')
  end

  def large_url(path)
    @client.path(path).to_url(w: 1000, h: 1000, fit: 'crop')
  end
end
