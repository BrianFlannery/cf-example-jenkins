#!/bin/bash

f0='jenkins_v1.640_pure.rejarred.war' ;
app=jenkins ;
f=jenkins.war ;
cd $(dirname $0) ;

set -e ;
set -x ;

rm -f "$f" ;
ln "$f0" "$f" ;

x=$1 ;
[[ $x ]] || x="$f" ;

[[ "$f" == "$x" ]] || ( rm "$f" ; ln "$x" "$f" ; )

cf delete -f -r $app ;
cf push -p jenkins.war -b null -m 2G jenkins || cf logs jenkins --recent ;

#

