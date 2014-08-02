VERSION=7.37.1
all:
	mkdir -p deps/curl
	tar xvf deps/curl-${VERSION}.tar.gz -C deps/curl --strip-components=1
	pushd deps/curl && ./configure && popd
	pushd deps/curl && make && popd
