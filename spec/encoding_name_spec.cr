require "./spec_helper"

def n(name)
  EncodingName.new(name).normalize
end

def ns(name)
  EncodingName.new(name, true).normalize
end

CASES = {"utf-8" => "UTF-8", "utf8" => "UTF8",
         "koi8-r" => "KOI8-R", "koi8-u" => "KOI8-U",
         "iso-8859-5" => "ISO-8859-5", "iso8859-5" => "ISO8859-5",
         "iso-8859-1" => "ISO-8859-1", "iso8859-1" => "ISO8859-1",
         "cp866" => "CP866", "cp-866" => "CP866", "ibm866" => "IBM866", "ibm-866" => "IBM866",
         "euc-jp" => "EUC-JP", "us-ascii" => "US-ASCII", "iso-8859-2" => "ISO-8859-2",
         "iso-8859-7" => "ISO-8859-7", "shift_jis" => "SHIFT_JIS", "tis-620" => "TIS-620",
         "windows-874" => "WINDOWS-874", "WIN-1251" => "CP1251", "ISO-8859-1" => "ISO-8859-1",
         "Windows-1254" => "WINDOWS-1254", "tis-620" => "TIS-620", "windows-874" => "WINDOWS-874",
         "cp_1251" => "CP1251",
}

SIMILAR = {
  "iso88595" => "ISO8859-5", "iso-88595" => "ISO-8859-5",
  "iso88591" => "ISO8859-1", "iso-88591" => "ISO-8859-1",
  "koi8" => "KOI8-R", "koi8u" => "KOI8-U", "koi8r" => "KOI8-R",
}

ALIASES = {
  "ansi" => "ISO-8859-1",
  "dos-866" => "CP866", "dos866" => "CP866",
  "Unicode" => "UTF-8",
}

MISTAKES = {"uft8" => "UTF8", "uft-8" => "UTF-8", "utf" => "UTF8",
            "urf-8" => "UTF-8", "windows 1251" => "CP1251", "coi8-r" => "KOI8-R",
            "koi8-ru" => "KOI8-RU", "windows-cp1251" => "WINDOWS-1251",
            "windos-1251" => "WINDOWS-1251",
            "window-1251" => "WINDOWS-1251", "(UTF-8)" => "UTF-8",
            "utf-8,text/html" => "UTF-8", "pc1251" => "CP1251",
            "'UTF-8'" => "UTF-8", "utf-8; dir=rtl" => "UTF-8",
}

NOTHING = {"aasdfadsfd" => nil, "charset=utf-8" => nil,
           "urFI" => nil, "asfd" => nil, "" => nil, "a" => nil, "_" => nil,
           "_crap" => nil,
}

describe EncodingName do
  it "normalize from list" do
    n("cp1251").should eq "CP1251"
    n("Windows-1251").should eq "WINDOWS-1251"
    n("koi8-ru").should eq "KOI8-RU"
  end

  it "normalize from additional list" do
    n("Windows 1251").should eq "CP1251"
  end

  CASES.each do |k, v|
    it "CASES should find '#{v}' for '#{k}'" do
      ns(k).should eq v
    end
  end

  SIMILAR.each do |k, v|
    it "SIMILAR should find '#{v}' for '#{k}'" do
      ns(k).should eq v
    end
  end

  ALIASES.each do |k, v|
    it "ALIASES should find '#{v}' for '#{k}'" do
      ns(k).should eq v
    end
  end

  MISTAKES.each do |k, v|
    it "MISTAKES should find '#{v}' for '#{k}'" do
      ns(k).should eq v
    end
  end

  NOTHING.each do |k, v|
    it "NOTHING should find '#{v}' for '#{k}'" do
      ns(k).should eq v
    end
  end
end
