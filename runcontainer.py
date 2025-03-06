import subprocess

# Define the Docker run command with --network="host"
docker_command = ["docker", "run", "--network=host", "mnist1"]

# Execute the Docker command
try:
    subprocess.run(docker_command, check=True)
    print("Docker container 'mnist1' is running successfully.")
except subprocess.CalledProcessError as e:
    print(f"Error running Docker container: {e}")
