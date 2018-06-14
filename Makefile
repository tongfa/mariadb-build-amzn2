
BUILD_TARGETS:= \
MariaDB-10.3.8-amzn2-x86_64-backup.rpm \
MariaDB-10.3.8-amzn2-x86_64-client.rpm \
MariaDB-10.3.8-amzn2-x86_64-common.rpm \
MariaDB-10.3.8-amzn2-x86_64-connect-engine.rpm \
MariaDB-10.3.8-amzn2-x86_64-devel.rpm \
MariaDB-10.3.8-amzn2-x86_64-rocksdb-engine.rpm \
MariaDB-10.3.8-amzn2-x86_64-server.rpm \
MariaDB-10.3.8-amzn2-x86_64-shared.rpm \
MariaDB-10.3.8-amzn2-x86_64-test.rpm \
MariaDB-10.3.8-amzn2-x86_64-tokudb-engine.rpm 

dockerRun=docker run --mount src="$(shell pwd)",target=/build,type=bind -it mariadbbuild ${1}

all: $(BUILD_TARGETS)

./.dockerBuild:
	(cd docker && docker build -t mariadbbuild .)
	touch $@

./server:
	git clone https://github.com/MariaDB/server.git

$(BUILD_TARGETS): ./server ./.dockerBuild
	$(call dockerRun, /build/vm/build.sh)

clean:
	$(call dockerRun, /build/vm/clean.sh)

reallyClean: clean
	if [ -e ./server ] rm -rf ./server
	if [ -e ./.dockerBuild ] rm ./.dockerBuild
	docker rmi mariadbbuild
