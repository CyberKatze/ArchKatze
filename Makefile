docker_image := archkatze
current_dir := $(shell pwd)
out_dir := out
aur_dir := aur_repo
custom_pkg_dir := airootfs/root/pkg

docker:
	@printf "\e[32;1m Building ArchKatze using Docker...\e[0m \n"
	@docker build -t ${docker_image} ./dockerfile 
	@[ ! -d ${out_dir} ] && mkdir ${out_dir}  && chmod o+xwr ${out_dir} || echo "out direcotry exist"
	@[ ! -d ${aur_dir} ] && mkdir ${aur_dir}  && chmod o+xwr ${aur_dir} || echo "temp direcotry exist"
	@[ ! -d ${custom_pkg_dir} ] && mkdir ${custom_pkg_dir}  && chmod o+xwr ${custom_pkg_dir} || echo "package direcotry exist"
	docker run --rm --name builder --privileged \
	--mount type=bind,source=${current_dir}/${out_dir},target=/home/builder/archkatze/${out_dir} \
	--mount type=bind,source=${current_dir}/${aur_dir},target=/home/builder/archkatze/${aur_dir} \
	--mount type=bind,source=${current_dir}/${custom_pkg_dir},target=/home/builder/archkatze/${custom_pkg_dir} \
	${docker_image}

pre-install:
	@printf "\e[32;1m Downloading aur packages and config files..\e[0m \n"
	./pre-install.sh

build:
	@printf "\e[32;1m Building ArchKatze..\e[0m \n"
	@sudo ./build.sh -v

all: pre-install build

clean:
	@printf "\e[32;1m Cleaning up...\e[0m \n"
	sudo rm -rf TEMPMNT
	sudo rm -rf work

