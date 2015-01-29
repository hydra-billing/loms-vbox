maintainer       "Zhan Tuaev"
maintainer_email "zmtuaev@dasreda.ru"
license          "MIT"
description      "Creates PostgreSql user for rails"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.0.1"

recipe 'user',   'Creates a user'

depends 'database', '>= 2.2.0'

%w(debian ubuntu centos suse fedora redhat scientific amazon).each do |os|
  supports os
end
