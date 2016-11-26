# alpine-mongodb
mongodb base on alphine

## mongodb version is 3.2.10.pre.rc1

## usage:
Just pull and run on your machine.But you can add some param for it to set up some attribute.

## $MONGODB_DATABASE
default: admin, you can use MONGODB_DATABASE env to set it.

## $MONGODB_USER
default: admin, you can use MONGODB_USER env to set it.

## $MONGODB_PASS
default: 123456, you can use MONGODB_PASS env to set it.


## ADVANCED PARAM:

## $WIREDTIGERCACHESIZEGB
default: 60% of RAM minus 1 GB, or 1 GB. 
If you run mongod in a container (e.g. lxc, cgroups, Docker, etc.) that does not have access to all of the RAM available in a system, you must set ___THIS PARAM___ to a value less than the amount of RAM available in the container. The exact amount depends on the other processes running in the container.


## More param is on the way.Be patient.

To be continued.
