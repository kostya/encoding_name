require "./src/encoding_name"

p EncodingName.new("cp-1251").normalize
# => "CP1251"
p EncodingName.new("Windows 1251").normalize
# => "CP1251"
p EncodingName.new("uft8", find_similar: true).normalize
# => "UTF-8"
p EncodingName.new("Unicode").normalize
# => "UTF-8"
p EncodingName.new("asdfdsaf").normalize
# => nil
