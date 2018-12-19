.PHONY: post clean

clones:
	./scripts/clone-repos.sh

taskcluster: clones
	./scripts/import-clones.sh

post: taskcluster
	./scripts/post-import.sh

clean:
	rm -rf ./clones ./taskcluster
