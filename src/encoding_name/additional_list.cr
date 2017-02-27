class EncodingName
  ADDITIONAL_LIST = begin
    h = {} of String => String

    [1250, 1251, 1252, 1254].each do |cp|
      ["windows-", "windows", "windows ", "windows_", "windows=",
       "win", "win-", "win ", "cp", "cp ", "cp-", "cp_"].each do |prefix|
        h["#{prefix}#{cp}"] = "CP#{cp}"
      end
    end

    h
  end
end
