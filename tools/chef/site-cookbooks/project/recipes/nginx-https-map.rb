https_map = "
    map $scheme $https {
        default off;
        https on;
    }
"
file "#{node['nginx']['dir']}/conf.d/https.conf" do
  content https_map
  owner "root"
  group node["root_group"]
  mode "0644"
  notifies :reload, "service[nginx]"
end
