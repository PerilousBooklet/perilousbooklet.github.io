---
title: A Simple Homelab
date: 15/02/2026
---

## Introduction

In a world dominated by sprawling cloud infrastructure and over-engineered software services, big tech companies 
have long since decided to betray their original good intentions (see Google's Don't Be Evil pledge) and no longer 
aim to provide the best quality services for their customers, but to isntead extract as much money as possible from them.

This profit-first mindset has seeped into nearly every corner of the digital landscape. From Google’s reliance on 
sponsored search results, to YouTube deliberately slowing performance on certain browsers, and even to streaming 
platforms where content I’ve paid for can vanish overnight, the pattern is unmistakable.

The consequences of this approach range far and wide, but the one that strikes me most personally is the steady
decline in service quality. I prefer to avoid products and services that are not made by users for users whenever
I can. Thankfully, the open-source community, powered by thousands of passionate developers, offers a refreshing alternative,
with a vast ecosystem of programs that prioritize freedom and functionality over profit.

There's also another reason why I chose to host my own services: as a passionate tinkerer and programmer, I’m drawn 
to the challenge and satisfaction of building my own miniature cloud. The idea of running my own servers and 
hosting my own services is both practical and exciting, not to mention it's extremely useful to train fundamental 
DevOps skills like managing remote connections with servers, infrastructure descriptions with git and containers 
with Docker.

With that in mind, the following paragraphs will detail my journey into self-hosting, the obstacles I encountered, 
and the lessons I learned along the way.

## Self-hosting Concepts

There are a few steps to consider carefully before starting to procure the hardware for a homelab.

To begin with, you have to choose the size of the homelab. The two standard sizes are 19inch and 10inch, respectively for
enterprise-class server racks and smaller networking racks that you can find in offices.

Next is the choice of hardware: enterprise-class servers can consume hundreds of watts of power so they may not be the ideal 
choice for a homelab; fortunately there are also much smaller and energy-efficient solutions, namely mini servers and mini pcs.

Then comes the choice of the software stack: the operating system, the security programs like the firewall and programs to
analyze the incoming traffic for suspicious activity, the program that manages the services that run on the servers and 
the program to remotely connect to the servers to maintain and update them.

Finally, we have to choose which services to run. Fortunately for us normal citizens, decades of open source software 
development have produced a vast selection of programs that are free to use and modify.

It should be noted that some basic knowledge of networks is required to properly and securely manage a homelab, like 
configuring firewalls, managing services and securing credentials.

## Hardware

In recent years there has been an explosion in the availability of low-cost, relatively powerful mini pcs and 
mini servers. Add the pieces of small networking equipment (like routers and switches) that were already widely 
available and the newly released tiny racks from DeskPi (or any existing 10inch networking rack or 3d-printed 
chassis) and you will find that you have all the pieces of hardware necessary to build your own personal cloud 
at home.

A miniature personal cloud can take as many forms as the imagination allows, especially with modern 3d printing 
capabilities. You could get away with something as little as a Zimaboard with a couple of drives or build a 
full-fledged tiny server rack with an 8-node cluster, a UPS and patch panels.

In my case, I wanted something small but spacious, so I opted for the 
[Deskmate T1](https://deskpi.com/products/deskpi-rackmate-t1-2) tiny rack from DeskPi, which is the miniature equivalent of 
a standard server racks that you find inside datacenters.
The model that I chose featured 8 1U slots, which is plenty enough space for several mini servers.

Since I don't need high speed networking equipment, I bought a small 8-port 1Gb/s switch and a couple of 
[12-port patch panel](https://deskpi.com/products/deskpi-rackmate-accessory-10-inch-network-switch)s to organize the LAN cables.

I also bought a couple 10inch PDUs (power delivery units) to cleanly organize the power cables.
I wanted to buy a 10inch 1U UPS as well, but at the time (and even at the time of this writing) there were 
none available (or even existing probably), so for now I'm using the UPS that I already have.

## Operating System Stack

With regards to the choice of operating system and software stack to run on the servers, my choice was mostly 
influenced by the need to be able to do the least maintenance while keeping the systems as secure 
and reliable as possible. Arch Linux is a great choice for this use case (provided you know what you're doing!).

I chose Arch Linux as the server operating system of choice (all my servers have x86_64 CPUs, so the support is excellent), 
mostly because I've been using it for three years and I've learned how to keep it reliable and predictable 
(see how [the Arch Linux website runs on Arch Linux](https://wiki.archlinux.org/title/Frequently_asked_questions#Is_Arch_designed_to_be_used_as_a_server?_A_desktop?_A_workstation?)).

A fresh server install features at most four hundred packages, of which most are base system packages, so the 
maintenance is seamless (with the occasional exceptions).

I chose Docker to handle my services, mostly because it's the industry standard for containerization and it's 
fairly easy to use, especially with Docker Compose. For those that don't know, Docker Compose allows you to
describe the configuration for one or more containers in a single text file and to perform actions (like start, 
stop, remove and so on) on all of them at the same time. This is particularly useful for services made of several 
containers that work together...

- arch linux + ufw + fail2ban
- mdadm (for manual RAID configuration)
- bash scripts (for automating complex tasks)
- ssh (to connect remotely to servers)
- tmux + mynav (to manage multiple programs without containers)
- docker compose + lazydocker (to host services)

## Hosted Services

The next step is figuring out which services to host.
Depending on your needs you may have to host from a few to dozens of services.
In my case, I only need a few.

The first and most important is a service to aggregate news, for which I chose the minimal and simple [miniflux](https://miniflux.app/).

The second is a bookmark manager, since my web browser's toolbar is drowning in stray bookmarks: I chose the simple and 
minimal [linkding](https://linkding.link/).

Lastly, to host my media library I chose the popular (and probably the only one that is good enough) media 
server [jellyfin](https://jellyfin.org/).

## Conclusion

If you've read this far, you're probably already considering how to build your own homelab.

My advice is to start smaller than you think you need to. 
A single mini PC or mini server running a few Docker containers is enough to learn the fundamentals and decide if 
self-hosting is something you can maintain comfortably in the long term.

Also, since countless users in the open-source community have created comprehensive documentation, helpful forum discussions and 
innumerable guides for every imaginable service, the barrier to entry has never been lower, and the alternatives to big tech's 
walled gardens have never been more mature.

Your personal cloud awaits, all it takes is that first step.
