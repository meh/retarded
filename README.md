Simple Ruby lazy object
=======================

It has the same limitations of [https://github.com/meh/refr](refr).

```ruby
Retarded { File.read('/dev/urandom', 10) }

Retarded 10 do |many|
  # `many` will be 10
  File.read('/dev/urandom', many)
end
```

The first time a method is called on the object it will execute the block and
will be a transparent proxy (Reference like) for the resulting value.
