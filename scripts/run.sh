#!/bin/bash

QUERY_MIX=$1
TIMEOUT=$2
PYENV_NAME=ldbc_snb_chimera
HOME_DIR=`pwd`
SCRIPT_DIR=`pwd`/scripts/
BENCHMARK_DIR=`pwd`/ldbc_snb_interactive_v1_impls_chimera/pg-graph


echo "=============================================================="
echo "Setting experiment setting"
echo "=============================================================="
cp ${SCRIPT_DIR}/driver/run/benchmark.properties.${QUERY_MIX}.base ${BENCHMARK_DIR}/driver/benchmark.properties
cd ${BENCHMARK_DIR}


pyenv local ${PYENV_NAME}
echo "=============================================================="
echo "Run benchmark"
echo "=============================================================="
chmod +x driver/*.sh
timeout ${TIMEOUT} driver/benchmark.sh
mkdir -p ${HOME_DIR}/results/${QUERY_MIX}
mv results/* ${HOME_DIR}/results/${QUERY_MIX}
cp ${SCRIPT_DIR}/config/postgresql.conf ${HOME_DIR}/results/${QUERY_MIX}

pyenv local system