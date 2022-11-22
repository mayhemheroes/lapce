# Build Stage
FROM ghcr.io/evanrichter/cargo-fuzz:latest AS builder

# Add source code
ADD . /src
WORKDIR /src

# Build fuzzers (nightly required)
RUN cd lapce-core/fuzz && cargo +nightly fuzz build

# Package Stage
FROM ubuntu:latest
COPY --from=builder /src/lapce-core/fuzz/target/x86_64-unknown-linux-gnu/release/fuzz_* /fuzzers/