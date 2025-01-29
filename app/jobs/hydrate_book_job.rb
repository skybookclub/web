require 'open-uri'

class HydrateBookJob < ApplicationJob
  queue_as :default

  def perform(*args)
    Book.where(title: nil).find_each do |book|
      logger.info "Hydrating book: #{book.id}"

      uri = "https://www.goodreads.com/search?utf8=%E2%9C%93&query=#{book.isbn13}"
      html_content = URI(uri).open(&:read)
      
      json_ld_match = html_content.match(/<script\s+type="application\/ld\+json">(.*?)<\/script>/m)
      if json_ld_match && json_ld_match[1]
        json_data = JSON.parse(json_ld_match[1].strip)
        book.title = json_data["name"]
        book.author = json_data["author"][0]["name"]
        book.cover_image_url = json_data["image"]
        book.save!
      end
    end
  end
end
