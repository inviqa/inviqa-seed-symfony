# Capistrano

The folder contains the configuration necessary to deploy the application. Unnecessary stages should be removed to avoid confusing new developers, so if you do not have a systest environment, remove it.

Once the stages are all configured, you can deploy the application with the following command, replacing <stage> for the environment you wish to deploy to:

```
cap <stage> deploy
```

To add a new stage, create a new file in tools/capistrano/config/deploy and add the name of the file to the :stages definition at the top of tools/capistrano/config/deploy.rb. Removing a stage is the inverse of the above procedure (removing the file and removing it from the :stages list).

## Dev stage

A dev stage has been included that will allow you execute some tasks on your VM. It has not been configured to allow deployment so `cap dev deploy` will not work. However, if you find you have tasks that look like `vagrant ssh -- something` in your Hobofile / Rakefile, consider creating cap tasks for them instead. "vagrant ssh" does not work on windows so any Rakefile / Hobofile tasks that contain such a command will not work there.