OpenStack Operators
===================

## Note

This group is not sanctioned or affiliated with the official OpenStack project.
We are just a bunch of operators who happen to have similar interests and
opinions about how we want to run our Clouds.

Background
==========

## Assumptions

We are opinioned and this group might not be for you, we assume:

* Your using chef to manage your infastructure
* You strictly want to use deb or rpm packages

If this does not sound like your flavor of koolaid perhaps you should check out:

* http://devstack.org/
* https://launchpad.net/devstackpy

Organization
============

## Launchpad

We have a launchpad group, it is truely awesome:

 https://launchpad.net/~osops

## Mailing List

Lauchpad is awesome and they provide us with a mailing list:

osops@lists.launchpad.net

## IRC

In IRC we lurk.

#openstack-chef freenode

Getting Started
===============

Each cookbook used by the team is setup as an independant repository in github
which is then included in the chef-repo repository as a submodule. Submodules
are crazy but it was the most reasonable way we could come up with to organize
this mess. 

## Working with the chef-repo

To get started you will want to:

git clone --recursive git@github.com:osops/chef-repo.git

Enjoy!
