#!/usr/bin/env bash


java -jar /opt/google/google-closure-compiler/compiler.jar \
--js_output_file web2d.js \
\
--js \
./web2d/com/plter/web2d/core/ArrayTools.js \
./web2d/com/plter/web2d/core/Event.js \
./web2d/com/plter/web2d/core/EventListenerList.js