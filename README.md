# azenv-py

**Better use https://github.com/xoste49/azenv-go**

Entire application used to check proxy server statuses.

## Installation
`docker run --privileged --ulimit nofile=65536:65536 -d --name azenv-py --restart unless-stopped -p 5000:5000 xoste49/azenv-py:latest`

## Benchmark

`h2load --h1 -n100000 -c10000 -t6 http://127.0.0.1:5000`

`finished in 33.36s, 2879.40 req/s, 2.31MB/s`


## Scaling

ulimit -n

now shows 65536 instead of 1024 = and no problems now

- https://djangoadventures.com/how-to-increase-the-open-files-limit-on-ubuntu/