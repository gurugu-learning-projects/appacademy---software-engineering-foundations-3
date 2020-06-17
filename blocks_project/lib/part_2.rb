require "byebug"

def all_words_capitalized?(arr)
  arr.all? { |word| word.capitalize == word }
end

def no_valid_url?(arr)
  valid_urls = ["com", "net", "io", "org"]

  arr.none? do |url|
    # debugger
    url_ext = url.split(".").last

    valid_urls.include?(url_ext)
  end
end

def any_passing_students?(arr)
  arr.any? { |student| student[:grades].sum / student[:grades].length >= 75 }
end