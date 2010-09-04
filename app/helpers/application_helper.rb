module ApplicationHelper

  def pageless(total_pages, url=nil)
    opts = {:totalPages => total_pages, :url => url, :loaderMsg  => ''}
    javascript_tag("$('#results').pageless(#{opts.to_json});")
  end

end
