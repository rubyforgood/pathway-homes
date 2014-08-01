# pathway-homes [![Build Status](https://travis-ci.org/alindeman/pathway-homes.svg?branch=master)](https://travis-ci.org/alindeman/pathway-homes)

[Pathway Homes](http://www.pathwayhomes.org/) provides housing and other
services to adults with serious mental illness.

This application, developed at [Ruby for Good](http://rubyforgood.com/) helps
Pathway Homes manage maintenance requests for the properties they oversee.

## Development

The `bootstrap` script is meant to setup your environment in one step. Run it
from the Terminal:

```
script/bootstrap
```

Start the server and load up <http://localhost:3000>:

```
script/server
```

### Deployment

Production is hosted at <https://pathway-homes.herokuapp.com>. To deploy,
commit your changes, push to master, then:

```
script/deploy
```
