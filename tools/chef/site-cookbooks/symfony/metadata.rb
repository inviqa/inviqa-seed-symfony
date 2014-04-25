name        "symfony-customizations"
description "Customizations of the VM to use Symfony"

depends "nginx"

recipe "symfony-nginx", "Customize nginx.conf for Symfony"
