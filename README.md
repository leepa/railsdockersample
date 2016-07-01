# Sample Dockerfile/Compose for Rails + Alpine Linux

I was playing around with Rails/Resque and wanted to use
Docker with Alpine Linux. The difference in doing this
bigger than you'd think with the final Docker image size
so I highly recommend this route if you care about speed
of development.

I also often see people not take advantage of docker-compose's
ability to handle basing things off of one image - so I
included a resque thing here too.

Hopefully these samples will be useful to others.

The only thing to note to use these as a drop in is that in
docker-compose.yml you'll notice that it has
`railsapp_rails-image` and that bit pre-underscore must
match the folder the name the docker-compose.yml file is in.

Enjoy!
