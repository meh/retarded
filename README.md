Simple Ruby lazy object
=======================

It has the same limitations of [https://github.com/meh/refr](refr).

```ruby
Retarded.new 10 do |many| File.read('/dev/urandom', many) end
```

The first time a method will be called on the object it will execute the block.
