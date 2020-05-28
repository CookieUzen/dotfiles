#!/bin/bash
TMPDIR="$HOME/anywhere"
TMPFILE="$TMPDIR/file$(ls $TMPDIR | wc -l)"

st sh -c "nvim "$TMPFILE""
cat $TMPFILE | xsel --clipboard --input
