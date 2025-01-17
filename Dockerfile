FROM rust:latest AS builder

WORKDIR /app
COPY ./ /app
RUN cargo build --release

FROM gcr.io/distroless/cc-debian12

COPY --from=builder /app/target/release/notectl .
ENTRYPOINT [ "./notectl" ]