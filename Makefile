REBAR = rebar

.PHONY: rebar data all
.SECONDARY:

all: data rebar

rebar:  CMD = compile
rebar:
	$(REBAR) $(CMD)

data:   priv/geoip

priv/:
	mkdir -p $@

priv/geoip.gz: SRC = http://geolite.maxmind.com/download/geoip/database/GeoLite2-City.mmdb.gz
priv/geoip.gz: priv/
	curl $(SRC) -o $@

priv/geoip: | priv/geoip.gz
	gunzip $|
