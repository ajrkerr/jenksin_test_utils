# jenkins_test_utils

A very simple set of jenkins utils for testing with other cookbooks.

At the moment the only real change is allowing jobs to be set via attributes:

```ruby
default[:jenkins_test_utils][:jobs] = []
```