# dev-container-stack

A modular Docker-based development environment designed for running AI agents and supporting services in isolated containers with seamless access to local project workspaces.

## Key Features

- **AI-Ready**: Comes pre-installed with Ollama and OpenCode.
- **Full-Stack Support**: Includes Node.js LTS, pnpm, yarn, and Python 3.
- **GPU Accelerated**: Configured to utilize NVIDIA GPUs for high-performance AI workloads.
- **Persistent Workspace**: Seamlessly maps your local workspace and Ollama data into the container.
- **Simplified Management**: A helper script to handle the entire container lifecycle.

## Prerequisites

- [Docker](https://docs.docker.com/get-docker/)
- [NVIDIA Container Toolkit](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html) (for GPU support)

## Getting Started

Use the provided `start-container.sh` script to manage your environment.

### 1. Build the Image
Build the Docker image based on the provided Dockerfile:
```bash
./start-container.sh build
```

### 2. Run the Container
Start a fresh container instance:
```bash
./start-container.sh run
```

### 3. Manage the Container
| Action | Command | Description |
| :--- | :--- | :--- |
| Start | `./start-container.sh start` | Starts the existing container or runs a new one |
| Exec | `./start-container.sh exec` | Opens a bash shell in the running container |
| Stop | `./start-container.sh stop` | Stops the running container |
| Remove | `./start-container.sh remove` | Deletes the container |
| Status | `./start-container.sh status` | Checks the container status |
| Logs | `./start-container.sh logs` | Follows the container logs |

## Included Tools

- **OS**: Ubuntu 24.04
- **AI**: Ollama, OpenCode
- **Languages**: Node.js (LTS), Python 3
- **Package Managers**: npm, pnpm, yarn, pip
- **Utilities**: git, curl, wget, vim, nano, htop, build-essential

## License

Refer to the `LICENSE` file for more details.
