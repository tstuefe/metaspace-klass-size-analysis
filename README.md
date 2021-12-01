# metaspace-klass-size-analysis
Klass size distribution analysis

All tests done with `-Xshare:off` to remove the distorting effect of CDS on Klass storage.

All tests done on 64-bit, so word size = 8 (64 words = 512 bytes)

![Alt text](./plots/simple-histo.svg)

![Alt text](./plots/spring-petclinic-histo.svg)

![Alt text](./plots/lambdas-histo.svg)

![Alt text](./plots/reflection-histo.svg)
