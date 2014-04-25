# Hobo project seed (Symfony specific)

This repository contains the common configuration, structure and tooling necessary to kickstart a Symfony project in a consistent manner.

It is designed for use with the "hobo seed plant" command and while cloning it directly as a base to start from, you'll be missing out hobo being able to populate some placeholders for you.

## Goals

The primary goals of this template are to speed up VM related sprint zero tasks, increase predictability of project structure and increase the robustness of project VMs.

## Structure

The folder structure is as follows:

- __app/__ - Symfony config files
- __features/__ - Behat feature files
- __public/__ - Publically accessible files (docroot)
- __spec/__ - PHPSpec specs
- __src/__ - Symfony application code
- __tools/capistrano/__ - Cap config
- __tools/chef/__ - Chef config
- __tools/vagrant/__ - Vagrant config

## Technologies

- Packer stack+nginx base box
- Chef 11.8.2 w/ roles for common services
- Capistrano 2 w/ custom helpers
- Vagrant 1.3+
- knife-solo
- composer
- nginx
- php54

## Differences from the old template

- Berkshelf used instead of librarian-chef for speed and circular resolution
- Common chef service roles included
- Hobo files no longer present (it's a gem now)
