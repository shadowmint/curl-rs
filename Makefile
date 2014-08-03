CURL_VERSION=7.37.1

all: target/deps/libcurl.a

target/deps/libcurl.a: build/curl/lib/.libs/libcurl.a
	mkdir -p target/deps
	mkdir -p .rust
	cp build/curl/lib/.libs/*.a target/deps
	cp build/curl/lib/.libs/*.a .rust

build/curl/lib/.libs/libcurl.a:
	mkdir -p build/curl
	tar xvf deps/curl-${CURL_VERSION}.tar.gz -C build/curl --strip-components=1
	pushd build/curl && ./configure --prefix=`pwd`/.. --enable-shared=no --disable-ldap --disable-ftp --disable-file --disable-ldaps --disable-rtsp --disable-proxy --disable-dict --disable-telnet --disable-tftp --disable-pop3 --disable-imap --disable-smtp --disable-gopher && popd
	pushd build/curl && make && popd
	pushd build/curl && make install && popd
