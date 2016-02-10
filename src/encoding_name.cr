require "./encoding_name/*"

class EncodingName
  VERSION = "0.1"

  def initialize(name : String, @find_similar = false)
    @original_name = name
    @name = name.strip.downcase
  end

  def normalize : String?
    return if @name.size == 0

    res = find_in_lists(@name)
    return res if res

    name2 = @name.gsub(/[^a-z\-0-9]/i, "").gsub("dos", "cp")
    res = find_in_lists(name2)
    return res if res

    EncodingName.similar(name2, 0.87, 0.97) if @find_similar
  end

  private def find_in_lists(name)
    ListH[name]? || ADDITIONAL_LIST[name]? || Aliases[name]?
  end
end
