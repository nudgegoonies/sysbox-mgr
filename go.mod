module github.com/nestybox/sysbox-mgr

go 1.13

require (
	github.com/deckarep/golang-set v1.7.1
	github.com/docker/distribution v2.7.1+incompatible // indirect
	github.com/docker/docker v1.13.1
	github.com/docker/go-connections v0.4.0 // indirect
	github.com/fsnotify/fsnotify v1.4.7
	github.com/mrunalp/fileutils v0.0.0-20171103030105-7d4729fb3618
	github.com/nestybox/sysbox-ipc v0.0.0-00010101000000-000000000000
	github.com/nestybox/sysbox-runc v0.0.0-00010101000000-000000000000
	github.com/nestybox/sysbox/utils v0.0.0-00010101000000-000000000000
	github.com/opencontainers/go-digest v1.0.0-rc1 // indirect
	github.com/opencontainers/runc v0.0.0-00010101000000-000000000000
	github.com/opencontainers/runtime-spec v1.0.2
	github.com/pkg/profile v1.4.0
	github.com/sirupsen/logrus v1.4.2
	github.com/urfave/cli v1.20.0
	golang.org/x/sys v0.0.0-20200420163511-1957bb5e6d1f
)

replace github.com/nestybox/sysbox-ipc => ../sysbox-ipc

replace github.com/nestybox/sysbox-runc => ../sysbox-runc

replace github.com/nestybox/sysbox/utils => ../lib/utils

replace github.com/nestybox/libseccomp-golang => ../lib/seccomp-golang

replace github.com/opencontainers/runc => ./../sysbox-runc

replace github.com/godbus/dbus => github.com/godbus/dbus/v5 v5.0.3
