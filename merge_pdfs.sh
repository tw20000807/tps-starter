#!/bin/bash

export PROBLEMSJSON=$(cat .problems.json)
PROBLEMS=$(python3 -c 'import json, os; print(" ".join(json.loads(os.environ.get("PROBLEMSJSON"))))')

MERGECMD="pdfunite "

if [ -f "cover.tex" ]; then
	xelatex cover.tex
	MERGECMD="$MERGECMD cover.pdf"
fi

for prob in $PROBLEMS; do
	if [ -f "${prob}/statement/index.pdf" ]; then
		MERGECMD="$MERGECMD ${prob}/statement/index.pdf"
	fi
done

if [ -f "appendix.tex" ]; then
	xelatex appendix.tex
	MERGECMD="$MERGECMD appendix.pdf"
fi

MERGECMD="$MERGECMD problems.pdf"
echo $MERGECMD
mkdir -p attachments
$MERGECMD
