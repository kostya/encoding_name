require "jaro_winkler"
require "./list"
require "./additional_list"

class EncodingName
  JAROWINKLER = JaroWinkler.new

  def self.similar(name, bigger_than, stop_if = nil)
    max = 0
    max_k = nil
    chars = name.chars
    ListChars.each do |k|
      v = JAROWINKLER.distance(k, chars)
      if v > max
        max = v
        max_k = k
        break if stop_if && max > stop_if
      end
    end
    if max >= bigger_than && max_k
      finded = ListH[max_k.join]
      ADDITIONAL_LIST[name] = finded
      finded
    end
  end
end
