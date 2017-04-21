#! /usr/bin/env bash
#
# replaceslash.sh
# Copyright (C) 2017 hugo <hugo@supersudomachine>
#
# Distributed under terms of the MIT license.
#

[ -f NClass.build ] || (
	echo failed to find the build file, execute this script in the root of the NClass project && exit 1
)
sed -i.bak -e '14 s/net/mono/' NClass.build

for i in $(find -iname *.resx); do
	cp $i ${i}.bak
	sed 's/\\/\//g' ${i}.bak > ${i}.new || (
		echo failed slash substitution in $i && exit 1
	)
	sed 's/PNG/png/g' ${i}.new > ${i} || (
		echo failed to substitute PNG with png in $i && exit 1
	)
	rm -rf ${i}.new
done

