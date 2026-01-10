---
title: A Simple Homelab
date: 04/01/2026
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

... brief overview of fundamental self-hosting concepts ...

- 1. 
- 2. 
- 3. 
- 4. 
- 5. 
- 6. 

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
[Deskmate T1](https://deskpi.com/products/deskpi-rackmate-t1-2) tiny rack from DeskPi, which is a miniature equivalent of 
the standard server racks that you find inside datacenters.
The model that I chose featured 8 1U slots, which is plenty enough space for several mini servers.

Since I don't need high speed networking equipment, I bought a small 8-port 1Gb/s switch and a couple of 
[12-port patch panel](https://deskpi.com/products/deskpi-rackmate-accessory-10-inch-network-switch) to organize the LAN cables.

I also bought a couple 10inch PDUs (power delivery units) to cleanly organize the power cables.
I wanted to buy a 10inch 1U UPS as well, but it at the time (and even at the time of this writing) there were 
none available (or even existing probalby), so for the moment I'm using the UPS that I already had.

## Operating System Stack

With regards to the choice of operating system and software stack to run on the servers, my choice was mostly 
influenced by the need to be able to do the least maintenance while keeping the systems as secure 
and reliable as possible. Arch Linux is a great choice for this use case (provided you know what you're doing!).

I chose Arch Linux as the server operating system of choice (all my servers have x86_64 CPUs, so the support is excellent), 
mostly because I've been using it for three years and I've learned how to keep it reliable and predictable 
(also [the Arch Linux website runs on Arch Linux](https://wiki.archlinux.org/title/Frequently_asked_questions#Is_Arch_designed_to_be_used_as_a_server?_A_desktop?_A_workstation?)).

A fresh server install features at most four hundred packages, of which most are base system packages, so the 
maintenance is effectively seamless (with the occasional exceptions).

I chose Docker to handle my services , mostly because it's the industry standard for containerization and it's 
fairly easy to use, especially with Docker Compose. For those that don't know, Docker Compose allows you to
describe the configuration for one or more containers in a few text files and to perform actions (like start, 
stop, remove and so on) on all of them at the same time. This is particularly useful for services made of several 
containers that work together...

- 1. arch linux + ufw + fail2ban
- 2. mdadm (for manual RAID configuration)
- 3. bash scripts (for automating complex tasks)
- 4. ssh (to connect remotely to servers)
- 5. tmux + mynav (to manage multiple programs without containers)
- 6. docker compose + lazydocker (to host services)

## Hosted Services

... brief explanation of my needs for services, my preferred choices and why ...

base
- 1. simple data sync (syncthing)
- 2. simple rss feed (miniflux)
- 3. simple bookmark manager + web browser extension (linkding)
- 4. simple music streaming (navidrome)
- 5. simple movie/show streaming (jellyfin)

advanced
- 1. simple monitoring dashboard for docker containers over multiple servers (beszel)
- 2. simple hardware management dashboard (DumbAssets)
- 3. VPN (only when connecting to homelab from outside, es. with personal smartphone/laptop)
- 4. mail server
- 5. git platform

## Conclusion

?
