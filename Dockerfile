FROM rust:1.72

WORKDIR /app

# Install dependencies
RUN apt-get update && apt-get install -y pkg-config libssl-dev build-essential

# Copy everything
COPY . .

# Build the RustDesk server in release mode
RUN cargo build --release

# Expose the TCP port RustDesk uses by default
EXPOSE 21115

# Start the relay server binary
CMD ["./target/release/hbbs"]
