task :default => [:usage]
task :help => [:usage]
task :build => [:multiarch_build]
task :buildx => [:multiarch_build]
task :b => [:multiarch_build]

CONTAINER_NAME = 'unixorn/pihole-controller'

task :usage do
  puts 'Usage:'
  puts
  puts 'rake build:      Create the image'
  puts 'rake lint:       Lint Dockerfile with hadolint'
  puts
end

# Tasks

desc 'Use buildx to make a multi-arch container without cache'
task :cacheless do
  puts "Building #{CONTAINER_NAME}"
  sh %{ docker buildx build --no-cache --platform linux/amd64,linux/arm/v7,linux/arm64 --push -t #{CONTAINER_NAME} .}
  sh %{ docker pull #{CONTAINER_NAME} }
end

desc 'Use buildx to make a multi-arch container'
task :multiarch_build do
  puts "Building #{CONTAINER_NAME}"
  sh %{ docker buildx build --platform linux/amd64,linux/arm/v7,linux/arm64 --push -t #{CONTAINER_NAME} .}
  sh %{ docker pull #{CONTAINER_NAME} }
end

desc 'Use buildx to make a test container'
task :testbuild do
  puts "Building #{CONTAINER_NAME}"
  sh %{ docker buildx build --platform linux/amd64,linux/arm/v7,linux/arm64 --push -t #{CONTAINER_NAME}:testing .}
  sh %{ docker pull #{CONTAINER_NAME}:testing }
end

desc 'Build a test container and open a shell in it'
task :run => [:testbuild] do
  sh %{ docker run -v "#{ENV['HOME']}/.pihole-controller.yaml:/config/pihole-controller.yaml" --rm -it unixorn/pihole-controller:testing bash }
end

desc 'Build a test container and use it to disable the pihole in your settings file for 30 seconds'
task :disable => [:testbuild] do
  sh %{ docker run -v "#{ENV['HOME']}/.pihole-controller.yaml:/config/pihole-controller.yaml" --rm -it unixorn/pihole-controller:testing pihole-controller -c /config/pihole-controller.yaml --seconds 30 --log-level debug }
end

desc 'Lint the Dockerfile'
task :lint do
  sh %{ docker run --rm -i hadolint/hadolint < Dockerfile }
end
