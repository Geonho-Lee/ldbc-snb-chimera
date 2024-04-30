# Chimera LDBC SNB benchmarking

This repository provides scripts that make it easy to run the [LDBC Social Network Benchmark's Interactive workload](https://github.com/ldbc/ldbc_snb_docs). 

## Requirements 

The recommended environment is that the benchmark scripts (Bash) and the LDBC driver (Java 8) run on the host machine, while the Chimera database runs in a Docker container. Therefore, the requirements are as follows:

* Bash
* Java 8
* Docker 19+


## 1. Setup

To clone a project with submodules, run: 

```bash
git clone --recurse-submodules https://github.com/Geonho-Lee/ldbc-snb-chimera.git
```

To install dependencies and build benchmark implementation, run: 

```bash
./setup/install_dependencies.sh
./setup/build.sh
```

## 2. Loading the data set

Loading data requires three parameters: ***loading-mode***, ***scale-factor***, and ***data-directory***. \
To load data with scale-factor 100 into the data-directory /mnt/disk1, run

```bash
# loading for the first time
./scripts/setdb.sh init 100 /mnt/disk1/
# loaded previously 
./scripts/setdb.sh recycle 100 /mnt/disk1/
```

:warning: There should be enough space in the data-directory.

## 3. Running the benchmark
Running the benchmark requires two paramters: ***query-mix*** and ***time-out***. \
To run the query mix for scale-factor 100 for 2 hours (7200 seconds), run 

```bash
# normal query mix
/scripts/run.sh sf100.normal 7200
# hard query mix
/scripts/run.sh sf100.hard 7200
```

:warning: Since every query mix involves not only READ but also WRITE operations on data, loading must be done before every running. Note that loading with recycle mode does not take a long time because it copies the backup data.