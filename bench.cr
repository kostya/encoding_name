require "benchmark"
require "./src/encoding_name"

N = 10000

def test(name, count = N)
  t = Time.now
  s = 0
  kl = EncodingName.new(name, true)
  count.times do
    s += 1 if kl.normalize
  end
  puts "-- '#{name}' -- '#{kl.normalize}' -- #{s} -- #{Time.now - t}"
end

t = Time.now

test("")
test("-")
test(" asdfasdasdadsadsf ")

puts "===== main list ======="
test("us-ascii")
test(" UTF-8 ")

puts "===== add list ======="
test("Windows 1251")
test(" win-1254 ")

puts "===== gsubed ======="
test("dos866")
test(" (utf-8) ")
test(",utf-8 ")

puts "===== similars ======="
test("urf-8")
test("-utf-8")
test("windows-cp1251")

p Time.now - t