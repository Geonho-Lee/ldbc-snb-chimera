#!/bin/bash

cd ldbc_snb_interactive_v1_impls_chimera

echo "=============================================================="
echo "Build repository"
echo "=============================================================="
chmod +x scripts/build.sh
scripts/build.sh
