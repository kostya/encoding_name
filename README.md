# EncodingName

Normalizer of encoding name for Crystal (to use it in crystal internal encoder-decoder)

## Installation


Add this to your application's `shard.yml`:

```yaml
dependencies:
  encoding_name:
    github: kostya/encoding_name
```


## Usage


```crystal
require "encoding_name"

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

```
