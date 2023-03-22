# python-packaging-benchmark

# How to run

1. Install Docker by following their [guide](https://docs.docker.com/get-docker/) based on your OS.
2. Clone or download the repo.
3. Once on the root directory, run `docker build -t "packaging-benchmark-image" .`
4. Run the image with `docker run -it packaging-benchmark-image`.
5. Inside the container image, run the script to benchmark the tools with `sh /tmp/benchmark/run_benchmark.sh`.
