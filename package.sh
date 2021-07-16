#!/bin/bash

cd "$( dirname "${BASH_SOURCE[0]}" )"

fpm -s dir -t deb --force \
	-n pve-fake-subscription \
	--description "Pollute the subscription cache of Proxmox VE (>=5.0), Proxmox Mail Gateway (>=5.0) & Proxmox Backup Server (>=1.0) so it won't alert you on dashboard login" \
	--url "https://github.com/sbennell/pve-fake-subscription/" \
	-v 0.0.7-1 \
	--license "GLWTS(Good Luck With That Shit) Public License" \
	--depends "python3" \
	--architecture all \
	--deb-dist "unstable" \
	--deb-priority "optional" \
	--deb-systemd "usr/lib/systemd/system/pve-fake-subscription.timer" \
	--deb-systemd-enable --deb-systemd-auto-start --deb-systemd-restart-after-upgrade \
	--after-remove "scripts/purge" \
	./usr

	# temporary removed as of https://github.com/jordansissel/fpm/issues/1472
	#--deb-after-purge "scripts/purge" \
