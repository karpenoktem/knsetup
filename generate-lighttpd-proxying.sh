#!/bin/sh

PROJECTS=/projects

: > /etc/lighttpd/proxying.conf-new
for i in $PROJECTS/*/sankhara/root/configuration.sh; do
	NAME=`echo "$i" | sed -e "s@^$PROJECTS/@@g" -e "s@/.*@@g"`
	PORT=`grep '^PORT_LIGHTTPD' "$i" | sed 's/.*=//g'`
	if [ -n "$PORT" ]; then
		cat <<EOF >> /etc/lighttpd/proxying.conf-new
\$HTTP["host"] =~ "(?:www\.)?$NAME\.test\.(kn\.cx|karpenoktem\.(nl|com))" {
	proxy.server = ( "" => ( ( "host" => "10.0.0.3", "port" => $PORT ) ) )
}
EOF
	fi
done
mv /etc/lighttpd/proxying.conf-new /etc/lighttpd/proxying.conf
