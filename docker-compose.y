version: "3"
services:

  ejabberd-data:
    build:
      context: ./ej-data/
      dockerfile: dockerfile
  ejabberd:
    image: rroemhild/ejabberd
    hostname: it-top.pp.ua
    volumes:
      - ejabberd-data
    volumes:
      - ./ssl:/opt/ejabberd/ssl:ro
    ports:
      - 5222:5222
      - 5269:5269
      - 5280:5280
      - 4560:4560
      - 5443:5443
    environment:
      - ERLANG_NODE=ejabberd
      - XMPP_DOMAIN=it-top.pp.ua
      - EJABBERD_ADMINS=admin@it-top.pp.ua
      - EJABBERD_USERS=admin@it-top.pp.ua:123456 user@it-top.pp.ua:123456
      - EJABBERD_SSLCERT_HOST=/opt/ejabberd/ssl/host.pem
      - EJABBERD_SSLCERT_IT-TOP_PP_UA=/opt/ejabberd/ssl/it-top.pp.ua.pem
      - TZ=Europe/Berlin
