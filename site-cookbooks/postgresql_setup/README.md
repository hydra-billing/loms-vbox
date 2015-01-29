PostgreSql user setup
=====================

Simple cookbook for PostgreSql user creation

Usage
=====

Just add int to a runlist

Attributes
----------

Define users within the role:


```ruby
  override_attributes(
    :postgresql_setup=> {

      "username" => {
        :password => "user password"
      }
    }
  )
```

Issues/Bugs/Feature Requests
----------------------------

There are not yet
