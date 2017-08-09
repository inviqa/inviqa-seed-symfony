#!/bin/bash
# plan.sh - used by the base image to insert/replace functions into the `container` tasks

if [ "$(type -t "do_setup")" != "function" ]; then
  do_setup() {
    :
  }
fi

do_migrate() {
  :
}
