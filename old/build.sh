#!/usr/bin/env bash


java -jar /opt/google/google-closure-compiler/compiler.jar \
--js_output_file web2d.js \
\
--js \
./web2d/com/plter/web2d/core/ArrayTools.js \
./web2d/com/plter/web2d/core/Event.js \
./web2d/com/plter/web2d/core/EventListenerList.js \
./web2d/com/plter/web2d/Web2D.js \
./web2d/com/plter/web2d/display/Scene2D.js \
./web2d/com/plter/web2d/display/Display.js \
./web2d/com/plter/web2d/display/Container.js \
./web2d/com/plter/web2d/display/Image.js
