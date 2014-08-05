CURL_VERSION=7.37.1

all: 
	echo "Target: $(DEPS_DIR)"
	mkdir -p target/deps
	cp build/bin/*.dll target/deps
	cp build/bin/*.dll "${DEPS_DIR}"

build/bin/libcurl-4.dll:
	mkdir -p build/curl
	tar xvf deps/curl-${CURL_VERSION}.tar.gz -C build/curl --strip-components=1
	pushd build/curl && ./configure --prefix=`pwd`/.. --enable-shared=yes --disable-ldap --disable-ftp --disable-file --disable-ldaps --disable-rtsp --disable-proxy --disable-dict --disable-telnet --disable-tftp --disable-pop3 --disable-imap --disable-smtp --disable-gopher && popd
	pushd build/curl && make && popd
	pushd build/curl && make install && popd
