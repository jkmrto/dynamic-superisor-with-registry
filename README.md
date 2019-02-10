# DynamicSupervisorWithRegistry

Dynamic Supervisor with Registry simple example.

## Installation
```
mix deps.get
mix deps.compile
mix compile
```

## To run in interactve mode

``` Bash
iex -S mix
```

Start three workers:

```Elxir
alias DynamicSupervisorWithRegistry.WorkersSupervisor
WorkersSupervisor.start_child("worker_1")
WorkersSupervisor.start_child("worker_2")
WorkersSupervisor.start_child("worker_3")
:observer.start()
```

Stopping worker:
```
alias DynamicSupervisorWithRegistry.Worker
Worker.stop("worker_1")
```

Crashing a worker:
```
alias DynamicSupervisorWithRegistry.Worker
Worker.crash("worker_2")
```
