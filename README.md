Для запуска нужно создать scrapyd.conf, [пример](https://scrapyd.readthedocs.io/en/stable/config.html#example-configuration-file)

`docker run -p 6800:6800 -v ${PWD}/scrapyd.conf:/etc/scrapyd/scrapyd.conf -v ${PWD}/data:/app/data postoronniy/scrapyd`