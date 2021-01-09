# docker-prosody

--- WORK IN PROGRESS ---

This project builds a dockerized instance of the [Prosody](https://prosody.im) XMPP server.  
It uses Alpine Linux and mainly consists in installing Lua / LuaRocks / Prosody in a lightweight image (~15 MiB).  
Most of the software is compiled from sources, including the [recommended dependencies](https://prosody.im/doc/depends).  
Note that I've chosen not to include LuaEvent since this project aims to be used by small communities (decentralization matters).
