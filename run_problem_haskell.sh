#!/bin/bash
ghc -O2 -outputdir build p$1.hs && mv p$1 build && time build/p$1
