# TODO check for missing attributes
# TODO Fix pg gem install fail
if node[:postgresql_setup][:user]
  node[:postgresql_setup][:user].each do |user, params|
    postgresql_connection_info = {
      :host     => 'localhost',
      :port     => node['postgresql']['config']['port'],
      :username => 'postgres',
      :password => node['postgresql']['password']['postgres']
    }

    execute "create user" do
      user 'postgres'
      code =<<-EOS
        psql -c "select * from pg_user where usename='#{user}'" | grep -c #{user}
      EOS
      command <<-EOS
        psql -c "CREATE ROLE #{user} WITH CREATEDB LOGIN PASSWORD '#{params[:password]}'"
      EOS
      not_if code, user: 'postgres'
    end

    #postgresql_database_user user do
      #connection postgresql_connection_info
      #password   params[:password]
      #action     :create
    #end
  end
else
  Chef::Application.fatal!("Missing attribute. You must set node['postgresql_setup']['users']!")
end

