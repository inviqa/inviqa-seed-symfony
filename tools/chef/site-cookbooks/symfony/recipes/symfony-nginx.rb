include_recipe "nginx"

resources(:template => "nginx.conf").instance_exec do
  cookbook "symfony-customizations"
end
