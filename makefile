staging_url := $(shell sed -n '1p' .config)
production_url := $(shell sed -n '2p' .config)

all:
	$(if $(shell if which s3cmd; then echo ok; fi), , $(error please install s3cmd))

staging:
	s3cmd put  --acl-public --exclude-from .s3ignore -r site/ $(staging_url)

production:
	s3cmd put  --acl-public --exclude-from .s3ignore -r site/ $(production_url)