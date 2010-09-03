class Embedly

  def self.get_attrs(url)
    embedly_url = "http://api.embed.ly/v1/api/oembed?url=#{CGI::escape url}"
    response = RestClient.get embedly_url
    attrs = JSON.parse response.body
  rescue
    {}
  end

  def self.valid_url?(url)
    true
  end

end