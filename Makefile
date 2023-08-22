build:
	git fetch upstream
	git checkout tags/v18.2.45
	git merge aha_build
	docker build . --file Dockerfile.aha --tag chef
	git checkout aha_build
	docker run --rm --entrypoint cat chef /root/chef/chef.deb > chef.deb
	@echo "Chef binary updated. Commit the updated file and update the path to download it from GitHub in the aha_provisioner script in the aha-aws repo."
