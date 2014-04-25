Chef environments are groupings of nodes based on the development pipeline. For instance, development, staging, production etc.

Settings that are common across all nodes within an environment group should be stored in an appropriate environment file.

You can set the environment in your node config file by specifying the "environment" key.