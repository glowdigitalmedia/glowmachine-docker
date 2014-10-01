VAGRANTFILE_API_VERSION = "2"

Vagrant.require_version ">= 1.6.3"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.define "database" do |dc|
    dc.vm.provider "docker" do |d|
      # Image & build
      d.build_dir = "ubuntu"
      d.build_args = ["-t", "andreagrandi/glowmachine-dev:ubuntu", "--rm"]

      # Container & run
      d.name = "database"
      d.remains_running = false
    end
  end

  config.vm.define "postgresdata" do |pdc|
    pdc.vm.provider "docker" do |d|
      # Image
      d.image = "andreagrandi/glowmachine-dev:ubuntu"

      # Container & run
      d.name = "postgresdata"
      d.cmd = ["/bin/bash"]
      
      d.remains_running = false
    end
  end

  config.vm.define "mongodata" do |mdc|
    mdc.vm.provider "docker" do |d|
      # Image
      d.image = "andreagrandi/glowmachine-dev:ubuntu"
      
      # Container & run
      d.name = "mongodata"
      d.cmd = ["/bin/bash"]
      
      d.remains_running = false
    end
  end

  config.vm.define "postgresql" do |pc|
    pc.vm.provider "docker" do |d|
      # Image & build
      d.build_dir = "postgresql"
      d.build_args = ["-t", "andreagrandi/glowmachine-dev:postgresql", "--rm"]
      
      # Container & run
      d.name = "postgres"
      d.create_args = ["--volumes-from", "postgresdata"]
      d.cmd = ["/usr/lib/postgresql/9.3/bin/postgres", 
                "-D", "/var/lib/postgresql/9.3/main", 
                "-c", "config_file=/etc/postgresql/9.3/main/postgresql.conf"]
      d.ports = ["5432:5432"]
      
      d.remains_running = true
    end
  end

  config.vm.define "mongo" do |mc|
    mc.vm.provider "docker" do |d|
      # Image & build
      d.build_dir = "mongo"
      d.build_args = ["-t", "andreagrandi/glowmachine-dev:mongo", "--rm"]
      
      # Container & run
      d.name = "mongo"
      d.create_args = ["--volumes-from", "mongodata"]
      d.cmd = ["/usr/bin/mongod", "--noprealloc", "--smallfiles"]
      d.ports = ["27017:27017"]
      
      d.remains_running = true
    end
  end

  config.vm.define "web" do |wc|
    wc.vm.provider "docker" do |d|
      # Image & build
      d.build_dir = "web"
      d.build_args = ["-t", "andreagrandi/glowmachine-dev:web", "--rm"]
      
      # Container & run
      d.name = "web"
      d.create_args = ["-i", "-t"]
      d.cmd = ["/bin/bash"]

      d.ports = ["8000:8000"]
      d.link "postgres:postgres"
      d.link "mongo:mongo"
      
      d.remains_running = true
    end
    wc.vm.synced_folder ".", "/glowcode"
  end

end

